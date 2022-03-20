CREATE OR REPLACE VIEW upcoming AS
    SELECT * FROM get_calendar(CURRENT_DATE,
        CURRENT_DATE + 1);

CREATE OR REPLACE VIEW week AS
    SELECT * FROM get_calendar(get_week_start(),
        get_week_start() + 6);

CREATE OR REPLACE VIEW month AS
    SELECT * FROM get_calendar(get_month_start(),
        (get_month_start() + INTERVAL '1 month -1 day')::DATE);

CREATE OR REPLACE VIEW journal AS
    SELECT day, username, journal, day_rating
    FROM day_summary
    ORDER BY day;

CREATE OR REPLACE VIEW admin AS
    SELECT username, title
    FROM habit;

