-- 1. Which client has conducted the most assessments in total?
SELECT 
	ï»¿client,
    COUNT(tracc_practice) AS total
FROM data
GROUP BY ï»¿client
ORDER BY total DESC;

SELECT 
	ï»¿client AS Client, 
    MAX(total) AS Total_Assessments
FROM (
	SELECT 
		ï»¿client,
		COUNT(tracc_practice) AS total
	FROM data
	GROUP BY ï»¿client
	ORDER BY total DESC
    ) AS Client_With_Most_Assessments;


-- 2. Across how many countries are our clients assessing TRACC practices ?
SELECT
	COUNT(DISTINCT country) AS countries
FROM data;



-- 3. How many assessments were conducted in total for all clients, after 31 March 2018 ?
		#Please note that the assessment_date has been converted to a SQL DATE data type
		# in my SQL DB this is how client appears in my table as "ï»¿client"
		# Should your DB data type be DATE data-type you will receive the same results, where after March-31-2018 we have 40 clients and 2599 assessments conducted 
SELECT 
	COUNT(DISTINCT ï»¿client) AS Clients,
    COUNT(tracc_practice) AS 'Practice after 31-March-2018'
FROM data
WHERE assessment_date > '2018-03-31';

-- 4. How many unique TRACC practices did Client 48 assess ?
SELECT 
	ï»¿client, 
    COUNT(DISTINCT tracc_practice) AS Unique_TRACC
FROM data
WHERE ï»¿client = "Client 48";

-- 4. How many assessments were done for each practice in 2017 ?
SELECT 
    DISTINCT tracc_practice, 
    COUNT(tracc_practice)
FROM data
WHERE assessment_date = 2017
GROUP BY tracc_practice;

-- 5. Which clients have achieved a maturity score greater than 2.5, for the 5S and Teamwork practices ?
SELECT 
	ï»¿client,
    tracc_practice, 
    tracc_maturity
FROM data
WHERE tracc_maturity > 2.5 AND tracc_practice IN('5S', 'Teamwork')
GROUP BY ï»¿client, tracc_practice
ORDER BY ï»¿client ;





