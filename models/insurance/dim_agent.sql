--jinja code to create a table. we don't need to do any ddl just dml
{{config(
    materialized = 'table',
    schema = 'dw_insurance'
    ) 
}}

select
    agentid as agent_key,
    agentid,
    firstname,
    lastname,
    email,
    phone
from {{ source('insurance_landing', 'agents') }} --jinja sourse function. Better than hard code