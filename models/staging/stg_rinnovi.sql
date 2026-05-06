with source as (
    select * from {{ source('raw', 'rinnovi') }}
),

renamed as (
    select
        id          as rinnovo_id,
        id_ordine   as ordine_id,
        attivo      as will_renew
    from source
)

select * from renamed