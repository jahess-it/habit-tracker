CREATE VIEW day AS
    SELECT * FROM get_calendar(CURRENT_DATE),
        CURRENT_DATE + 1);

CREATE VIEW week AS
    SELECT * FROM get_calendar(get_week_start(),
        get_week_start() + 6);

CREATE VIEW month AS
    SELECT * FROM get_calendar(get_month_start(),
        (get_month_start() + INTERVAL '1 month -1 day')::DATE);

CREATE VIEW journals AS
    SELECT day, journal, day_rating
    FROM day_summary;

CREATE VIEW admin AS
    SELECT username, title
    FROM habit;

