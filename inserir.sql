-- Inserir dados em comunidades

INSERT INTO comunidades (nome, descricao, administrador_id, data_criacao, created_at, updated_at) VALUES
('Dev Lovers', 'Comunidade para desenvolvedores apaixonados por tecnologia.', 1, DATE('now'), DATETIME('now'), DATETIME('now')),
('Fotógrafos Unidos', 'Uma comunidade para fotógrafos compartilharem suas melhores fotos e técnicas.', 2, DATE('now', '-5 days'), DATETIME('now'), DATETIME('now')),
('Amantes de Livros', 'Compartilhe resenhas e discussões sobre livros com outros amantes de literatura.', 3, DATE('now', '-10 days'), DATETIME('now'), DATETIME('now')),
('Cozinha Criativa', 'Espaço para compartilhar receitas e dicas de cozinha.', 4, DATE('now', '-15 days'), DATETIME('now'), DATETIME('now')),
('Cinema e Séries', 'Discussões sobre filmes e séries para os amantes do cinema.', 5, DATE('now', '-20 days'), DATETIME('now'), DATETIME('now'));

-- Inserindo dados na tabela de postagens

INSERT INTO postagens (titulo, conteudo, data_publicacao, usuario_id, comunidade_id, created_at, updated_at) VALUES
('Como aprender Ruby on Rails?', 'Pessoal, alguém poderia me dar dicas para começar com Ruby on Rails?', DATETIME('now', '-2 days'), 1, 1, DATETIME('now', '-2 days'), DATETIME('now')),
('Melhores técnicas de fotografia noturna', 'Quais técnicas vocês usam para fotografar à noite sem muito ruído?', DATETIME('now', '-5 days'), 2, 2, DATETIME('now', '-5 days'), DATETIME('now')),
('Livro favorito de 2024?', 'Qual foi o livro que vocês mais gostaram de ler este ano?', DATETIME('now', '-7 days'), 3, 3, DATETIME('now', '-7 days'), DATETIME('now')),
('Receita de bolo de cenoura', 'Compartilhando aqui uma receita incrível de bolo de cenoura com cobertura de chocolate!', DATETIME('now', '-3 days'), 4, NULL, DATETIME('now', '-3 days'), DATETIME('now')),
('Recomendação de série na Netflix', 'Alguém tem uma boa recomendação de série de suspense na Netflix?', DATETIME('now', '-4 days'), 5, 5, DATETIME('now', '-4 days'), DATETIME('now'));

-- Inserindo dados na tabela de comentários

INSERT INTO comentarios (conteudo, data_comentario, usuario_id, postagem_id, created_at, updated_at) VALUES
('Eu sugiro começar com o tutorial oficial do Rails, é muito bom para iniciantes!', DATE('now', '-1 day'), 2, 1, DATETIME('now', '-1 day'), DATETIME('now')),
('Use um tripé e uma exposição longa para capturar mais luz. Funciona muito bem!', DATE('now', '-3 days'), 1, 2, DATETIME('now', '-3 days'), DATETIME('now')),
('Amei "O Conto da Aia", foi o melhor livro que li este ano!', DATE('now', '-6 days'), 5, 3, DATETIME('now', '-6 days'), DATETIME('now')),
('Essa receita parece deliciosa, vou tentar fazer no final de semana!', DATE('now', '-2 days'), 3, 4, DATETIME('now', '-2 days'), DATETIME('now')),
('Eu recomendo "Dark", é uma série fantástica e cheia de mistérios!', DATE('now', '-1 day'), 4, 5, DATETIME('now', '-1 day'), DATETIME('now'));

-- Inserindo dados na tabela de seguindo (usuários seguindo outros usuários)

INSERT INTO seguindos (usuario_id, seguidor_id, created_at, updated_at) VALUES
(1, 2, DATETIME('now', '-10 days'), DATETIME('now')),
(2, 3, DATETIME('now', '-9 days'), DATETIME('now')),
(3, 4, DATETIME('now', '-8 days'), DATETIME('now')),
(4, 5, DATETIME('now', '-7 days'), DATETIME('now')),
(5, 1, DATETIME('now', '-6 days'), DATETIME('now'));


-- Inserindo dados na tabela de reações (reacaos)

INSERT INTO reacaos (tipo, usuario_id, postagem_id, created_at, updated_at) VALUES
('curtida', 1, 1, DATETIME('now', '-2 days'), DATETIME('now')),
('curtida', 2, 2, DATETIME('now', '-5 days'), DATETIME('now')),
('amei', 3, 3, DATETIME('now', '-6 days'), DATETIME('now')),
('curtida', 4, 4, DATETIME('now', '-3 days'), DATETIME('now')),
('amei', 5, 5, DATETIME('now', '-4 days'), DATETIME('now')),
('curtida', 2, 1, DATETIME('now', '-1 day'), DATETIME('now')),
('curtida', 3, 5, DATETIME('now', '-1 day'), DATETIME('now'));