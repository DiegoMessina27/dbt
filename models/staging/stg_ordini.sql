with source as (
    select * from {{ source('raw', 'ordini') }}
),

renamed as (
    select
        id as ordine_id,
        id_utente as utente_id,
        id_piano as piano_id,
        id_metodo as metodo_id,
        id_coupon as coupon_id,
        cast(data_ordine as timestamp)as data_ordine,
        id_coupon is not null as ha_coupon
    from source
)

select * from renamed