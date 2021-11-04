-- Medium Facebook SQL Question
/*
Highest Energy Consumption
Find the date with the highest total energy consumption from the Facebook data centers. Output the date along with the total energy consumption across all data centers.

fb_eu_energy
date datetime
consumption int

fb_asia_energy
date datetime
consumptionint

fb_na_energy
date datetime
consumption
*/
-- Solution

SELECT 
date, total_energy 
FROM
(
    SELECT date, 
    SUM(consumption) AS total_energy, 
    RANK() OVER (ORDER BY SUM(consumption) DESC) AS r 
FROM (   
        SELECT * FROM fb_eu_energy
        UNION ALL
        SELECT * FROM fb_asia_energy
        UNION ALL
        SELECT * FROM fb_na_energy
            ) fb_energy
        GROUP BY date
    ) fb_energy_ranked
WHERE r = 1
