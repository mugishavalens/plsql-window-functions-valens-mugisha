-- Segment guests into 4 spending quartiles
-- Functions: NTILE(), CUME_DIST().
-- Use Case: Segment guests by total spending.
-- Interpretation:
-- •	NTILE() divides guests into groups (quartiles) based on spending, useful for segmentation or targeted marketing.
-- •	CUME_DIST() shows the cumulative percentile of each guest’s spending, indicating what proportion of guests spent less or more.
-- •	Together, they help understand customer distribution and identify high-value or low-value guests

SELECT
    g.guest_id,
    g.first_name || ' ' || g.last_name AS guest_name,
    SUM(b.total_amount) AS total_spent,
    
    NTILE(4) OVER (ORDER BY SUM(b.total_amount) DESC) AS spending_quartile,  -- Quartile segmentation
    CUME_DIST() OVER (ORDER BY SUM(b.total_amount) DESC) AS cum_dist           -- Cumulative distribution (percentile)
FROM GUESTS g
JOIN BOOKINGS b ON g.guest_id = b.guest_id
GROUP BY g.guest_id, g.first_name, g.last_name
ORDER BY total_spent DESC;
