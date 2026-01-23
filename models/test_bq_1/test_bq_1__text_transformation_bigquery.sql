{{
  config({    
    "materialized": "table",
    "alias": "my_spatial_table",
    "database": "prophecy-field",
    "schema": "chris_demos"
  })
}}

WITH city_list AS (

  WITH -- Dallas
  city_list AS (
  
    SELECT 'POINT(-84.3880 33.7490)' AS location
    
    UNION ALL
    
    SELECT 'POINT(-74.0060 40.7128)'
    
    UNION ALL
    
    SELECT 'POINT(-118.2437 34.0522)'
    
    UNION ALL
    
    SELECT 'POINT(-122.4194 37.7749)'
    
    UNION ALL
    
    SELECT 'POINT(-122.6765 45.5231)'
    
    UNION ALL
    
    SELECT 'POINT(-90.0715 29.9511)'
    
    UNION ALL
    
    SELECT 'POINT(-112.0740 33.4484)'
    
    UNION ALL
    
    SELECT 'POINT(-87.6298 41.8781)'
    
    UNION ALL
    
    SELECT 'POINT(-83.0458 42.3314)'
    
    UNION ALL
    
    SELECT 'POINT(-96.7970 32.7767)'
  
  )
  
  SELECT *
  
  FROM city_list

),

Buffer_1 AS (

  {#Expands city locations by a one-mile radius for geographic analysis.#}
  {{
    bg_test_cg_1.Buffer(
      'city_list', 
      [{ "name": "location", "dataType": "String" }], 
      'location', 
      1, 
      'miles'
    )
  }}

)

SELECT *

FROM Buffer_1
