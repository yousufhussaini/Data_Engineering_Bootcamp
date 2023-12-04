
CREATE TABLE user_devices_cumulated (
user_id VARCHAR,
device_id VARCHAR,
host VARCHAR,
event_time VARCHAR,

    device_activity_datelist MAP<STRING, ARRAY[DATE]>
)
