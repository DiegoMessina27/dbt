with transazioni as (
    select * from {{ ref('stg_transazioni') }}
),

ordini as (
    select * from {{ ref('stg_ordini') }}
),

dim_piani as (
    select * from {{ ref('dim_piani') }}
),

dim_metodi as (
    select * from {{ ref('dim_metodi') }}
),

dim_coupon as (
    select * from {{ ref('dim_coupon') }}
)

select
    t.transazione_id,
    t.ordine_id,
    o.utente_id,

    p.piano_key,
    m.metodo_key,
    c.coupon_key,

    cast(t.data_transazione as date) as data_transazione,
    date_trunc(t.data_transazione, month) as mese_transazione,
    date_trunc(t.data_transazione, year) as anno_transazione,

    t.importo as importo_lordo,
    o.ha_coupon,

    case
        when o.ha_coupon then c.coupon_sconto
        else 0
    end as sconto_applicato,

    t.importo - case
        when o.ha_coupon then c.coupon_sconto
        else 0
    end as importo_netto

from transazioni t
inner join ordini o on t.ordine_id  = o.ordine_id
inner join dim_piani p on o.piano_id   = p.piano_id
inner join dim_metodi m on o.metodo_id  = m.metodo_id
left  join dim_coupon c on o.coupon_id  = c.coupon_id