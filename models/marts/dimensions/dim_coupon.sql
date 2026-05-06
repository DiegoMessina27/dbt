with coupon as (
    select * from {{ ref('stg_coupon') }}
)

select
    cast(coupon_id as string)   as coupon_key,
    coupon_id,
    coupon_codice,
    coupon_sconto
from coupon