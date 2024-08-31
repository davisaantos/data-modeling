# Glossário de Dados

## Categoria
- **Descrição**: Representa as categorias ou gêneros a que os livros pertencem.
- **Atributos**:
  - **`pk_id_categoria`**: Identificador único da categoria. (Tipo: Integer, Chave Primária)
  - **`nome`**: Nome da categoria. (Tipo: String)
  - **`data_criacao`**: Data de criação da categoria. (Tipo: DateTime)
  - **`data_atualizacao`**: Data da última atualização da categoria. (Tipo: DateTime)

## Livro
- **Descrição**: Armazena as informações sobre os livros disponíveis para venda.
- **Atributos**:
  - **`pk_id_livro`**: Identificador único do livro. (Tipo: Integer, Chave Primária)
  - **`titulo`**: Título do livro. (Tipo: String)
  - **`autor`**: Nome do autor do livro. (Tipo: String)
  - **`descricao`**: Descrição ou sinopse do livro. (Tipo: String)
  - **`codigo`**: Código de identificação do livro (ex: ISBN). (Tipo: String)
  - **`quantidade`**: Quantidade disponível em estoque. (Tipo: Integer)
  - **`data_criacao`**: Data de criação do registro do livro. (Tipo: DateTime)
  - **`data_atualizacao`**: Data da última atualização do registro do livro. (Tipo: DateTime)
  - **`fk_id_cliente`**: Identificador do cliente associado à compra (se aplicável). (Tipo: Integer, Chave Estrangeira)
  - **`fk_id_categoria`**: Identificador da categoria a que o livro pertence. (Tipo: Integer, Chave Estrangeira)

## Cliente
- **Descrição**: Contém as informações dos clientes que realizam compras.
- **Atributos**:
  - **`pk_id_cliente`**: Identificador único do cliente. (Tipo: Integer, Chave Primária)
  - **`nome`**: Nome completo do cliente. (Tipo: String)
  - **`cpf`**: CPF do cliente. (Tipo: String)
  - **`email`**: Endereço de e-mail do cliente. (Tipo: String)
  - **`telefone`**: Número de telefone do cliente. (Tipo: String)
  - **`data_criacao`**: Data de criação do registro do cliente. (Tipo: DateTime)
  - **`data_atualizacao`**: Data da última atualização do registro do cliente. (Tipo: DateTime)

## Endereço
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

## Vendas - Fato
- **Descrição**: Tabela de fatos que registra as vendas realizadas, ligando livros e clientes.
- **Atributos**:
  - **`pk_id_livro`**: Identificador do livro vendido. (Tipo: Integer, Chave Estrangeira)
  - **`pk_id_cliente`**: Identificador do cliente que realizou a compra. (Tipo: Integer, Chave Estrangeira)
  - **`data_venda`**: Data em que a venda foi realizada. (Tipo: DateTime)

## Relacionamentos

- **SEPARA**: Associa uma `Categoria` com múltiplos `Livros`.
- **COMPRA**: Associa um `Cliente` com os `Livros` que ele comprou.
- **RESIDE**: Associa um `Cliente` com o `Endereço` onde ele reside.
