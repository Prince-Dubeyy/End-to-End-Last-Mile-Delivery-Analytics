-- Total Orders KPI
SELECT 
    COUNT(order_id) AS total_orders
FROM orders;

-- Average Delivery Time KPI
SELECT 
    ROUND(AVG(delivery_time),2) AS avg_delivery_time
FROM orders;

-- High Risk Orders KPI
SELECT 
    COUNT(order_id) AS high_risk_orders
FROM orders
WHERE risk_exposure > 0.6;

-- Average Distance KPI
SELECT 
    ROUND(AVG(total_distance),2) AS avg_distance_km
FROM orders;

-- Average Risk Exposure KPI
SELECT 
    ROUND(AVG(risk_exposure),2) AS avg_risk_exposure
FROM orders;

------------------------------------------------------------

-- Delivery Efficiency Across Distance Categories
SELECT 
    distance_category,
    ROUND(AVG(delivery_time),2) AS avg_delivery_time
FROM orders
GROUP BY distance_category
ORDER BY avg_delivery_time DESC;

------------------------------------------------------------

-- Risk Exposure Across Time Slots
SELECT 
    time_slot,
    ROUND(AVG(risk_exposure),2) AS avg_risk_exposure
FROM orders
GROUP BY time_slot
ORDER BY avg_risk_exposure DESC;

------------------------------------------------------------

-- Daily Order Volume Trend
SELECT 
    order_date,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_date
ORDER BY order_date;

------------------------------------------------------------

-- Orders by Time Slot
SELECT 
    time_slot,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY time_slot
ORDER BY total_orders DESC;

------------------------------------------------------------

-- Order Distribution by Distance Category
SELECT 
    distance_category,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY distance_category
ORDER BY total_orders DESC;

------------------------------------------------------------

-- Peak vs Non-Peak Performance
SELECT 
    peak_status,
    ROUND(AVG(delivery_time),2) AS avg_delivery_time,
    ROUND(AVG(risk_exposure),2) AS avg_risk_exposure
FROM orders
GROUP BY peak_status;

------------------------------------------------------------

-- Time Slot Wise Distance Analysis
SELECT 
    time_slot,
    ROUND(AVG(total_distance),2) AS avg_distance
FROM orders
GROUP BY time_slot
ORDER BY avg_distance DESC;

------------------------------------------------------------

-- Distance Category Wise Risk Analysis
SELECT 
    distance_category,
    ROUND(AVG(risk_exposure),2) AS avg_risk_exposure
FROM orders
GROUP BY distance_category
ORDER BY avg_risk_exposure DESC;