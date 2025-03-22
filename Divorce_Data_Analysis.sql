-- Total Marriage

SELECT 
	COUNT (*) AS Total_Marriage
	 FROM divorce_data ;

--  TOTAL DIVORCE

SELECT 
	COUNT (*) AS Total_Divorce
	FROM divorce_data
	WHERE divorce_status = 'Yes' ;

-- DIVORCE RATES 

WITH CTE AS (
	SELECT COUNT (*) AS Total_Marriage FROM divorce_data
),
table_2 AS (
	SELECT COUNT (*) AS Total_Divorce
	FROM divorce_data
	WHERE divorce_status = 'Yes'
	)
SELECT 
	ROUND( T.Total_Divorce * 100.0 / c.Total_Marriage ,2) AS Divorce_Rates
	FROM table_2 t
	CROSS JOIN CTE c ;

-- DIVORCE RATES COMPARISION RURAL VS URBAN

WITH CTE AS (
	SELECT 
		urban_rural, COUNT (*) AS Divorce
		FROM divorce_data
		WHERE divorce_status = 'Yes'
		GROUP BY urban_rural
),
table_1 AS (
	SELECT COUNT (*) AS Total_Divorce FROM divorce_data
	WHERE divorce_status = 'Yes'
	)
	SELECT c.urban_rural,
	ROUND ( c.Divorce * 100.0 / t.Total_Divorce , 2) as Divorce_Rate
	FROM table_1 t
	CROSS JOIN CTE c ;

-- DIVORCE RATE DISTRUBUTION BY CASTE AND RELIGION

WITH CTE AS (
	SELECT 	
		caste_religion,
		COUNT (*) AS Divorce
		FROM  divorce_data
		WHERE divorce_status = 'Yes'
		GROUP BY caste_religion
		),
Table_ AS (		
	SELECT 
		COUNT (*) AS Total_Divorce
		FROM divorce_data
		WHERE divorce_status = 'Yes'
		)
	SELECT 
		C.caste_religion,
		ROUND( C.Divorce*100.0 / Total_Divorce ,2 ) as Divorce_Rate
		FROM CTE C	
		CROSS JOIN Table_ T
		ORDER BY divorce_Rate DESC
		;

-- MARRIAGE PREFERANCE ARRANGE VS LOVE

WITH CTE AS (
	SELECT 
		marriage_type,
		COUNT (*) AS Divorce
		FROM divorce_data
		WHERE divorce_status = 'Yes'
		GROUP BY marriage_type
		),
TABLE_ AS (		
	SELECT
		COUNT (*) AS Total_Divorce
		FROM divorce_data
		WHERE divorce_status = 'Yes'
		)
	SELECT 
		C.marriage_type,
		ROUND( C.Divorce * 100.2 / T.Total_Divorce,2 ) AS Divorce_Rate
		FROM CTE C
		CROSS JOIN TABLE_ T
		
		
		
		
		

	
	
	

	
	