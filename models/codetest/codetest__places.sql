{{ config(materialized='table') }}

with places as (
    select * 
    from {{ source('AIRBYTE_DATABASE', 'PLACES') }}
),

final as (
    select 
        cast(city_id as varchar(10)) as id, 
        cast(city as varchar(30)) as city, 
        cast(county as varchar(30)) as county, 
        cast(country as varchar(30)) as country

    from places

    order by country

)


select * 
from final