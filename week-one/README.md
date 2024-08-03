# Week one Project
## Part 1
1. Find all records where the weather was exactly clear.
2. Find the number of times the wind speed was exactly 4 km/hr.
3. Check if there are any NULL values present in the dataset.
4. Rename the column "Weather" to "Weather_Condition."
5. What is the mean visibility of the dataset?
6. Find the number of records where the wind speed is greater than 24 km/hr and visibility is equal to 25 km.
7. What is the mean value of each column for each weather condition?
8. Find all instances where the weather is clear and the relative humidity is greater than 50, or visibility is above 40.
9. Find the number of weather conditions that include snow.

## Part 2: Move this CSV into a database of your choice and use SQL to answer 4 of the questions above. 

In this section, the CSV data was imported into a MySQL database, and SQL queries were used to answer specific questions. Below are the SQL queries and their results:

1. Find all records where the weather was exactly clear
```sql
SELECT * FROM weather_records WHERE Weather_Condition = 'Clear';
-- Output: 1326 rows in set (0.022 sec)
```

2. Find the number of times the wind speed was exactly 4 km/hr
```sql
SELECT COUNT(*) FROM weather_records WHERE Wind_Speed_km_h = 4;
-- Output: 474
```
3. What is the mean visibility of the dataset?
```sql
SELECT AVG(Visibility_km) FROM weather_records;
-- Output: 27.66444660838904
```
4. Find the number of records where the wind speed is greater than 24 km/hr and visibility is equal to 25 km

```sql
SELECT COUNT(*) FROM weather_records WHERE Wind_Speed_km_h > 24 AND Visibility_km = 25;
-- Output: 308
```
5. Find all instances where the weather is clear and the relative humidity is greater than 50, or visibility is above 40
```sql
SELECT * FROM weather_records WHERE (Weather_Condition = 'Clear' AND Rel_Hum_Percentage > 50) OR Visibility_km > 40;
-- Output: 2921 rows in set (0.387 sec)
```
