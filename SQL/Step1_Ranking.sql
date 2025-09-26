-- Ranking Functions Example
-- Use Case: Top customers by revenue
-- Functions: ROW_NUMBER(), RANK(), DENSE_RANK(), PERCENT_RANK().                                                                                                                    
-- Interpretation:
-- ROW_NUMBER():assigns a unique position to each guest based on total spending, so even if two guests spent the same   amount, their row numbers differ.
-- RANK(): gives the same rank to guests with equal spending, creating gaps in the sequence for subsequent guests.
-- DENSE_RANK(): also gives the same rank to ties but does not leave gaps, making it useful for leaderboard displays.
-- PERCENT_RANK(): shows the guest’s relative standing as a percentile, helping identify top or bottom spenders proportionally.

SELECT 
    g.guest_id,
    g.first_name || ' ' || g.last_name AS guest_name,
    SUM(p.amount) AS total_revenue,
    ROW_NUMBER() OVER (ORDER BY SUM(p.amount) DESC) AS row_num,
    RANK()       OVER (ORDER BY SUM(p.amount) DESC) AS rank_num,
    DENSE_RANK() OVER (ORDER BY SUM(p.amount) DESC) AS dense_rank_num,
    PERCENT_RANK() OVER (ORDER BY SUM(p.amount) DESC) AS percent_rank
FROM guests g
JOIN bookings b ON g.guest_id = b.guest_id
JOIN payments p ON b.booking_id = p.booking_id
GROUP BY g.guest_id, g.first_name, g.last_name;
