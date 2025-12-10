
{%- macro Buffer(table_name, schema, geom_column_name, distance, unit) -%}
  {{ return(adapter.dispatch('Buffer', 'bg_test_cg_1')(
    table_name,
    schema,
    geom_column_name,
    distance,
    unit
  )) }}
{%- endmacro -%}


{%- macro default__Buffer(table_name, schema, geom_column_name, distance, unit) -%}
  {{ log("table_name=" ~ table_name, info=True) }}
  {{ log("schema=" ~ schema, info=True) }}
  {{ log("geom_column_name=" ~ geom_column_name, info=True) }}
  {{ log("distance=" ~ distance, info=True) }}
  {{ log("unit=" ~ unit, info=True) }}

  {%- if unit == 'kilometers' -%}
    {%- set distance_meters = distance * 1000 -%}
  {%- else -%}
    {%- set distance_meters = distance * 1609.34 -%}
  {%- endif -%}

  SELECT
    {{geom_column_name}} as input,
    ST_AsText(
      ST_Transform(
        ST_Buffer(
          ST_Transform(
            ST_GeomFromText({{geom_column_name}}, 4326),
            3857
          ),
          {{distance_meters}}
        ),
        4326
      )
    ) as output
  FROM
    {{table_name}}

{%- endmacro -%}


{%- macro duckdb__Buffer(table_name, schema, geom_column_name, distance, unit) -%}
  {{ log("table_name=" ~ table_name, info=True) }}
  {{ log("schema=" ~ schema, info=True) }}
  {{ log("geom_column_name=" ~ geom_column_name, info=True) }}
  {{ log("distance=" ~ distance, info=True) }}
  {{ log("unit=" ~ unit, info=True) }}

  {%- set _distance = distance | float -%}
  {%- if unit == 'kilometers' -%}
    {%- set distance_meters = _distance * 1000 -%}
  {%- else -%}
    {%- set distance_meters = _distance * 1609.34 -%}
  {%- endif -%}

  SELECT
    {{ geom_column_name }} AS input,
    ST_AsText(
      ST_Transform(
        ST_Buffer(
          ST_Transform(
            ST_GeomFromText({{ geom_column_name }}),
            'EPSG:4326',
            'EPSG:3857',
            always_xy := true
          ),
          {{ distance_meters }}
        ),
        'EPSG:3857',
        'EPSG:4326',
        always_xy := true
      )
    ) AS output
  FROM
    {{ table_name }}

{%- endmacro -%}


{%- macro bigquery__Buffer(table_name, schema, geom_column_name, distance, unit) -%}
  {{ log("table_name=" ~ table_name, info=True) }}
  {{ log("schema=" ~ schema, info=True) }}
  {{ log("geom_column_name=" ~ geom_column_name, info=True) }}
  {{ log("distance=" ~ distance, info=True) }}
  {{ log("unit=" ~ unit, info=True) }}

  {%- set _distance = distance | float -%}
  {%- if unit == 'kilometers' -%}
    {%- set distance_meters = _distance * 1000 -%}
  {%- else -%}
    {%- set distance_meters = _distance * 1609.34 -%}
  {%- endif -%}

  SELECT
    {{ geom_column_name }} AS input,
    ST_ASTEXT(
      ST_BUFFER(
        ST_GEOGFROMTEXT({{ geom_column_name }}),
        {{ distance_meters }}
      )
    ) AS output
  FROM
    {{ table_name }}

{%- endmacro -%}

