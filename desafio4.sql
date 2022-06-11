SELECT u.user_name AS usuario,
IF(MAX(h.reproduction_date) LIKE '2021%',
'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM users AS u
JOIN historic AS h
ON u.user_id = h.user_id
GROUP BY usuario
ORDER BY usuario;
