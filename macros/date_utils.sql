{% macro station_of_year(x) %}
case 
    when month(to_timestamp({{x}})) in (12,1,2) 
    then 'WINTER'
    when month(to_timestamp({{x}})) in (3,4,5) 
    then 'SPRINT'
    when month(to_timestamp({{x}})) in (6,7,8) 
    then 'SUMMER'
    else 'AUTUMN'
end
{% endmacro %}

{% macro get_day_type(x)%}
case 
    when dayname(to_timestamp({{x}})) in ('Sat', 'Sun')
    then 'weekend'
    else 'businessday'
end
{% endmacro %}