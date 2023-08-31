
-- Criação das Tabelas
CREATE TABLE Clientes (
    ID_do_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Tipo_de_Cliente ENUM('PJ', 'PF'),
    Email VARCHAR(100),
    Endereco VARCHAR(200),
    Contato VARCHAR(20)
);

CREATE TABLE Formas_de_Pagamento (
    ID_da_Forma_de_Pagamento INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(100)
);

CREATE TABLE Pedidos (
    ID_do_Pedido INT PRIMARY KEY AUTO_INCREMENT,
    ID_do_Cliente INT,
    Data_do_Pedido DATE,
    Status_do_Pedido ENUM('Processando', 'Enviado', 'Entregue'),
    FOREIGN KEY (ID_do_Cliente) REFERENCES Clientes(ID_do_Cliente)
);
CREATE TABLE Produtos (
    ID_do_Produto INT PRIMARY KEY AUTO_INCREMENT,
    Nome_do_Produto VARCHAR(100),
    Descricao VARCHAR(200),
    Preco DECIMAL(10, 2),
    Estoque_Disponivel INT
);
CREATE TABLE Itens_do_Pedido (
    ID_do_Item INT PRIMARY KEY AUTO_INCREMENT,
    ID_do_Pedido INT,
    ID_do_Produto INT,
    Quantidade_do_Item INT,
    Preco_Unitario_do_Item DECIMAL(10, 2),
    FOREIGN KEY (ID_do_Pedido) REFERENCES Pedidos(ID_do_Pedido),
    FOREIGN KEY (ID_do_Produto) REFERENCES Produtos(ID_do_Produto)
);



CREATE TABLE Fornecedores (
    ID_do_Fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    Nome_do_Fornecedor VARCHAR(100)
);

CREATE TABLE Estoque (
    ID_do_Estoque INT PRIMARY KEY AUTO_INCREMENT,
    ID_do_Produto INT,
    ID_do_Fornecedor INT,
    Quantidade_em_Estoque INT,
    FOREIGN KEY (ID_do_Produto) REFERENCES Produtos(ID_do_Produto),
    FOREIGN KEY (ID_do_Fornecedor) REFERENCES Fornecedores(ID_do_Fornecedor)
);

CREATE TABLE Entregas (
    ID_da_Entrega INT PRIMARY KEY AUTO_INCREMENT,
    ID_do_Pedido INT,
    Status_da_Entrega VARCHAR(50),
    Codigo_de_Rastreio VARCHAR(50),
    FOREIGN KEY (ID_do_Pedido) REFERENCES Pedidos(ID_do_Pedido)
);

-- Inserção de Dados de Exemplo
-- Clientes
INSERT INTO Clientes (Nome, Tipo_de_Cliente, Email, Endereco, Contato)
VALUES
    ('Maria Silva', 'PF', 'maria@email.com', 'Rua das Flores, 123', '9876543210'),
    ('Empresa XYZ', 'PJ', 'contato@empresa.com', 'Avenida Principal, 456', '5555555555'),
    ('João Santos', 'PF', 'joao@email.com', 'Rua dos Sonhos, 789', '1231231234'),
    ('Comércio ABC', 'PJ', 'contato@comercio.com', 'Rua Comercial, 1010', '7897897890'),
    ('Ana Oliveira', 'PF', 'ana@email.com', 'Avenida Central, 111', '4564564567'),
    ('Distribuidora DEF', 'PJ', 'contato@distribuidora.com', 'Rua da Distribuição, 222', '9998887776'),
    ('Rafaela Costa', 'PF', 'rafaela@email.com', 'Praça dos Sonhos, 333', '1112223334'),
    ('Fornecedor GHI', 'PJ', 'contato@fornecedor.com', 'Avenida dos Fornecedores, 444', '4445556665'),
    ('Pedro Almeida', 'PF', 'pedro@email.com', 'Rua das Oportunidades, 555', '7778889990'),
    ('Indústria JKL', 'PJ', 'contato@industria.com', 'Avenida da Indústria, 666', '2223334444'),
    ('ClienteFornecedor1', 'PF', 'cliente_fornecedor1@email.com', 'Endereço Cliente/Fornecedor 1', '1111111111'),
    ('ClienteFornecedor2', 'PF', 'cliente_fornecedor2@email.com', 'Endereço Cliente/Fornecedor 2', '2222222222');
