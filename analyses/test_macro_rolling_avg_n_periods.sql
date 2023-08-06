select
    date_month,
    user_id,
    subscription_id,
    mrr_amount,
{{ rolling_average_n_periods (
        agg_func='avg',
        column_name='mrr_amount',
        partition_by='user_id,subscription_id',
        order_by='date_month',
        n=7) }}
from {{ ref('mrr') }}
