# PLSQL Window Functions – Mugisha Valens(27801)


## step 1: Problem Statement
### Business Context
Marriott Hotel Kigali, part of the global hospitality industry, experiencing the influx of foreign and domestic visitors because Rwanda is hosting the UCI Cycling World Championships. Customer service and operations departments are being directly felt because the occupancy rate is getting close to maximum capacity.
### Data Challenge
The hotel is unable to effectively manage guest demand, room supply, and service delivery at full occupancy. Pricing selection for rooms, staffing deployment, and long-term maintenance of customer satisfaction under increased pressure are difficult without absolute data-driven knowledge.
### Expected Outcome
The report must also provide best-practice pricing models, staff, and guest service enhancements that will generate most revenue while still guaranteeing a high-quality guest experience during and after the UCI event.


## step 3: Database Schema
- Guests: guest_id, first_name, last_name, email, country, created_at
- Rooms: room_id, room_number, room_type, capacity, base_rate
- Bookings: booking_id, guest_id, room_id, booking_date, checkin_date, checkout_date, status, num_guests, total_amount
- Payments: payment_id, booking_id, amount, payment_date, method
### ER diagram: 
- Guests make bookings, which can have associated payments.  
- Rooms are linked to bookings.  
- Bookings connect guests and rooms and track payments.
*this is well structured in my ER_diagram.png in `/Screenshots/` folder.


## step 4: Queries
*In each file there is comments that describes every working in `/SQL/` folder. *
1. Ranking – Identify top-spending guests
2. Aggregate – Running totals & trends in bookings
3. Navigation – Month-to-month revenue growth per guest
4. Distribution – Segment guests by total spending

## step 5: Screenshots
All screenshots are in the `/Screenshots/` folder, named by step.


## Step 6: Results Analysis
### Descriptive
- Top 10 guests account for 50% of revenue.
- Peak booking months: July–August.
- Month-to-month growth varies, some negative in off-peak months.
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
1. Oracle Help Center. *Window Function Concepts and Syntax*. [https://docs.oracle.com/mysql-8.0-en/window-functions.html](https://docs.oracle.com/mysql-8.0-en/window-functions.html).
2. W3Schools. SQL Window Functions. https://www.w3schools.com/sql/sql_window.asp.
3. Mullins, C. Database Administration & SQL Analytics. Academic Press, 2021.
4. GeeksforGeeks. *Window Functions in PL/SQL*. 24 Oct 2024. [https://www.geeksforgeeks.org/plsql/window-functions](https://www.geeksforgeeks.org/plsql/window-functions).
5. Oracle APEX Documentation. SQL Workshop. https://docs.oracle.com/en/database/oracle/apex/.
6. SQLShack. Understanding SQL Server Window Functions. https://www.sqlshack.com/sql-server-window-functions-overview/.
7. Kimball, R., & Ross, M. The Data Warehouse Toolkit. Wiley, 2019.
8. Stack Overflow. *How to use a WINDOW function with a CASE statement*. 11 Oct 2021. [https://stackoverflow.com](https://stackoverflow.com.
9. PostgreSQL Documentation. *Window Functions*. [https://www.postgresql.org/docs/current/tutorial-window.html](https://www.postgresql.org/docs/current/tutorial-window.html).
10. Oracle APEX Documentation. *SQL Workshop & Window Functions*. [https://docs.oracle.com/en/database/oracle/apex/](https://docs.oracle.com/en/database/oracle/apex/).


<<<<<<< HEAD
=======
>>>>>>> 9ee9439 (plsql window functons practice)
>>>>>>> 93c5690 (adding screenshots)
