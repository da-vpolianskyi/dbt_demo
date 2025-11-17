with
    cte as (
        select
            to_timestamp(started_at) as started_at,
            date(to_timestamp(started_at)) as date_started_at,
            hour(to_timestamp(started_at)) as hour_started_at,
            dayname(to_timestamp(started_at)) as day_name_started_at,
            case
                when dayname(to_timestamp(started_at)) in ('Sat', 'Sun')
                then 'weekend'
                else 'businessday'
            end as day_type,
            month(to_timestamp(started_at)) as month_started_at
        from {{ source("demo", "bike") }}
        where started_at != 'started_at'
    )

select *
from cte
