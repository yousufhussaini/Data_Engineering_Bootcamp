
SELECT 
    device_id,
    MAP_AGG(device_id, ARRAY_AGG(DISTINCT event_date)) AS device_activity_datelist
FROM
    user_devices_cumulated
JOIN events on user_devices_cumulated.device_id = events.device_id
GROUP BY
    device_id
