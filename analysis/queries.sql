-- 1. View which users spend the most amount of time on the app and compare to seniority in the US
SELECT username, SUM(time) AS total_time, COUNT(seniority) AS total_days
FROM usa
GROUP BY username
ORDER BY SUM(time) DESC;

-- 2. View how many users spent money in the US
SELECT COUNT(DISTINCT username) as total_users, money
FROM usa 
GROUP BY money;

-- 3. Compare total time spent on the app across countries
SELECT usa.country, SUM(usa.time) AS total_time FROM usa GROUP BY usa.country
UNION 
SELECT ca.country, SUM(ca.time) AS total_time FROM canada ca GROUP BY ca.country
UNION
SELECT mx.country, SUM(mx.time) AS total_time FROM mexico mx GROUP BY mx.country
UNION
SELECT br.country, SUM(br.time) AS total_time FROM brazil br GROUP BY br.country
ORDER BY total_time DESC;

-- 4. View how many users spent money across countries
SELECT usa.country, COUNT(DISTINCT username) AS total_users, usa.money AS extras_bought FROM usa GROUP BY usa.country, usa.money
UNION 
SELECT ca.country, COUNT(DISTINCT username) AS total_users, ca.money AS extras_bought FROM canada ca GROUP BY ca.country, ca.money
UNION 
SELECT mx.country, COUNT(DISTINCT username) AS total_users, mx.money AS extras_bought FROM mexico mx GROUP BY mx.country, mx.money
UNION 
SELECT br.country, COUNT(DISTINCT username) AS total_users, br.money AS extras_bought FROM brazil br GROUP BY br.country, br.money
order by country, extras_bought DESC;


