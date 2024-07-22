{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model:
  landing_zone: 'Invoice'
derived_columns:
  EFFECTIVE_FROM: InvoiceDate
  RECORD_SOURCE: RECORD_SOURCE
  LOAD_DATE: LOAD_DATE
hashed_columns:
  INVOICE_HK: InvoiceId
  CUSTOMER_HK: CustomerId
  INVOICE_HASHDIFF:
    is_hashdiff: true
    columns:
     - InvoiceId
     - InvoiceDate
     - BillingAddress
     - BillingCity
     - BillingState
     - BillingCountry
     - BillingPostalCode
     - Total
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}