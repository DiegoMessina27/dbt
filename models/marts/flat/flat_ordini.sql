with fct as (
    select * from {{ ref('fct_transazioni') }}
),

dim_piani as (
    select * from {{ ref('dim_piani') }}
),

dim_metodi as (
    select * from {{ ref('dim_metodi') }}
),

dim_coupon as (
    select * from {{ ref('dim_coupon') }}
),

abbonamenti as (
    select * from {{ ref('stg_abbonamenti') }}
),

rinnovi as (
    select * from {{ ref('stg_rinnovi') }}
)

select
    fct.transazione_id,
    fct.ordine_id,
    fct.utente_id,

    p.piano_nome,
    p.piano_prezzo,
    p.piano_durata,

    m.metodo_nome,

    fct.ha_coupon,
    c.coupon_codice,
    c.coupon_sconto,
    fct.sconto_applicato,

    fct.importo_lordo,
    fct.importo_netto,

    a.iniziato_il           as abbonamento_inizio,
    a.finito_il             as abbonamento_fine,

    r.will_renew            as rinnovo_attivo,

    fct.data_transazione,
    fct.mese_transazione,
    fct.anno_transazione

from fct
inner join dim_piani    p   on fct.piano_key    = p.piano_key
inner join dim_metodi   m   on fct.metodo_key   = m.metodo_key
left  join dim_coupon   c   on fct.coupon_key   = c.coupon_key
left  join abbonamenti  a   on fct.ordine_id    = a.ordine_id
left  join rinnovi      r   on fct.ordine_id    = r.ordine_id