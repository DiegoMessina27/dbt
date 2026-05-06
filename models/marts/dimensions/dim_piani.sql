with piani as (
    select * from {{ ref('stg_piani') }}
)

select
    cast(piano_id as string)    as piano_key,
    piano_id,
    piano_nome,
    piano_prezzo,
    piano_durata
from piani