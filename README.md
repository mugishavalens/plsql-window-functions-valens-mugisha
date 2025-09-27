# PLSQL Window Functions – Mugisha Valens-27801

## Step 1: Problem Statement

### Business Context  
Marriott Hotel Kigali, part of the global hospitality industry, is experiencing an influx of foreign and domestic visitors because Rwanda is hosting the UCI Cycling World Championships. Customer service and operations departments are being directly affected because the occupancy rate is getting close to maximum capacity.

### Data Challenge  
The hotel is unable to effectively manage guest demand, room supply, and service delivery at full occupancy. Pricing selection for rooms, staffing deployment, and long-term maintenance of customer satisfaction under increased pressure are difficult without absolute data-driven knowledge.

### Expected Outcome  
The report must provide best-practice pricing models, staff, and guest service enhancements that will generate the most revenue while still guaranteeing a high-quality guest experience during and after the UCI event.



## Step 2: Success Criteria  

The project aims to achieve exactly **5 measurable goals** using PL/SQL window functions:  

1. **Top 5 Guests by Total Spending (Ranking)**  
   Using `RANK()` to identify the highest revenue-generating guests.  

2. **Running Monthly Revenue Totals (Aggregate)**  
   Using `SUM() OVER (PARTITION BY … ORDER BY …)` to track cumulative revenue trends.  

3. **Month-to-Month Revenue Growth (Navigation)**  
   Using `LAG()` and `LEAD()` to calculate growth percentages between months.  

4. **Guest Segmentation by Quartiles (Distribution)**  
   Using `NTILE(4)` to divide guests into quartiles based on spending levels.  

5. **3-Month Moving Average of Revenue (Aggregate with Frame Clause)**  
   ```sql
   SELECT
       booking_month,
       AVG(total_amount) OVER (
           ORDER BY booking_month
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS three_month_moving_avg
   FROM monthly_revenue;
   ```  
   This ensures short-term fluctuations are smoothed out, showing clearer revenue trends.  



## Step 3: Database Schema  

- **Guests**: guest_id, first_name, last_name, email, country, created_at  
- **Rooms**: room_id, room_number, room_type, capacity, base_rate  
- **Bookings**: booking_id, guest_id, room_id, booking_date, checkin_date, checkout_date, status, num_guests, total_amount  
- **Payments**: payment_id, booking_id, amount, payment_date, method  

**ER diagram**: Guests make bookings, which can have associated payments. Rooms are linked to bookings. Bookings connect guests and rooms and track payments.  
See `Screenshots/ER_diagram.png` for the full diagram.  



## Step 4: Queries (Window Functions Implementation)  

Queries are included in the `/SQL/` folder with inline comments. Categories implemented:  

- **Ranking** – Identify top-spending guests  
- **Aggregate** – Running totals & trends in bookings  
- **Navigation** – Month-to-month revenue growth per guest  
- **Distribution** – Segment guests by total spending  



## Step 5: Screenshots  

All screenshots are stored in the `/Screenshots/` folder, clearly named by step and query.  



## Step 6: Results Analysis  

### Descriptive  
- Top 10 guests account for 50% of revenue.  
- Peak booking months: July–August.  
- Month-to-month growth varies, with some negative in off-peak months.  
- Guests divided into quartiles; top quartile drives most revenue.  

### Diagnostic  
- High spenders book multiple/premium rooms.  
- Revenue spikes align with holidays; dips in off-season.  
- Growth fluctuations due to seasonal booking behavior.  
- Quartile distribution shows a few loyal guests dominate revenue.  

### Prescriptive  
- Target top-spending guests for loyalty campaigns.  
- Offer discounts/promotions in low-occupancy months.  
- Track declining guests and provide personalized offers.  
- Use quartile segmentation for upselling and marketing strategies.  



## Step 7: References  

1. Oracle Help Center. Window Function Concepts and Syntax. https://docs.oracle.com/mysql-8.0-en/window-functions.html  
2. W3Schools. SQL Window Functions. https://www.w3schools.com/sql/sql_window.asp  
3. Mullins, C. Database Administration & SQL Analytics. Academic Press, 2021.  
4. GeeksforGeeks. Window Functions in PL/SQL. 24 Oct 2024. https://www.geeksforgeeks.org/plsql/window-functions  
5. Oracle APEX Documentation. SQL Workshop. https://docs.oracle.com/en/database/oracle/apex/  
6. SQLShack. Understanding SQL Server Window Functions. https://www.sqlshack.com/sql-server-window-functions-overview/  
7. Kimball, R., & Ross, M. The Data Warehouse Toolkit. Wiley, 2019.  
8. Stack Overflow. How to use a WINDOW function with a CASE statement. 11 Oct 2021. https://stackoverflow.com  
9. PostgreSQL Documentation. Window Functions. https://www.postgresql.org/docs/current/tutorial-window.html  
10. Oracle APEX Documentation. SQL Workshop & Window Functions. https://docs.oracle.com/en/database/oracle/apex/  



## Academic Integrity Statement  

I certify that this work represents my own original research, analysis, and implementation.
This submission complies with the institution's academic integrity policies and represents honest scholarly work.
  

