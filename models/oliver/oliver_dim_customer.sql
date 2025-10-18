{{config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

select
    CUSTOMER_ID as Cust_Key,
    CUSTOMER_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PHONE_NUMBER,
    STATE
from {{ source('oliver_landing', 'customer')}}