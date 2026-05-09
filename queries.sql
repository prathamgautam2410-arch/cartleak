-- ============================================================
-- CartLeak: E-Commerce Funnel Drop-Off Analysis
-- Dataset : REES46 E-Commerce Events (October 2019)
-- Tool    : SQLite via DBeaver
-- Analyst : Pratham Gautam
-- ============================================================


-- ------------------------------------------------------------
-- QUERY 1: Overall Funnel Metrics
-- Purpose : Count distinct users at each stage of the funnel
--           (view → cart → purchase) and calculate what
--           percentage of viewers reached each stage.
-- ------------------------------------------------------------
SELECT
    event_type,
    COUNT(DISTINCT user_id) AS unique_users,
    ROUND(COUNT(DISTINCT user_id) * 100.0 /
        (SELECT COUNT(DISTINCT user_id) FROM events_oct WHERE event_type = 'view'), 2)
    AS pct_of_viewers
FROM events_oct
WHERE user_id % 10 = 0          -- 10% sample, sampled by user to preserve full journeys
GROUP BY event_type
ORDER BY unique_users DESC;


-- ------------------------------------------------------------
-- QUERY 2: Category-Level Funnel Breakdown
-- Purpose : For each product category, count viewers, cart-adds
--           and purchasers, then compute the view-to-purchase
--           conversion rate. NULLIF prevents divide-by-zero.
-- ------------------------------------------------------------
SELECT
    category_code,
    COUNT(DISTINCT CASE WHEN event_type = 'view'     THEN user_id END) AS viewers,
    COUNT(DISTINCT CASE WHEN event_type = 'cart'     THEN user_id END) AS carted,
    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchasers,
    ROUND(COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) * 100.0 /
        NULLIF(COUNT(DISTINCT CASE WHEN event_type = 'view' THEN user_id END), 0), 2)
    AS conversion_rate
FROM events_oct
WHERE user_id % 10 = 0
  AND category_code IS NOT NULL
GROUP BY category_code
ORDER BY viewers DESC
LIMIT 10;


-- ------------------------------------------------------------
-- QUERY 3: Hourly Purchase Trend
-- Purpose : Break down user activity by hour of day and event
--           type to identify peak purchasing windows and high
--           cart-abandonment periods.
--           SUBSTR extracts characters 12-13 from the
--           event_time string (format: YYYY-MM-DD HH:MM:SS).
-- ------------------------------------------------------------
SELECT
    CAST(SUBSTR(event_time, 12, 2) AS INTEGER) AS hour_of_day,
    event_type,
    COUNT(DISTINCT user_id) AS unique_users
FROM events_oct
WHERE user_id % 10 = 0
GROUP BY hour_of_day, event_type
ORDER BY hour_of_day;
