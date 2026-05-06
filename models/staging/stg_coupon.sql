with source as (
    select * from {{ source('raw', 'coupon') }}
),

renamed as (
    select
        id as coupon_id,
        codice as coupon_codice,
        sconto as coupon_sconto
    from source
)

select * from renamed