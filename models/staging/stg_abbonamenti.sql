with source as (
    select * from {{ source('raw', 'abbonamenti') }}
),

renamed as (
    select
        id as abbonamento_id,
        id_ordine as ordine_id,
        cast(iniziato_il as timestamp) as iniziato_il,
        cast(finito_il as timestamp) as finito_il
    from source
)

select * from renamed