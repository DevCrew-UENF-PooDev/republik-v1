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