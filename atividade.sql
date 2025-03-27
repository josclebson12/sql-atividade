CREATE DATABASE Loja;
USE Loja;

CREATE TABLE Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE Vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    quantidade INT NOT NULL,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

DELIMITER $$
CREATE TRIGGER Atualizar_Estoque
BEFORE INSERT ON Vendas
FOR EACH ROW
BEGIN
    UPDATE Produtos 
    SET estoque = estoque - NEW.quantidade 
    WHERE id_produto = NEW.id_produto;
END $$
DELIMITER ;
