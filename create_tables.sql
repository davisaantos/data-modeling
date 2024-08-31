-- Tabela de Fato: vendas_fato
CREATE TABLE vendas_fato (
    id SERIAL PRIMARY KEY,               -- Identificador único para cada venda
    pk_id_livro INT NOT NULL,            -- Chave estrangeira para a tabela de dimensão 'livro'
    pk_id_cliente INT NOT NULL,          -- Chave estrangeira para a tabela de dimensão 'cliente'
    data_venda TIMESTAMP NOT NULL,       -- Data e hora em que a venda foi realizada
    valor_venda DECIMAL(10, 2) NOT NULL, -- Valor da venda

    FOREIGN KEY (pk_id_livro) REFERENCES livro(pk_id_livro),
    FOREIGN KEY (pk_id_cliente) REFERENCES cliente(pk_id_cliente)
);

-- Tabela de Dimensão: categoria
CREATE TABLE categoria (
    pk_id_categoria SERIAL PRIMARY KEY, -- Identificador único para cada categoria
    nome VARCHAR(255) NOT NULL,         -- Nome da categoria
    data_criacao TIMESTAMP NOT NULL,    -- Data de criação do registro da categoria
    data_atualizacao TIMESTAMP          -- Data da última atualização do registro da categoria
);

-- Tabela de Dimensão: livro
CREATE TABLE livro (
    pk_id_livro SERIAL PRIMARY KEY,     -- Identificador único para cada livro
    titulo VARCHAR(255) NOT NULL,       -- Título do livro
    autor VARCHAR(255) NOT NULL,        -- Autor do livro
    descricao TEXT,                     -- Descrição do livro
    codigo VARCHAR(50),                 -- Código do livro (ex: ISBN)
    quantidade INT NOT NULL,            -- Quantidade disponível em estoque
    fk_id_categoria INT,                -- Chave estrangeira para a tabela de dimensão 'categoria'
    data_criacao TIMESTAMP NOT NULL,    -- Data de criação do registro do livro
    data_atualizacao TIMESTAMP,         -- Data da última atualização do registro do livro

    FOREIGN KEY (fk_id_categoria) REFERENCES categoria(pk_id_categoria)
);

-- Tabela de Dimensão: cliente
CREATE TABLE cliente (
    pk_id_cliente SERIAL PRIMARY KEY,   -- Identificador único para cada cliente
    nome VARCHAR(255) NOT NULL,         -- Nome completo do cliente
    cpf VARCHAR(14) UNIQUE NOT NULL,    -- CPF do cliente
    email VARCHAR(255) UNIQUE NOT NULL, -- Endereço de e-mail do cliente
    telefone VARCHAR(20),               -- Número de telefone do cliente
    data_criacao TIMESTAMP NOT NULL,    -- Data de criação do registro do cliente
    data_atualizacao TIMESTAMP          -- Data da última atualização do registro do cliente
);

-- Tabela de Dimensão: endereco
CREATE TABLE endereco (
    pk_id_endereco SERIAL PRIMARY KEY,  -- Identificador único para cada endereço
    rua VARCHAR(255) NOT NULL,          -- Nome da rua
    numero VARCHAR(10) NOT NULL,        -- Número do endereço
    cep VARCHAR(10) NOT NULL,           -- Código postal (CEP)
    complemento VARCHAR(255),           -- Complemento do endereço
    cidade VARCHAR(255) NOT NULL,       -- Cidade do endereço
    estado VARCHAR(255) NOT NULL,       -- Estado do endereço
    fk_id_cliente INT NOT NULL,         -- Chave estrangeira para a tabela de dimensão 'cliente'
    data_criacao TIMESTAMP NOT NULL,    -- Data de criação do registro do endereço
    data_atualizacao TIMESTAMP,         -- Data da última atualização do registro do endereço

    FOREIGN KEY (fk_id_cliente) REFERENCES cliente(pk_id_cliente)
);