-- Formas de Pagamento
INSERT INTO Formas_de_Pagamento (Descricao)
VALUES
    ('Transferência Bancária'),
    ('Pix'),
    ('Dinheiro na Entrega'),
    ('Cartão de Débito'),
    ('Boleto Bancário'),
    ('Cartão de Crédito'),
    ('Cheque'),
    ('PayPal'),
    ('PicPay'),
    ('Mercado Pago');

-- Produtos
INSERT INTO Produtos (Nome_do_Produto, Descricao, Preco, Estoque_Disponivel)
VALUES
    ('Smartphone', 'Smartphone Android 5G', 1500.00, 30),
    ('Notebook', 'Notebook Intel Core i7', 2500.00, 20),
    ('TV 4K', 'TV LED 55 polegadas', 1200.00, 15),
    ('Cadeira Escritório', 'Cadeira Ergonômica', 350.00, 50),
    ('Fone de Ouvido', 'Fone Bluetooth com Cancelamento de Ruído', 200.00, 10),
    ('Mouse sem Fio', 'Mouse Óptico sem Fio', 50.00, 25),
    ('Monitor Curvo', 'Monitor LED 27 polegadas', 800.00, 30),
    ('Teclado Mecânico', 'Teclado Mecânico RGB', 150.00, 60),
    ('Impressora Multifuncional', 'Impressora Jato de Tinta', 300.00, 5),
    ('Câmera DSLR', 'Câmera Fotográfica DSLR', 1200.00, 18);

-- Fornecedores
INSERT INTO Fornecedores (Nome_do_Fornecedor)
VALUES
    ('TechSupplies Ltda.'),
    ('ElectroTech S.A.'),
    ('OfficeFurniture Corp.'),
    ('SoundWave Electronics'),
    ('GadgetMasters'),
    ('ErgoComfort Ind.'),
    ('MonitorTech'),
    ('KeyboardsRUs'),
    ('PrintInk Solutions'),
    ('FotoExpress'),
    ('ClienteFornecedor1'), 
    ('ClienteFornecedor2'); 

-- Estoque
INSERT INTO Estoque (ID_do_Produto, ID_do_Fornecedor, Quantidade_em_Estoque)
VALUES
    (1, 1, 15),
    (2, 2, 10),
    (3, 3, 5),
    (4, 4, 30),
    (5, 5, 8),
    (6, 6, 20),
    (7, 7, 25),
    (8, 8, 40),
    (9, 9, 3),
    (10, 10, 12);

-- Pedidos
INSERT INTO Pedidos (ID_do_Cliente, Data_do_Pedido, Status_do_Pedido)
VALUES
    (1, '2023-08-29', 'Processando'),
    (2, '2023-08-28', 'Enviado'),
    (3, '2023-08-27', 'Processando'),
    (4, '2023-08-26', 'Enviado'),
    (5, '2023-08-25', 'Processando'),
    (6, '2023-08-24', 'Enviado'),
    (7, '2023-08-23', 'Processando'),
    (8, '2023-08-22', 'Enviado'),
    (9, '2023-08-21', 'Processando'),
    (10, '2023-08-20', 'Processando');


-- Queries SQL
-- 1. Quantos pedidos foram feitos por cada cliente?
SELECT c.Nome, COUNT(p.ID_do_Pedido) AS Quantidade_de_Pedidos
FROM Clientes c
JOIN Pedidos p ON c.ID_do_Cliente = p.ID_do_Cliente
GROUP BY c.Nome;

-- 2. Algum vendedor também é fornecedor?
SELECT DISTINCT v.Nome
FROM Clientes v
JOIN Fornecedores f ON v.Nome = f.Nome_do_Fornecedor;

-- 3. Relação de produtos fornecedores e estoques
SELECT p.Nome_do_Produto, f.Nome_do_Fornecedor, e.Quantidade_em_Estoque
FROM Produtos p
JOIN Estoque e ON p.ID_do_Produto = e.ID_do_Produto
JOIN Fornecedores f ON e.ID_do_Fornecedor = f.ID_do_Fornecedor;

-- 4. Relação de nomes dos fornecedores e nomes dos produtos
SELECT f.Nome_do_Fornecedor, p.Nome_do_Produto
FROM Fornecedores f
JOIN Estoque e ON f.ID_do_Fornecedor = e.ID_do_Fornecedor
JOIN Produtos p ON e.ID_do_Produto = p.ID_do_Produto;