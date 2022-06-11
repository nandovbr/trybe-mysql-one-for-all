SELECT s.song_name AS cancao,
COUNT(h.song_id) AS reproducoes
FROM historic AS h
JOIN songs AS s
ON h.song_id = s.song_id
GROUP BY cancao
ORDER BY reproducoes DESC,
cancao LIMIT 2;
