-- Query the following two values from the STATION table: The sum of all values in LAT_N rounded to a scale of 2 decimal places. The sum of all values in LONG_W rounded to a scale of 2 decimal places. The STATION table is described as follows:  where LAT_N is the northern latitude and LONG_W is the western longitude. Output Format; Your results must be in the form: lat lon where lat is the sum of all values in LAT_N and lon is the sum of all values in LONG_W. Both results must be rounded to a scale of 2 decimal places

-- solution:
SELECT 
    ROUND(SUM(LAT_N), 2) AS lat,
    ROUND(SUM(LONG_W), 2) AS lon
FROM STATION;