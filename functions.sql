CREATE FUNCTION get_current_day() RETURNS DATE AS
    $$ SELECT CURRENT_DATE $$
    LANGUAGE SQL;

CREATE FUNCTION get_week_start() RETURNS DATE AS
    $$ SELECT CURRENT_DATE - EXTRACT(DOW FROM CURRENT_DATE)::INT4 $$
    LANGUAGE SQL;

CREATE FUNCTION get_month_start() RETURNS DATE AS
    $$ SELECT CURRENT_DATE - EXTRACT(DAY FROM CURRENT_DATE)::INT4 + 1 $$
    LANGUAGE SQL;

CREATE FUNCTION get_calendar(start DATE, finish DATE) RETURNS TABLE(
    habit_id INT4,
    title VARCHAR(255),
    day DATE,
    complete BOOL,
    time_spent INTERVAL HOUR TO SECOND (0),
    habit_rating FLOAT4,
    display_color CHAR(7))
    AS $$
    SELECT h.habit_id, h.title, i.day, i.complete, i.time_spent, i.habit_rating, c.display_color
    FROM habit h
    INNER JOIN habit_instance i ON h.habit_id = i.habit_id
    INNER JOIN category c ON h.category_name = c.category_name
    WHERE day BETWEEN start AND finish
    $$
    LANGUAGE SQL;

