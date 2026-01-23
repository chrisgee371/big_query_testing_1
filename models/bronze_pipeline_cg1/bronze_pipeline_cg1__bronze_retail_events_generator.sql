{{
  config({    
    "materialized": "ephemeral",
    "database": "prophecy-field",
    "schema": "abhinav_demos"
  })
}}

WITH bronze_retail_events_generator AS (

  CREATE SCHEMA IF NOT EXISTS `your-project.demo_bronze`;
  
  CREATE TABLE IF NOT EXISTS `your-project.demo_bronze.bronze_retail_events` (
    ingest_date        DATE,
    ingest_ts          TIMESTAMP,
    source_file        STRING,
    row_in_file        INT64,
    event_id           STRING,
    event_ts_raw       STRING,
    order_id_raw       STRING,
    customer_id_raw    STRING,
    product_id_raw     STRING,
    store_id_raw       STRING,
    channel_raw        STRING,
    country_raw        STRING,
    city_raw           STRING,
    quantity_raw       STRING,
    unit_price_raw     STRING,
    discount_pct_raw   STRING,
    currency_raw       STRING,
    payment_method_raw STRING,
    status_raw         STRING,
    notes_raw          STRING,
    raw_payload        STRING
  )
  PARTITION BY ingest_date;

)

SELECT *

FROM bronze_retail_events_generator
