-- Aggregate Window Functions Example
-- Use Case: Running totals & trends in payments
-- Functions: SUM(), AVG(), MIN(), MAX().
-- Interpretation:
-- •	SUM() with a window frame calculates a running total, e.g., cumulative revenue per guest over time.
-- •	AVG() with a sliding window frame computes the average of the last N payments.
-- •	MIN() and MAX() can identify the lowest and highest payments in a specified range.
-- •	Using ROWS counts physical rows, while RANGE considers all rows with the same value in the order, helping analyze patterns with or without duplicate dates.

SELECT 
    p.payment_id,
    p.payment_date,
    p.amount,

    -- Running total of payments ordered by date
    SUM(p.amount) OVER (
        ORDER BY p.payment_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total,

    -- Average payment in the last 3 rows (sliding window)
    AVG(p.amount) OVER (
        ORDER BY p.payment_date
        ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
    ) AS avg_last_3_payments

FROM payments p
ORDER BY p.payment_date
