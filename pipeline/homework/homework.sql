SELECT COUNT(*)
FROM green_taxi_data
WHERE lpep_pickup_datetime >= '2025-11-01'
  AND lpep_pickup_datetime < '2025-12-01'
  AND trip_distance <= 1;

SELECT DATE(lpep_pickup_datetime) AS pickup_day, MAX(trip_distance) AS max_distance
FROM green_taxi_data
WHERE trip_distance < 100
GROUP BY pickup_day
ORDER BY max_distance DESC
LIMIT 1;

SELECT sum(green.total_amount) as amount, z."Zone"
FROM green_taxi_data green
JOIN zones z on green."PULocationID" = z."LocationID"
WHERE lpep_pickup_datetime >= '2025-11-18'
  AND lpep_pickup_datetime < '2025-11-19'
GROUP BY z."Zone"
ORDER BY amount DESC
LIMIT 1;

SELECT z_drop."Zone" AS dropoff_zone, g.tip_amount
FROM green_taxi_data g
JOIN zones z_pick ON g."PULocationID" = z_pick."LocationID"
JOIN zones z_drop ON g."DOLocationID" = z_drop."LocationID"
WHERE z_pick."Zone" = 'East Harlem North'
  AND g.lpep_pickup_datetime >= '2025-11-01'
  AND g.lpep_pickup_datetime < '2025-12-01'
ORDER BY g.tip_amount DESC
LIMIT 1;