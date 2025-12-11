{% test minimum_row_count(model, min_row_count) %}
--- {{ config(severity='warn') }} place this here if you want the default severity to be warn, if placing here then is not needed in schema.yml
    SELECT 
        COUNT(*) AS cnt 
    FROM {{model}}
    HAVING
        COUNT(*) < {{min_row_count}}
{% endtest %} --- custom generic test with Parameters