--show sample of dataset from table1
SELECT *
FROM finance
LIMIT 10;

--show total revenue by state
SELECT state, SUM(state_revenue)
FROM finance
GROUP BY state
ORDER BY state;

--show total expenditure by state
SELECT state, SUM(total_expenditure)
FROM finance
GROUP BY state
ORDER BY state;

--show states where expenditure exceeds revenue
SELECT state, SUM(state_revenue) AS total_revenue, SUM(total_expenditure) AS total_expend
FROM finance
GROUP BY state
HAVING SUM(state_revenue) < SUM(total_expenditure)
ORDER BY state;

--show states that had more revenue than California
SELECT state, SUM(total_revenue)
FROM finance
GROUP BY state
HAVING SUM(total_revenue) > 
	(SELECT SUM(total_revenue)
	FROM finance
	WHERE state = 'CALIFORNIA')
ORDER BY state;

--sample of dataset from table2
SELECT *
FROM naep
LIMIT 10;

--inner join table1 and table2 and show total revenue and avg math scores
--this is data I would use to find out if there is a correlation between revenue and test scores
SELECT finance.state, SUM(total_revenue) AS sum_revenue, AVG(naep.avg_math_4_score) AS avg_math4, AVG(naep.avg_math_8_score) AS avg_math8
FROM finance JOIN naep ON finance.state = naep.state
GROUP BY finance.state
ORDER BY finance.state;




