-- View Helper Functions
CREATE OR REPLACE FUNCTION get_week_start() RETURNS DATE AS
    $$ SELECT CURRENT_DATE - EXTRACT(DOW FROM CURRENT_DATE)::INT4 $$
    LANGUAGE SQL;

CREATE OR REPLACE FUNCTION get_month_start() RETURNS DATE AS
    $$ SELECT CURRENT_DATE - EXTRACT(DAY FROM CURRENT_DATE)::INT4 + 1 $$
    LANGUAGE SQL;

CREATE OR REPLACE FUNCTION get_calendar(start DATE, finish DATE) RETURNS TABLE(
    username VARCHAR(255),
    habit_id INT4,
    title VARCHAR(255),
    day DATE,
    complete BOOL,
    time_spent INTERVAL HOUR TO SECOND (0),
    habit_rating FLOAT4,
    display_color CHAR(7))
    AS $$
    SELECT h.username, h.habit_id, h.title, i.day, i.complete, i.time_spent, i.habit_rating, c.display_color
    FROM habit h
    INNER JOIN habit_instance i ON h.habit_id = i.habit_id
    INNER JOIN category c ON h.category_name = c.category_name
    WHERE day BETWEEN start AND finish
    $$
    LANGUAGE SQL;
    
    
-- TRIGGERS
CREATE OR REPLACE FUNCTION trigger_save_deleted_habit() 
    RETURNS TRIGGER AS $$
    BEGIN
    	INSERT INTO deleted_habits (
		habit_id, title, description, timed, ratable, category_name, username)
	VALUES (OLD);
	RETURN OLD;
    END;
    $$ LANGUAGE plpgsql;

CREATE TRIGGER save_deleted_habit
    BEFORE DELETE ON habit
    FOR EACH ROW
    EXECUTE PROCEDURE trigger_save_deleted_habit();


-- JWT Helper Functions
CREATE OR REPLACE FUNCTION url_encode(data BYTEA) RETURNS TEXT AS
    $$ SELECT translate(encode(data, 'base64'), E'+/=\n', '-_');
    $$
    LANGUAGE SQL;

CREATE OR REPLACE FUNCTION algorithm_sign(signables TEXT, secret TEXT, algorithm TEXT)
RETURNS TEXT AS
    $$ WITH
      alg AS (
        SELECT CASE
          WHEN algorithm = 'HS256' THEN 'sha256'
          WHEN algorithm = 'HS384' THEN 'sha384'
          WHEN algorithm = 'HS512' THEN 'sha512'
          ELSE '' END AS id)
    SELECT url_encode(hmac(signables, secret, alg.id)) FROM alg;
    $$
    LANGUAGE SQL;

CREATE OR REPLACE FUNCTION sign(payload JSON, secret TEXT, algorithm TEXT DEFAULT 'HS512')
RETURNS TEXT AS
    $$ WITH
      header AS (
        SELECT url_encode(convert_to('{"alg":"' || algorithm || '","typ":"JWT"}', 'utf8')) AS data),
      payload AS (
        SELECT url_encode(convert_to(payload::TEXT, 'utf8')) AS data),
      signables AS (
        SELECT header.data || '.' || payload.data AS data FROM header, payload)
    SELECT signables.data || '.' ||
           algorithm_sign(signables.data, secret, algorithm) FROM signables;
    $$
    LANGUAGE SQL;

-- Authentication Endpoints
CREATE OR REPLACE FUNCTION public.register(username VARCHAR(255), password_hash VARCHAR(255),
        email VARCHAR(128), mobile_phone VARCHAR(18)) RETURNS VOID AS
    $$ INSERT INTO user_account (username, password_hash, email, mobile_phone, privilege_level)
    VALUES (register.username, register.password_hash, register.email, register.mobile_phone, 'b');
    $$
    LANGUAGE SQL SECURITY DEFINER;

CREATE OR REPLACE FUNCTION public.login(username VARCHAR(255), password_hash VARCHAR(255)) RETURNS TEXT AS
    $$ DECLARE
      _username VARCHAR(255);
      _jwt_token TEXT;
    BEGIN
      SELECT user_account.username FROM user_account
      WHERE user_account.username = login.username AND user_account.password_hash = login.password_hash
      INTO _username;
      
      IF _username IS NULL THEN
	RAISE invalid_password USING message = 'incorrect username or password';
      END IF;
      
      SELECT sign(row_to_json(admins), current_setting('app.settings.jwt_secret')) AS token
      FROM (
        SELECT 'admins' AS role, _username,
       	        EXTRACT(EPOCH FROM NOW())::INTEGER + 3600*60*60 AS exp
      ) admins
      INTO _jwt_token;

      RETURN _jwt_token;
    END;
    $$
    LANGUAGE PLPGSQL SECURITY DEFINER;

