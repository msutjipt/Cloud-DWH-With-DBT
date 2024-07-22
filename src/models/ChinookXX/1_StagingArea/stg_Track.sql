{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model:
  landing_zone: 'Track'
derived_columns:
  EFFECTIVE_FROM: LOAD_DATE
  RECORD_SOURCE: RECORD_SOURCE
  LOAD_DATE: LOAD_DATE
hashed_columns:
  TRACK_HK: TrackId
  ALBUM_HK: AlbumId
  GENRE_HK: GenreId
  MEDIATYPE_HK: MediaTypeId
  TRACK_HASHDIFF:
    is_hashdiff: true
    columns:
     - TrackId
     - Name
     - Composer
     - Milliseconds
     - Bytes
     - UnitPrice
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}