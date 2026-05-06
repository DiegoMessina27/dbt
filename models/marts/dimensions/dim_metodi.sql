with metodi as (
    select * from {{ ref('stg_metodi') }}
)

select
    cast(metodo_id as string)   as metodo_key,
    metodo_id,
    metodo_nome
from metodi