SELECT * 
FROM `lesson_delivery_history`
INNER JOIN user
ON lesson_delivery_history.id_user = user.id_user
INNER JOIN user_groups
ON lesson_delivery_history.id_user = user_groups.id_user
INNER JOIN groups
ON user_groups.id_group = groups.id_group
INNER JOIN school_users
ON groups.owner_id_user = school_users.teacher_id_user
WHERE lesson_delivery_history.id_course IN(12, 13) 
AND DATE(start_datetime) >= DATE("2015-05-25") 
AND DATE(start_datetime) <= DATE("2015-05-31")
AND user.type = 2
AND lesson_delivery_history.id_user NOT IN(
	4675, 
	4679,
	4716
	)
AND user_groups.id_group NOT IN(
	2,
	5,
	361, 
	381, 
	432, 
	436,
	12,
	26,
	441,
	643, 
	72,
	86,
	100,
	101,
	127,
	129,
	153,
	155,
	160,
	169,
	171,
	172,
	174,
	178,
	260,
	268,
	270,
	278,
	285,
	302,
	303,
	306,
	310,
	311,
	312,
	313,
	315,
	322,
	329,
	353,
	360,
	364,
	365,
	366,
	367,
	369,
	373,
	374,
	382,
	392,
	403,
	404,
	419,
	427,
	428,
	467,
	468,
	470,
	493,
	499,
	500,
	501,
	502,
	503,
	504,
	505,
	506,
	507,
	508,
	509,
	511,
	520,
	521,
	541,
	542,
	558,
	560,
	561,
	584,
	587,
	597,
	300, 
	311, 
	312, 
	14, 
	37,
	38, 
	42,
	49
	)
AND groups.owner_id_user NOT IN(
	405, 
	4197, 
	4198, 
	4226, 
	4400, 
	4555, 
	4676, 
	4717, 
	3531, 
	70, 
	3615, 
	3619, 
	3601, 
	2203, 
	3635, 
	283, 
	440, 
	1438, 
	1943, 
	2222, 
	2203, 
	1933, 
	2382, 
	2386, 
	2074, 
	3169, 
	3295, 
	3388,
	4773
	)
GROUP BY school_users.id_school