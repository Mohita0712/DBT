{% macro function1(x) %}

case when TO_TIMESTAMP({{x}}) < current_date then 'PAST'
else 'FUTURE' end

{% endmacro %}