# Projeto de modelagem de Banco de Dados de Vendas de Livros

## Equipe

- Carolina Suelen Attili 
- Davi Santos Messias

## Sumário

- [Glossário de Dados](#glossário-de-dados)
- [Estrutura de Tabelas](#estrutura-de-tabelas)
- [Nomes Lógicos e Físicos](#nomes-lógicos-e-físicos)
- [Tabela FATO: Vendas](#tabela-fato-vendas)


## DOMÍNIO:
VendasLivraria

## Sigla:
VLVRS

## Empresa: "Letras e Vida livraria"

- Missão: Nossa missão é enriquecer a vida das pessoas através do poder transformador dos livros. Oferecemos uma curadoria diversificada de obras, desde clássicos atemporais até novas descobertas literárias, promovendo a leitura como uma experiência enriquecedora e acessível a todos.

- Visão: Ser a principal referência em livrarias que celebra a paixão pela leitura e fomenta uma comunidade literária vibrante e conectada. Almejamos inspirar e educar leitores de todas as idades, contribuindo para um mundo mais informado e imaginativo.

- Valores:

  1. Paixão pela Leitura: Valorizamos a leitura como uma forma essencial de crescimento pessoal e coletivo.
  2. Diversidade e Inclusão: Oferecemos uma seleção ampla que reflete a diversidade de perspectivas e histórias.
  3. Excelência no Atendimento: Comprometemo-nos a proporcionar uma experiência de compra amigável e personalizada.
  4. Acesso ao Conhecimento: Buscamos tornar a literatura acessível a todos, promovendo o amor pelos livros e a educação.
  5. Comunidade Literária: Fomentamos um espaço onde leitores e escritores possam se conectar e compartilhar suas paixões.
 
## KPIs (Indicadores-Chave de Desempenho)

## 1. Volume de Vendas
Por que é importante: Mede o sucesso das operações e a aceitação dos produtos pelo mercado. Ajuda a entender quais livros estão em alta e a ajustar o estoque e as estratégias de marketing.
## 2. Taxa de Crescimento de Vendas
Por que é importante: Indica a expansão ou declínio do negócio ao longo do tempo. Um crescimento saudável sugere que a empresa está atraindo novos clientes e mantendo os existentes.
## 3. Margem de Lucro Bruto
Por que é importante: Avalia a rentabilidade das vendas. Uma margem saudável indica que a empresa está gerenciando bem seus custos e preços.
## 4. Taxa de Retenção de Clientes
Por que é importante: Mede a capacidade da empresa em manter clientes ao longo do tempo. Clientes leais são cruciais para a sustentabilidade e crescimento a longo prazo.
## 5. Número de Novos Clientes
Por que é importante: Reflete a eficácia das estratégias de marketing e a capacidade de atrair novos leitores. Um fluxo constante de novos clientes é essencial para o crescimento.
## 6. Ticket Médio
Por que é importante: Mostra o valor médio gasto por cliente. Aumentar o ticket médio pode melhorar a rentabilidade sem a necessidade de atrair novos clientes.
## 7. Nível de Estoque e Rotatividade
Por que é importante: Monitora a eficiência do gerenciamento de inventário. Um bom equilíbrio ajuda a evitar excesso de estoque ou falta de produtos populares.

## Dados principais para cálculo dos KPIs

- 1. Volume de Vendas <br />
Tabela: Vendas - Fato <br />
Dados principais: quantidade_vendida <br />
Cálculo: Somar a quantidade_vendida para obter o volume total de livros vendidos em um período específico.<br />

- 2. Taxa de Crescimento de Vendas <br />
Tabela: Vendas - Fato <br />
Dados principais: valor_total, data_venda <br />
Cálculo: Comparar a valor_total de vendas em diferentes períodos para determinar o crescimento.<br />

- 3. Margem de Lucro Bruto <br />
Tabela: Livro, Vendas - Fato <br />
Dados principais: valor_total (da tabela Vendas - Fato), custo <br />
Cálculo: Subtrair o custo do livro da receita gerada e dividir pelo valor total para obter a margem. <br />

- 4. Taxa de Retenção de Clientes <br />
Tabela: Cliente, Vendas - Fato <br />
Dados principais: pk_id_cliente, data_venda <br />
Cálculo: Analisar o número de clientes que realizaram mais de uma compra em um período específico.<br />

- 5. Número de Novos Clientes <br />
Tabela: Cliente, Vendas - Fato <br />
Dados principais: pk_id_cliente, data_criacao (da tabela Cliente) <br />
Cálculo: Contar os clientes que realizaram a primeira compra em um período específico. <br />

- 6. Ticket Médio <br />
Tabela: Vendas - Fato <br />
Dados principais: valor_total, quantidade_vendida <br />
Cálculo: Dividir o valor_total pelas quantidade_vendida para encontrar o ticket médio por transação. <br />

- 7. Nível de Estoque e Rotatividade <br />
Tabela: Livro, Vendas - Fato <br />
Dados principais: quantidade (da tabela Livro), quantidade_vendida (da tabela Vendas - Fato) <br />
Cálculo: Verificar a quantidade disponível e comparar com a quantidade vendida para medir a rotatividade. <br />


## Diagrama do Projeto

.Abaixo está o diagrama que representa a estrutura do banco de dados:

![Diagrama do Projeto](/atividade2.drawio.png)



## RELACIONAL
![Relacional](/relacional.png)




## DATA WAREHOUSE
![DW_](https://github.com/user-attachments/assets/9e6f8988-cd3b-451f-a5ae-b9e67fce4834)





## Glossário de Dados

### Categoria
- **Descrição**: Representa as categorias ou gêneros a que os livros pertencem.
- **Atributos**:
  - **`pk_id_categoria`**: Identificador único da categoria. (Tipo: Integer, Chave Primária)
  - **`nome`**: Nome da categoria. (Tipo: String)
  - **`data_criacao`**: Data de criação da categoria. (Tipo: DateTime)
  - **`data_atualizacao`**: Data da última atualização da categoria. (Tipo: DateTime)

### Livro
- **Descrição**: Armazena as informações sobre os livros disponíveis para venda.
- **Atributos**:
  - **`pk_id_livro`**: Identificador único do livro. (Tipo: Integer, Chave Primária)
  - **`titulo`**: Título do livro. (Tipo: String)
  - **`autor`**: Nome do autor do livro. (Tipo: String)
  - **`descricao`**: Descrição ou sinopse do livro. (Tipo: String)
  - **`codigo`**: Código de identificação do livro (ex: ISBN). (Tipo: String)
  - **`custo`**: Identificador do preço unitário do livro. (Tipo: Decimal)
  - **`quantidade`**: Quantidade disponível em estoque. (Tipo: Integer)
  - **`data_criacao`**: Data de criação do registro do livro. (Tipo: DateTime)
  - **`data_atualizacao`**: Data da última atualização do registro do livro. (Tipo: DateTime)
  - **`fk_id_cliente`**: Identificador do cliente associado à compra (se aplicável). (Tipo: Integer, Chave Estrangeira)
  - **`fk_id_categoria`**: Identificador da categoria a que o livro pertence. (Tipo: Integer, Chave Estrangeira)

### Cliente
- **Descrição**: Contém as informações dos clientes que realizam compras.
- **Atributos**:
  - **`pk_id_cliente`**: Identificador único do cliente. (Tipo: Integer, Chave Primária)
  - **`nome`**: Nome completo do cliente. (Tipo: String)
  - **`cpf`**: CPF do cliente. (Tipo: String)
  - **`email`**: Endereço de e-mail do cliente. (Tipo: String)
  - **`telefone`**: Número de telefone do cliente. (Tipo: String)
  - **`data_criacao`**: Data de criação do registro do cliente. (Tipo: DateTime)
  - **`data_atualizacao`**: Data da última atualização do registro do cliente. (Tipo: DateTime)

### Endereço
- **Descrição**: Armazena os endereços dos clientes.
- **Atributos**:
  - **`pk_id_endereco`**: Identificador único do endereço. (Tipo: Integer, Chave Primária)
  - **`rua`**: Nome da rua do endereço. (Tipo: String)
  - **`numero`**: Número do endereço. (Tipo: String)
  - **`cep`**: Código postal (CEP) do endereço. (Tipo: String)
  - **`complemento`**: Complemento do endereço. (Tipo: String)
  - **`cidade`**: Nome da cidade do endereço. (Tipo: String)
  - **`estado`**: Nome do estado do endereço. (Tipo: String)
  - **`data_criacao`**: Data de criação do registro do endereço. (Tipo: DateTime)
  - **`data_atualizacao`**: Data da última atualização do registro do endereço. (Tipo: DateTime)
  - **`fk_id_cliente`**: Identificador do cliente associado ao endereço. (Tipo: Integer, Chave Estrangeira)

### Vendas - Fato
- **Descrição**: Tabela de fatos que registra as vendas realizadas, ligando livros e clientes.
- **Atributos**:
- - **`id_venda`**: Identificador da venda. (Tipo: Integer, Chave Primária)
  - **`fk_id_livro`**: Identificador do livro vendido. (Tipo: Integer, Chave Estrangeira)
  - **`fk_id_cliente`**: Identificador do cliente que realizou a compra. (Tipo: Integer, Chave Estrangeira)
  - **`fk_id_endereço`**: Identificador do endereço do cliente da venda. (Tipo: Integer, Chave Estrangeira)
  - **`data_venda`**: Data em que a venda foi realizada. (Tipo: DateTime)
  - **`quantidade_vendida`**: Quantidade de livros vendidos na transação (Tipo: Integer)
  - **`valor_total`**: Valor total da venda (Tipo: Decimal)
  - **`canal_venda`**: Canal de venda (ex: online, loja física) (Tipo: String)
  - **`forma_pagamento`**: Forma de pagamento utilizada (Tipo: String)
  - **`desconto_aplicado`**:  Valor do desconto aplicado, se houver (Tipo: Decimal)
  - **`data_extracao`**: Data e hora da extração/coleta dos dados (Tipo: TimeStamp)

## Estrutura de Tabelas

## Nomes Lógicos e Físicos:
### Tabela FATO: `fato_vendas`

| Nome Lógico             | Nome Físico         | Tipo de Dados              |
|-------------------------|---------------------|----------------------------|
| Identificador da Venda   | `id_venda`          | `SERIAL PRIMARY KEY`        |
| Identificador do Livro   | `fk_id_livro`       | `INT NOT NULL`              |
| Identificador do Cliente | `fk_id_cliente`     | `INT NOT NULL`              |
| Identificador do Endereço| `fk_id_endereco`    | `INT`                       |
| Data da Venda            | `data_venda`        | `TIMESTAMP NOT NULL`        |
| Quantidade Vendida       | `quantidade_vendida`| `INT NOT NULL`              |
| Valor Total da Venda     | `valor_total`       | `DECIMAL(10, 2) NOT NULL`   |
| Canal de Venda           | `canal_venda`       | `VARCHAR(50)`               |
| Forma de Pagamento       | `forma_pagamento`   | `VARCHAR(50)`               |
| Desconto Aplicado        | `desconto_aplicado` | `DECIMAL(10, 2)`            |
| Data da Extração         | `data_extracao`     | `TIMESTAMP DEFAULT NOW()`   |

### Tabela de Dimensão: `categoria`

| Nome Lógico             | Nome Físico         | Tipo de Dados              |
|-------------------------|---------------------|----------------------------|
| Identificador da Categoria | `pk_id_categoria` | `SERIAL PRIMARY KEY`        |
| Nome da Categoria        | `nome`              | `VARCHAR(255) NOT NULL`     |
| Data de Criação          | `data_criacao`      | `TIMESTAMP NOT NULL`        |
| Data de Atualização      | `data_atualizacao`  | `TIMESTAMP`                 |

### Tabela de Dimensão: `livro`

| Nome Lógico             | Nome Físico         | Tipo de Dados              |
|-------------------------|---------------------|----------------------------|
| Identificador do Livro   | `pk_id_livro`       | `SERIAL PRIMARY KEY`        |
| Título do Livro          | `titulo`            | `VARCHAR(255) NOT NULL`     |
| Autor do Livro           | `autor`             | `VARCHAR(255) NOT NULL`     |
| Descrição do Livro       | `descricao`         | `TEXT`                      |
| Código do Livro          | `codigo`            | `VARCHAR(50)`               |
| Custo                    | `custo`             | `DECIMAL(10, 2) NOT NULL`   |
| Quantidade em Estoque    | `quantidade`        | `INT NOT NULL`              |
| Identificador da Categoria | `fk_id_categoria` | `INT`                       |
| Data de Criação          | `data_criacao`      | `TIMESTAMP NOT NULL`        |
| Data de Atualização      | `data_atualizacao`  | `TIMESTAMP`                 |

### Tabela de Dimensão: `cliente`

| Nome Lógico             | Nome Físico         | Tipo de Dados              |
|-------------------------|---------------------|----------------------------|
| Identificador do Cliente | `pk_id_cliente`     | `SERIAL PRIMARY KEY`        |
| Nome do Cliente          | `nome`              | `VARCHAR(255) NOT NULL`     |
| CPF do Cliente           | `cpf`               | `VARCHAR(14) UNIQUE NOT NULL` |
| E-mail do Cliente        | `email`             | `VARCHAR(255) UNIQUE NOT NULL` |
| Telefone do Cliente      | `telefone`          | `VARCHAR(20)`               |
| Data de Criação          | `data_criacao`      | `TIMESTAMP NOT NULL`        |
| Data de Atualização      | `data_atualizacao`  | `TIMESTAMP`                 |

### Tabela de Dimensão: `endereco`

| Nome Lógico             | Nome Físico         | Tipo de Dados              |
|-------------------------|---------------------|----------------------------|
| Identificador do Endereço | `pk_id_endereco`   | `SERIAL PRIMARY KEY`        |
| Rua do Endereço          | `rua`               | `VARCHAR(255) NOT NULL`     |
| Número do Endereço       | `numero`            | `VARCHAR(10) NOT NULL`      |
| CEP do Endereço          | `cep`               | `VARCHAR(10) NOT NULL`      |
| Complemento do Endereço  | `complemento`       | `VARCHAR(255)`              |
| Cidade do Endereço       | `cidade`            | `VARCHAR(255) NOT NULL`     |
| Estado do Endereço       | `estado`            | `VARCHAR(255) NOT NULL`     |
| Identificador do Cliente | `fk_id_cliente`     | `INT NOT NULL`              |
| Data de Criação          | `data_criacao`      | `TIMESTAMP NOT NULL`        |
| Data de Atualização      | `data_atualizacao`  | `TIMESTAMP`                 |


### Tabela FATO: Vendas

```sql
CREATE TABLE fato_vendas (
    id_venda SERIAL PRIMARY KEY,            -- Identificador único para cada registro de venda
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



| Identificador do Cliente | `fk_id_cliente`     | `INT NOT NULL`              |
| Data de Criação          | `data_criacao`      | `TIMESTAMP NOT NULL`        |
| Data de Atualização      | `data_atualizacao`  | `TIMESTAMP`                 |
