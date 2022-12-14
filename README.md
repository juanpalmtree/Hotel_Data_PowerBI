# The Hotel Revenue Analysis Script :hotel:

The following script uses the hotels table by combining data from three different tables: dbo['2018$'], dbo['2019$'], and dbo['2020$']. 
This hotels table is then used to answer the following questions: 

## Is the hotel revenue growing by year?

To answer this question, the following query can be used:

```
SELECT
    arrival_date_year,
    hotel,
    ROUND(SUM((stays_in_week_nights + stays_in_weekend_nights) * adr), 2) AS Revenue
FROM hotels
GROUP BY arrival_date_year, hotel;
```

This query creates a new Revenue column by calculating the sum of the product of the 
stays_in_week_nights and stays_in_weekend_nights columns with the adr (average daily rate) column. 
This Revenue column is then used to group the data by year and hotel in order to see if revenue is growing by year.


## How does market segment and meal cost affect revenue?

To answer this question, the following query can be used:

```
SELECT *
FROM hotels
LEFT JOIN dbo.market_segment$ ON hotels.market_segment = market_segment$.market_segment
LEFT JOIN dbo.meal_cost$ ON meal_cost$.meal = hotels.meal;
```

This query joins the hotels table with the dbo.market_segment$ and dbo.meal_cost$ tables on the market_segment and meal columns, respectively.
This allows the data to be organized together and prepared for visualization, which can help show how market segment and meal cost affect revenue.
