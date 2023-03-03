{{ config(materialized='table') }}

with people as (
    select *
    from {{ source('AIRBYTE_DATABASE', 'PEOPLE') }}
),

final as (
    select 
        cast(person_id as varchar(10)) as id, 
        cast(family_name as varchar(30)) as family_name, 
        cast(given_name as varchar(30)) as given_name, 
        cast(date_of_birth as date) as date_of_birth, 
        cast(place_of_birth as varchar(30)) as place_of_birth

    from people

    order by family_name, given_name
)

select * 
from final
