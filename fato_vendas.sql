-- Criação da Tabela FATO para Extração e Coleta de Dados

CREATE TABLE fato_vendas (
    id SERIAL PRIMARY KEY,                  -- Identificador único para cada registro de venda
    fk_id_livro INT NOT NULL,               -- Chave estrangeira para a tabela de dimensão 'livro'
    fk_id_cliente INT NOT NULL,             -- Chave estrangeira para a tabela de dimensão 'cliente'
    fk_id_endereco INT,                     -- Chave estrangeira para a tabela de dimensão 'endereco'
    data_venda TIMESTAMP NOT NULL,          -- Data e hora em que a venda foi realizada
    quantidade_vendida INT NOT NULL,        -- Quantidade de livros vendidos na transação
    valor_total DECIMAL(10, 2) NOT NULL,    -- Valor total da venda
    canal_venda VARCHAR(50),                -- Canal de venda (ex: online, loja física)
    forma_pagamento VARCHAR(50),            -- Forma de pagamento utilizada
    desconto_aplicado DECIMAL(10, 2),       -- Valor do desconto aplicado, se houver
    data_extracao TIMESTAMP DEFAULT NOW(),  -- Data e hora da extração/coleta dos dados

    FOREIGN KEY (fk_id_livro) REFERENCES livro(pk_id_livro),
    FOREIGN KEY (fk_id_cliente) REFERENCES cliente(pk_id_cliente),
    FOREIGN KEY (fk_id_endereco) REFERENCES endereco(pk_id_endereco)
);

-- Índices para otimização de consultas
CREATE INDEX idx_data_venda ON fato_vendas(data_venda);
CREATE INDEX idx_cliente ON fato_vendas(fk_id_cliente);
CREATE INDEX idx_livro ON fato_vendas(fk_id_livro);
