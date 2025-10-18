{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

select
    c.First_Name as "Customer First Name",
    c.Last_Name as "Customer Last Name",
    d.date_day as "Sale Date",
    s.Store_name as "Store Name",
    p.product_name as "Product Name",
    f.quantity as "quantity",
    f.dollars_sold as "Dollars Sold"
from {{ ref('fact_sales')}} f
    LEFT JOIN {{ ref('dim_customer') }} c on f.cust_key = c.cust_key
    LEFT JOIN {{ ref('oliver_dim_date') }} d on f.date_key = d.date_key
    LEFT JOIN {{ ref('oliver_dim_store') }} s on f.store_key = s.store_key
    LEFT JOIN {{ ref('oliver_dim_product') }} p on f.product_key = p.product_key