with orders as (
    
    select * from {{ ref('stg_tpch__orders') }}

),

line_item as (

    select * from {{ ref('stg_tpch__lineitems') }}

)

select 

    line_item.order_item_key,
    orders.order_key,
    orders.customer_key,
    line_item.part_key,
    line_item.supplier_key,
    orders.order_date,
    orders.status_code as order_status_code,
    line_item.return_flag,
    line_item.line_number,
    line_item.status_code as order_item_status_code,
    line_item.ship_date,
    line_item.commit_date,
    line_item.receipt_date,
    line_item.ship_mode,
    line_item.extended_price,
    line_item.quantity 
    from orders join line_item on orders.order_key = line_item.order_key