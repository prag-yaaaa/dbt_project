{%- macro no_empty_strings(model) -%}
   {%- for col in adapter.get_columns_in_relation(model) -%}
        {%- if col.is_string() %}
            {{ col.name }} IS NOT NULL AND {{ col.name }} <> '' AND
        {%- endif %}
    {%- endfor %}
    TRUE
{%- endmacro -%} 

--- to compile this use in terminal the following command:
--- bt compile --inline '{{ no_empty_strings(ref("dim_listings_cleansed")) }}' --profiles-dir ~/.dbt 

--- compile with whole statement
--- dbt compile --inline 'SELECT * FROM {{ref("dim_listings_cleansed") }} WHERE {{ no_empty_strings(ref("dim_listings_cleansed")) }}' --profiles-dir ~/.dbt

--- to show the results
--- dbt show --inline 'SELECT * FROM {{ref("dim_listings_cleansed") }} WHERE {{ no_empty_strings(ref("dim_listings_cleansed")) }}' --profiles-dir ~/.dbt