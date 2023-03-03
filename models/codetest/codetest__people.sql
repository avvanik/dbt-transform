with source_people as (
    select * from {{ source('AIRBYTE_DATABASE', 'PEOPLE') }}
),

final as (
    select PERSON_ID as ID, FAMILY_NAME, GIVEN_NAME, DATE_OF_BIRTH, PLACE_OF_BIRTH
    from source_people
)


select * 
from final