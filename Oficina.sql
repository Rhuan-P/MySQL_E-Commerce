-- Criação das tabelas
CREATE TABLE Cliente (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  telefone VARCHAR(20),
  endereco VARCHAR(200)
);

-- Criação da tabela Veiculo com chave primária
CREATE TABLE Veiculo (
  id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
  placa VARCHAR(10) UNIQUE, -- Adicionando a restrição UNIQUE na coluna placa
  marca VARCHAR(50),
  modelo VARCHAR(50),
  ano INT,
  id_cliente INT,
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);



CREATE TABLE Servico (
  tipo_servico ENUM('Troca de óleo', 'Revisão', 'Alinhamento', 'Balanceamento', 'Troca de pneus', 'Freios', 'Suspensão', 'Motor'),
  valor DECIMAL(10, 2)
);


CREATE TABLE OrdemServico (
  id_ordem INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT,
  id_veiculo INT,
  placa VARCHAR(10) UNIQUE,
  tipo_servico ENUM('Troca de óleo', 'Revisão', 'Alinhamento', 'Balanceamento', 'Troca de pneus', 'Freios', 'Suspensão', 'Motor'),
  data_inicio DATE,
  data_fim DATE,
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
  FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo),
  FOREIGN KEY (placa) REFERENCES Veiculo(placa)
);

--Inserir dados

-- Inserção de dados na tabela Cliente
INSERT INTO Cliente (nome, telefone, endereco) VALUES
  ('João Silva', '123456789', 'Rua A, 123'),
  ('Maria Souza', '987654321', 'Avenida B, 456'),
  ('Pedro Santos', '555555555', 'Rua C, 789'),
  ('Ana Oliveira', '111111111', 'Rua D, 987'),
  ('Carlos Pereira', '222222222', 'Avenida E, 654'),
  ('Mariana Costa', '333333333', 'Rua F, 321'),
  ('Lucas Rodrigues', '444444444', 'Avenida G, 654'),
  ('Laura Almeida', '555555555', 'Rua H, 987'),
  ('Rafael Nunes', '666666666', 'Avenida I, 654'),
  ('Isabela Santos', '777777777', 'Rua J, 321');

-- Inserção de dados na tabela Veiculo
INSERT INTO Veiculo (id_cliente, placa, marca, modelo, ano) VALUES
  (1, 'ABC1234', 'Ford', 'Fiesta', 2018),
  (2, 'DEF5678', 'Chevrolet', 'Onix', 2020),
  (3, 'GHI9012', 'Volkswagen', 'Gol', 2015),
  (4, 'JKL3456', 'Toyota', 'Corolla', 2019),
  (5, 'MNO7890', 'Honda', 'Civic', 2017),
  (6, 'PQR1234', 'Fiat', 'Palio', 2016),
  (7, 'STU5678', 'Renault', 'Sandero', 2021),
  (8, 'VWX9012', 'Hyundai', 'HB20', 2020),
  (9, 'YZA3456', 'Nissan', 'Versa', 2018),
  (10, 'BCD7890', 'Mitsubishi', 'Lancer', 2017);

-- Inserção de dados na tabela Servico
INSERT INTO Servico (tipo_servico, valor) VALUES
  ('Troca de óleo', 100),
  ('Revisão', 200),
  ('Alinhamento', 50),
  ('Balanceamento', 50),
  ('Troca de pneus', 300),
  ('Freios', 150),
  ('Suspensão', 250),
  ('Motor', 500),
  ('Limpeza de ar-condicionado', 80),
  ('Troca de correia dentada', 120);

-- Inserção de dados na tabela OrdemServico


INSERT INTO OrdemServico (id_cliente, id_veiculo, placa, tipo_servico, data_inicio, data_fim) VALUES
  (1, 1, 'ABC1234', 'Troca de óleo', '2022-01-10', '2022-01-10'),
  (2, 2, 'DEF5678', 'Revisão', '2022-02-15', '2022-02-16'),
  (3, 3, 'GHI9012', 'Alinhamento', '2022-03-20', '2022-03-20'),
  (4, 4, 'JKL3456', 'Balanceamento', '2022-04-05', '2022-04-05'),
  (5, 5, 'MNO7890', 'Troca de pneus', '2022-05-12', '2022-05-12'),
  (6, 6, 'PQR1234', 'Freios', '2022-06-25', '2022-06-25'),
  (7, 7, 'STU5678', 'Suspensão', '2022-07-10', '2022-07-12'),
  (8, 8, 'VWX9012', 'Motor', '2022-08-18', '2022-08-19'),
  (9, 9, 'YZA3456', 'Troca de óleo', '2022-09-02', '2022-09-02'),
  (10, 10, 'BCD7890', 'Revisão', '2022-10-20', '2022-10-21');



-- Exemplos de queries SQL
-- Recuperações simples com SELECT Statement
SELECT * FROM Cliente;

SELECT * FROM Servico;

-- Filtros com WHERE Statement
SELECT * FROM Veiculo WHERE id_cliente = 1;

SELECT * FROM OrdemServico WHERE data_inicio > '2022-01-01';

-- Crie expressões para gerar atributos derivados
SELECT id_ordem, (SELECT SUM(valor) FROM Servico WHERE tipo_servico = OrdemServico.tipo_servico) AS valor_total FROM OrdemServico;

-- Defina ordenações dos dados com ORDER BY
SELECT * FROM Cliente ORDER BY nome;

SELECT * FROM Servico ORDER BY valor DESC;

-- Condições de filtros aos grupos - HAVING Statement
SELECT tipo_servico, COUNT(*) FROM OrdemServico GROUP BY tipo_servico;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
SELECT OrdemServico.id_ordem, Cliente.nome, Veiculo.placa, Veiculo.marca, Veiculo.modelo FROM OrdemServico
JOIN Cliente ON OrdemServico.id_cliente = Cliente.id_cliente
JOIN Veiculo ON OrdemServico.id_veiculo = Veiculo.id_veiculo;