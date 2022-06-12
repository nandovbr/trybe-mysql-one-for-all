SELECT s.song_name AS nome,
COUNT(h.song_id) AS reproducoes
FROM users AS u
JOIN historic AS h
ON u.user_id = h.user_id
JOIN plans AS p
ON p.plan_id = u.plan_id
JOIN songs AS s
ON s.song_id = h.song_id
WHERE (p.plan_name = 'gratuito' OR p.plan_name = 'pessoal')
GROUP BY s.song_name
ORDER BY s.song_name;
