# Republik

## Pré-requisitos

Antes de começar, certifique-se de ter os seguintes itens instalados:

-   [Ruby](https://www.ruby-lang.org/en/) 3.3.4+ ou superior
-   [Rails](https://rubyonrails.org/) 7.2.1+

## Inicialização do Projeto

### 1. Clone o repositório

```bash
git clone ...
cd ...
```

### 2. Instale as dependências do projeto

```bash
bundle install
```

### 3. Configure o banco de dados

```bash
rails db:create
rails db:migrate
```

### 4. Rodar as seeds

```bash
rails db:seed
```

### 5. SQL - Consultas

<details><summary>Esta consulta retorna uma lista de postagens com detalhes das postagens e informações básicas dos usuários que as criaram, ordenadas pela data de publicação de forma decrescente.</summary>

```sql
SELECT
    postagens.id AS postagem_id,
    postagens.created_at AS data_criacao,
    postagens.updated_at AS data_atualizacao,
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
```

</details>

<details><summary>Esta consulta retorna informações básicas do usuário, incluindo a foto e o nome, para serem utilizadas no header.</summary>

```sql
SELECT
    usuarios.id AS usuario_id,
    usuarios.nome AS nome_usuario
FROM
    usuarios;
```

</details>

<details><summary>Esta consulta retorna uma lista de comunidades com detalhes básicos, como nome, descrição e data de criação.</summary>

```sql
SELECT
    comunidades.id AS comunidade_id,
    comunidades.nome AS nome_comunidade,
    comunidades.descricao AS descricao_comunidade,
    comunidades.data_criacao AS data_criacao_comunidade
FROM
    comunidades;
```

</details>
