CREATE SCHEMA api;

CREATE VIEW api.upcoming AS
    SELECT * FROM get_calendar(CURRENT_DATE,
        CURRENT_DATE + 1);

CREATE VIEW api.week AS
    SELECT * FROM get_calendar(get_week_start(),
        get_week_start() + 6);

CREATE VIEW api.month AS
    SELECT * FROM get_calendar(get_month_start(),
        (get_month_start() + INTERVAL '1 month -1 day')::DATE);

CREATE VIEW api.journals AS
    SELECT day, journal, day_rating
    FROM day_summary;

CREATE VIEW api.admin AS
    SELECT username, title
    FROM habit;

