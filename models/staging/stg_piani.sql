with source as (
    select * from {{ source('raw', 'piani') }}
),

renamed as (
    select
        id as piano_id,
        nome as piano_nome,
        prezzo as piano_prezzo,
        durata as piano_durata
    from source
)

select * from renamed