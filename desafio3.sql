SELECT u.user_name AS usuario,
COUNT(s.song_id) AS qtde_musicas_ouvidas,
ROUND(SUM(s.seconds / 60), 2) AS total_minutos
FROM users AS u
JOIN historic AS h
ON h.user_id = u.user_id
JOIN songs AS s
ON s.song_id = h.song_id
GROUP BY u.user_name
ORDER BY u.user_name;
