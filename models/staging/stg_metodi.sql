with source as (
    select * from {{ source('raw', 'metodi') }}
),

renamed as (
    select
        id      as metodo_id,
        nome    as metodo_nome
    from source
)

select * from renamed