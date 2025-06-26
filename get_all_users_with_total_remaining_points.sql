SELECT rp.user_email, 
	cu.first_name, 
    SUM(rp.remaining_points) AS total_remaining_points, 
    DATE_FORMAT(rp.expiration_date, '%Y-%m-%d') AS expiration_date
FROM staging.myapp_rewardpoints rp
JOIN staging.myapp_customuser cu ON rp.user_email = cu.email
WHERE DATE_FORMAT(rp.expiration_date, '%Y-%m-%d') = '2025-09-03' -- change to date now + 3 days
AND rp.remaining_points != 0
GROUP BY rp.user_email, cu.first_name, DATE_FORMAT(rp.expiration_date, '%Y-%m-%d');
