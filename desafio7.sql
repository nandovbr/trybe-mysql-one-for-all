SELECT a.artist_name AS artista,
alb.album_name AS album,
COUNT(fa.artist_id) AS seguidores
FROM artist AS a
JOIN albums AS alb
ON a.artist_id = alb.artist_id
JOIN following_artists AS fa
ON a.artist_id = fa.artist_id
GROUP BY alb.album_id
ORDER BY COUNT(a.artist_id) DESC,
a.artist_name ASC,
alb.album_name ASC;