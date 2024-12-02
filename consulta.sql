-- Esta consulta retorna uma lista de postagens, com título, conteúdo, data de publicação e informações do usuário que a criou, ordenadas pela data de publicação em ordem decrescente.
SELECT 
    postagens.id AS postagem_id,
    postagens.titulo,
    postagens.conteudo,
    postagens.data_publicacao,
    usuarios.id AS usuario_id,
    usuarios.nome AS nome_usuario
FROM 
    postagens
JOIN 
    usuarios ON postagens.usuario_id = usuarios.id
ORDER BY 
    postagens.data_publicacao DESC;

-- Esta consulta retorna uma lista de comentários feitos em uma postagem específica, incluindo o nome do usuário e o conteúdo do comentário, ordenados pela data de criação.
SELECT 
    comentarios.id AS comentario_id,
    comentarios.conteudo AS conteudo_comentario,
    comentarios.created_at AS data_criacao,
    usuarios.id AS usuario_id,
    usuarios.nome AS nome_usuario
FROM 
    comentarios
JOIN 
    usuarios ON comentarios.usuario_id = usuarios.id
WHERE 
    comentarios.postagem_id = 1
ORDER BY 
    comentarios.created_at ASC;

-- Esta consulta retorna a lista de usuários que seguem um determinado usuário.
SELECT 
    seguindos.seguidor_id AS seguidor_id,
    usuarios.nome AS nome_seguidor
FROM 
    seguindos
JOIN 
    usuarios ON seguindos.seguidor_id = usuarios.id
WHERE 
    seguindos.usuario_id = 1;

-- Esta consulta retorna as comunidades criadas por um determinado usuário.
SELECT 
    comunidades.id AS comunidade_id,
    comunidades.nome AS nome_comunidade,
    comunidades.descricao AS descricao_comunidade,
    comunidades.data_criacao AS data_criacao_comunidade
FROM 
    comunidades
JOIN 
    usuarios ON comunidades.administrador_id = usuarios.id
WHERE 
    usuarios.id = 2;

-- Esta consulta retorna todas as postagens feitas em uma comunidade específica, incluindo o nome do usuário que fez a postagem.
SELECT 
    postagens.id AS postagem_id,
    postagens.titulo,
    postagens.conteudo,
    postagens.data_publicacao,
    usuarios.id AS usuario_id,
    usuarios.nome AS nome_usuario
FROM 
    postagens
JOIN 
    usuarios ON postagens.usuario_id = usuarios.id
WHERE 
    postagens.comunidade_id = 1
ORDER BY 
    postagens.data_publicacao DESC;

-- Esta consulta retorna o número de seguidores de cada usuário, ordenado pelo maior número de seguidores.
SELECT 
    usuarios.id AS usuario_id,
    usuarios.nome AS nome_usuario,
    COUNT(seguindos.seguidor_id) AS numero_de_seguidores
FROM 
    usuarios
LEFT JOIN 
    seguindos ON usuarios.id = seguindos.usuario_id
GROUP BY 
    usuarios.id, usuarios.nome
ORDER BY 
    numero_de_seguidores DESC;

-- Esta consulta retorna a quantidade de postagens em cada comunidade.
SELECT 
    comunidades.id AS comunidade_id,
    comunidades.nome AS nome_comunidade,
    COUNT(postagens.id) AS quantidade_de_postagens
FROM 
    comunidades
LEFT JOIN 
    postagens ON comunidades.id = postagens.comunidade_id
GROUP BY 
    comunidades.id, comunidades.nome
ORDER BY 
    quantidade_de_postagens DESC;

-- Esta consulta retorna todas as postagens que receberam reações, incluindo o tipo de reação e o usuário que reagiu.
SELECT 
    postagens.id AS postagem_id,
    postagens.titulo,
    reacaos.tipo AS tipo_reacao,
    usuarios.id AS usuario_id,
    usuarios.nome AS nome_usuario
FROM 
    reacaos
JOIN 
    postagens ON reacaos.postagem_id = postagens.id
JOIN 
    usuarios ON reacaos.usuario_id = usuarios.id;