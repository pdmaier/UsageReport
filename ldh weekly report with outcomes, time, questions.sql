SELECT (WEEK(qry1.date, 1) + 17) AS Weekno, qry1.outcome, SUM(qry1.sessions), SUM(qry1.seconds), SUM(qry1.attempts), SUM(qry1.correct) FROM
(
	SELECT 
		DATE(start_datetime) as date, 
		id_user, 
		outcome as outcome,
		COUNT(outcome) as sessions, 
		SUM(seconds_duration) as seconds,
		SUM(nr_questions_attempted) as attempts, 
		SUM(nr_questions_correct) as correct 
	FROM lesson_delivery_history
	WHERE DATE(start_datetime) >= DATE("2015-05-25")
	AND DATE(start_datetime) <= DATE("2015-05-31")
	AND id_course IN(12, 13)
	GROUP BY date, id_user, outcome
) as qry1
GROUP BY Weekno, qry1.outcome