with source as (
    select * from {{ source('raw', 'transazioni') }}
),

renamed as (
    select
        id                                  as transazione_id,
        id_ordine                           as ordine_id,
        cast(data_transazione as timestamp) as data_transazione,
        cast(importo as numeric)            as importo
    from source
)

select * from renamed