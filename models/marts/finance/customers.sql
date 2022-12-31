with customer as (

    select * from {{ ref('stg_tpch__customers') }}

),
nation as (

    select * from {{ ref('stg_tpch__nations') }}
),

final as (
    select 
        customer.customer_key,
        customer.name,
        customer.address,
        nation.name as nation,
        customer.phone_number,
        customer.account_balance,
        customer.market_segment
    from
        customer
        inner join nation
            on customer.nation_key = nation.nation_key
)
select 
    *
from
    final
order by
    customer_key