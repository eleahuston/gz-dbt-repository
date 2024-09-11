SELECT
    om.orders_id,
    om.date_date,
    ROUND((om.margin + sh.shipping_fee) - (sh.ship_cost + logcost), 2) AS operational_margin,
    om.quantity,
    om.revenue,
    om.purchase_cost,
    om.margin,
    sh.shipping_fee,
    sh.logcost,
    sh.ship_cost
FROM {{ ref('int_orders_margin') }} om
LEFT JOIN {{ ref('stg_raw__ship') }} sh
USING (orders_id)
ORDER BY om.orders_id DESC