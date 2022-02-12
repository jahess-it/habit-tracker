CREATE VIEW journals AS
    SELECT day, journal, day_rating
    FROM day_summary
    WHERE username = 'jonsnow';

CREATE VIEW admin_view AS
    SELECT username, title
    FROM habit
