-- NUMERIC FUNCTIONS

-- ROUND
SELECT
	3.516,
	ROUND(3.516, 2) AS round_2,
	ROUND(3.516, 1) AS round_1,
	ROUND(3.516, 0) AS round_0;

-- ABS
-- absolute value 
SELECT
	-10,
	ABS(-10),
	ABS(70);