INSERT INTO staging.myapp_rewardpoints (
  user_email, points_earned, points_redeemed,
  remaining_points, expired_points,
  earned_date, expiration_date
)
SELECT
  user_email,
  current_points AS points_earned,
  0 AS points_redeemed,
  current_points AS remaining_points,
  0 AS expired_points,
  DATE '2025-07-01' AS earned_date,
  DATE_ADD(DATE('2025-07-01'), INTERVAL 90 DAY) AS expiration_date
FROM staging.myapp_userwallet
WHERE user_email IS NOT NULL;