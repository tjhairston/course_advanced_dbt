-- subscription plan prices cannot be negative, so the pricing should always be >0.
-- This returns records where this isn't true to make the test fail.
SELECT
    *
FROM {{ ref('stg_bingflix_subscription_plan')}}
WHERE pricing <= 0
