-- Consultas interessantes para uma rede social

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
    seguindo.seguidor_id AS seguidor_id,
    usuarios.nome AS nome_seguidor
FROM 
    seguindo
JOIN 
    usuarios ON seguindo.seguidor_id = usuarios.id
WHERE 
    seguindo.usuario_id = 1;


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
    usuarios.id = 1;