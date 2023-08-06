{%  macro rolling_average_n_periods (agg_func, column_name, partition_by, order_by, n) %}
{{agg_func}}( {{column_name}} ) OVER (
        PARTITION BY {{partition_by}}
        ORDER BY {{order_by}}
        ROWs BETWEEN {{n}} PRECEDING AND CURRENT ROW
        ) AS avg_{{n}}_periods_{{ column_name }}
{% endmacro %}
