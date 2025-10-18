{{config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

select
    Employee_ID as employee_key,
    Employee_ID,
    First_Name,
    Last_Name,
    Email,
    phone_number,
    Hire_Date,
    Position
from {{ source('oliver_landing', 'employee')}}