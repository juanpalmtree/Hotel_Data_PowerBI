

with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$'])


--is the hotel revenue growing by year?
--there is no "revenue" column, but we can create a new column in order to see revenue
--adr = average daily rate

/* 

select 
arrival_date_year, hotel,
round(sum((stays_in_week_nights + stays_in_weekend_nights)*adr),2) as Revenue from hotels
group by arrival_date_year, hotel;

*/

-- this following query allows us to join the remaining 2 tables "market_segment$" and "meal_cost$"
-- after joining this, we are now able to organize the data together and prepare it for visualization 


select * from hotels
left join dbo.market_segment$ 
on hotels.market_segment = market_segment$.market_segment
left join dbo.meal_cost$
on meal_cost$.meal = hotels.meal

