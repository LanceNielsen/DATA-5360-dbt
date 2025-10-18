{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

select
    c.Cust_Key,
    d.date_key,
    s.store_key,
    p.product_key,
    e.employee_key,
    ol.quantity,
    o.total_amount as dollars_sold,
    ol.unit_price
from {{ source('oliver_landing', 'orderline')}} as ol
    INNER JOIN {{ source('oliver_landing', 'orders')}} o on ol.order_id = o.order_id
    INNER JOIN {{ ref('oliver_dim_customer')}} c on o.customer_id = c.customer_id
    INNER JOIN {{ ref('oliver_dim_date')}} d on d.date_day = o.order_date
    INNER JOIN {{ ref('oliver_dim_store')}} s on o.store_id = s.store_id
    INNER JOIN {{ ref('oliver_dim_product')}} p on ol.product_id = p.product_id
    INNER JOIN {{ ref('oliver_dim_employee')}} e on o.employee_id = e.employee_id