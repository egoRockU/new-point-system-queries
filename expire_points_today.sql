-- THIS WOULD UPDATE A LOT OF ROWS, BE MINDFUL ON DATES THAT YOU WILL BE TESTING

UPDATE staging.myapp_rewardpoints
SET 
    expired_points = expired_points + remaining_points,
    remaining_points = 0
WHERE 
    DATE_FORMAT(expiration_date, '%Y-%m-%d') = '2025-09-03' -- change to date today
    AND remaining_points != 0;