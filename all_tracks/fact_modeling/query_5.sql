CREATE TABLE yousufh23.hosts_cumulated
 ( user_id BIGINT, host_activity_datelist map(VARCHAR, ARRAY(DATE)), Curr_Date DATE ) WITH ( FORMAT = 'PARQUET', partitioning = ['Curr_Date'] )
