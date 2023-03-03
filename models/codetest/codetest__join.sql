{{ config(materialized='table') }}

with places as (
    select * from {{ source('AIRBYTE_DATABASE', 'PLACES') }}
),

people as (
    select * from {{ source('AIRBYTE_DATABASE', 'PEOPLE') }}
),

final as (

    select 
        cast(count(people.person_id) as integer) as people_born, 
        cast(places.county as varchar(30)) as county, 
        cast(places.country as varchar(30)) as country
        
    from people

    left join places
        on people.place_of_birth = places.city 

    group by places.county, places.country
    order by people_born desc

)

select * from final