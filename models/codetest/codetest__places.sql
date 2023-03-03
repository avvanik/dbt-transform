{{ config(materialized='table') }}

with source_places as (
    select * from {{ source('AIRBYTE_DATABASE', 'PLACES') }}
),

final as (
    select CITY_ID as ID, CITY, COUNTY, COUNTRY
    from source_places

)


select * 
from final