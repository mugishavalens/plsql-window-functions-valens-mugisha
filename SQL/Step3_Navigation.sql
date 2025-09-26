-- Calculate month-to-month revenue and growth % for each guest
-- Functions: LAG(), LEAD().
-- Use Case: Analyze month-to-month total booking revenue per guest.                                
-- Interpretation:
-- •	LAG() allows comparison with previous periods, such as last month’s revenue for the same guest, helping calculate revenue change.
-- •	LEAD() looks forward, useful to predict or compare with the next period.
-- •	These functions make period-to-period analysis easy, supporting insights like growth rates and trends.

SELECT
    guest_id,
    TO_CHAR(booking_date, 'YYYY-MM') AS booking_month,
    SUM(total_amount) AS monthly_revenue,
    
    -- Previous month's revenue for comparison
    LAG(SUM(total_amount)) OVER (PARTITION BY guest_id ORDER BY TO_CHAR(booking_date, 'YYYY-MM')) AS prev_month_revenue,
    
    -- Revenue change from previous month
    SUM(total_amount) - LAG(SUM(total_amount)) OVER (PARTITION BY guest_id ORDER BY TO_CHAR(booking_date, 'YYYY-MM')) AS revenue_change,
    
    -- Growth percentage from previous month
    ROUND(
        ((SUM(total_amount) - LAG(SUM(total_amount)) OVER (PARTITION BY guest_id ORDER BY TO_CHAR(booking_date, 'YYYY-MM')))
        / LAG(SUM(total_amount)) OVER (PARTITION BY guest_id ORDER BY TO_CHAR(booking_date, 'YYYY-MM')) * 100), 2
    ) AS growth_pct
FROM BOOKINGS
GROUP BY guest_id, TO_CHAR(booking_date, 'YYYY-MM')
ORDER BY guest_id, booking_month;
