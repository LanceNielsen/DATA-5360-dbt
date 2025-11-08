{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

select
    c.First_Name as CustomerFirstName,
    c.Last_Name as CustomerLastName,
    d.date_day as SaleDate,
    s.Store_name as StoreName,
    p.product_name as ProductName,
    f.quantity as quantity,
    f.dollars_sold as DollarsSold
from {{ ref('fact_sales')}} f
    LEFT JOIN {{ ref('oliver_dim_customer') }} c on f.cust_key = c.cust_key
    LEFT JOIN {{ ref('oliver_dim_date') }} d on f.date_key = d.date_key
    LEFT JOIN {{ ref('oliver_dim_store') }} s on f.store_key = s.store_key
    LEFT JOIN {{ ref('oliver_dim_product') }} p on f.product_key = p.product_key