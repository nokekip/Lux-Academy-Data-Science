-- Create database
CREATE DATABASE weather_data;

USE weather_data;

-- Create table
CREATE TABLE
    weather_records (
        DateTime DATETIME,
        Temp_C FLOAT,
        Dew_Point_Temp_C FLOAT,
        Rel_Hum_Percentage FLOAT,
        Wind_Speed_km_h FLOAT,
        Visibility_km FLOAT,
        Press_kPa FLOAT,
        Weather_Condition VARCHAR(255)
    );

-- Load csv data
LOAD DATA INFILE '/tmp/updated_weather_data.csv' 
INTO TABLE weather_records FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (
    DateTime,
    Temp_C,
    Dew_Point_Temp_C,
    Rel_Hum_Percentage,
    Wind_Speed_km_h,
    Visibility_km,
    Press_kPa,
    Weather_Condition
);

-- 1. Find all records where the weather was exactly clear
SELECT * FROM weather_records WHERE Weather_Condition = 'Clear'; -- output: 1326 rows in set (0.022 sec)

-- 2 Find the number of times the wind speed was exactly 4 km/hr.
SELECT COUNT(*) FROM weather_records WHERE Wind_Speed_km_h = 4; -- output: 474 

-- 4. What is the mean visibility of the dataset?
SELECT AVG(Visibility_km) FROM weather_records; -- output: 27.66444660838904

-- Find the number of records where the wind speed is greater than 24 km/hr and visibility is equal to 25 km.
SELECT COUNT(*) FROM weather_records WHERE Wind_Speed_km_h > 24 AND Visibility_km = 25; -- output: 308

-- Find all instances where the weather is clear and the relative humidity is greater than 50, or visibility is above 40.
SELECT * FROM weather_records WHERE (Weather_Condition = 'Clear' AND Rel_Hum_Percentage > 50) OR Visibility_km > 40; -- output: 2921 rows in set (0.387 sec)
