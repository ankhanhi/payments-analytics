# PAYMENTS ANALYTICS 

This task involved building a dashboard to display the percentage of successful payments per month for each payment type such as Visa, Mastercard, etc in the new_payments table. 

Columns in the final table: 

- `time` — aggregation month in the DD/MM/YY format, for instance, 01/12/19 
- `mode` — payment type 
- `percents` — the percentage of successful payments per month for the given payment type 

The result was sorted by time in ascending order and, for each month, by payment type in ascending alphabetical order such as ApplePay, GooglePay, etc. Transactions with the payment type "Not determined" were not considered. 

![alt text](https://github.com/ankhanhi/payments-analytics/blob/main/images/payments_dashboards.png)

### Tools and Libraries Used 
```
Redash
PostgreSQL
SQL
```
