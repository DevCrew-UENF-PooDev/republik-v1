-- Inserir dados em comunidades

INSERT INTO comunidades (nome, descricao, data_criacao, created_at, updated_at) VALUES
('Comunidade A', 'Descrição da Comunidade A', DATE('now'), DATETIME('now'), DATETIME('now')),
('Comunidade B', 'Descrição da Comunidade B', DATE('now'), DATETIME('now'), DATETIME('now')),
('Comunidade C', 'Descrição da Comunidade C', DATE('now'), DATETIME('now'), DATETIME('now')),
('Comunidade D', 'Descrição da Comunidade D', DATE('now'), DATETIME('now'), DATETIME('now')),
('Comunidade E', 'Descrição da Comunidade E', DATE('now'), DATETIME('now'), DATETIME('now'));

-- Inserindo dados na tabela de postagens

INSERT INTO postagens (titulo, conteudo, data_publicacao, usuario_id, comunidade_id, created_at, updated_at) VALUES
('Título da Postagem 1', 'Conteúdo da Postagem 1', DATETIME('now'), 1, 1, DATETIME('now'), DATETIME('now')),
('Título da Postagem 2', 'Conteúdo da Postagem 2', DATETIME('now'), 2, NULL, DATETIME('now'), DATETIME('now')),
('Título da Postagem 3', 'Conteúdo da Postagem 3', DATETIME('now'), 3, 3, DATETIME('now'), DATETIME('now')),
('Título da Postagem 4', 'Conteúdo da Postagem 4', DATETIME('now'), 4, NULL, DATETIME('now'), DATETIME('now')),
('Título da Postagem 5', 'Conteúdo da Postagem 5', DATETIME('now'), 5, 5, DATETIME('now'), DATETIME('now'));

-- Inserindo dados na tabela de comentários

INSERT INTO comentarios (conteudo, data_comentario, usuario_id, postagem_id, created_at, updated_at) VALUES
('Comentário 1', DATE('now'), 1, 1, DATETIME('now'), DATETIME('now')),
('Comentário 2', DATE('now'), 2, 2, DATETIME('now'), DATETIME('now')),
('Comentário 3', DATE('now'), 3, 3, DATETIME('now'), DATETIME('now')),
('Comentário 4', DATE('now'), 4, 4, DATETIME('now'), DATETIME('now')),
('Comentário 5', DATE('now'), 5, 5, DATETIME('now'), DATETIME('now'));

-- Inserindo dados na tabela de seguindo (usuários seguindo outros usuários)

INSERT INTO seguindos (usuario_id, seguidor_id, created_at, updated_at) VALUES
(1, 2, DATETIME('now'), DATETIME('now')),
(2, 3, DATETIME('now'), DATETIME('now')),
(3, 4, DATETIME('now'), DATETIME('now')),
(4, 5, DATETIME('now'), DATETIME('now')),
(5, 1, DATETIME('now'), DATETIME('now'));