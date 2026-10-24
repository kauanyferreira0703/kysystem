CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    login VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    perfil ENUM('ADMIN','VENDEDOR','CAIXA') NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from usuarios;

INSERT INTO usuarios (nome, login, senha, perfil, ativo) VALUES 
('José Silva', 'jose.silva', 'silva2024', 'VENDEDOR', 1),
('Ana Paula', 'ana.paula', 'ana123', 'CAIXA', 1),
('Carlos Eduardo', 'carlos.edu', 'carlos99', 'ADMIN', 1),
('Fernanda Lima', 'fernanda.l', 'ferlima', 'VENDEDOR', 1),
('Roberto Santos', 'roberto.s', 'bertosantos', 'CAIXA', 1),
('Juliana Oliveira', 'juliana.o', 'julioliveira', 'VENDEDOR', 0),
('Miguel Rodrigues', 'miguel.r', 'miguel123', 'VENDEDOR', 1),
('Patricia Souza', 'patricia.s', 'patysouza', 'ADMIN', 1),
('Bruno Costa', 'bruno.c', 'brunocosta', 'CAIXA', 1);

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    cpf_cnpj VARCHAR(20),
    telefone VARCHAR(20),
    email VARCHAR(150),
    endereco VARCHAR(255),
    bloqueado BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(200) NOT NULL,
    cnpj VARCHAR(20),
    telefone VARCHAR(20),
    email VARCHAR(150),
    endereco VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_interno VARCHAR(50) NOT NULL UNIQUE,
    codigo_fabricante VARCHAR(100),
    descricao VARCHAR(255) NOT NULL,
    marca VARCHAR(100),
    categoria_id INT,
    custo DECIMAL(10,2),
    preco_venda DECIMAL(10,2),
    estoque INT DEFAULT 0,
    estoque_minimo INT DEFAULT 0,
    localizacao VARCHAR(50),
    ativo BOOLEAN DEFAULT TRUE,

    FOREIGN KEY (categoria_id)
    REFERENCES categorias(id)
);

CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE compras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fornecedor_id INT NOT NULL,
    data_compra DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10,2),

    FOREIGN KEY (fornecedor_id)
    REFERENCES fornecedores(id)
);

CREATE TABLE itens_compra (
    id INT AUTO_INCREMENT PRIMARY KEY,
    compra_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2),

    FOREIGN KEY (compra_id)
    REFERENCES compras(id),

    FOREIGN KEY (produto_id)
    REFERENCES produtos(id)
);

CREATE TABLE vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    usuario_id INT NOT NULL,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    desconto DECIMAL(10,2) DEFAULT 0,
    valor_total DECIMAL(10,2),
    forma_pagamento VARCHAR(50),
    status ENUM(
        'ABERTA',
        'FINALIZADA',
        'CANCELADA'
    ) DEFAULT 'ABERTA',
    FOREIGN KEY (cliente_id)
    REFERENCES clientes(id),

    FOREIGN KEY (usuario_id)
    REFERENCES usuarios(id)
);

CREATE TABLE itens_venda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venda_id INT NOT NULL,
    produto_id INT NOt NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    FOREIGN KEY (venda_id)
    REFERENCES vendas(id),

    FOREIGN KEY (produto_id)
    REFERENCES produtos(id)
);

CREATE TABLE movimentacao_estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT NOT NULL,
    tipo ENUM(
        'ENTRADA',
        'SAIDA',
        'VENDA',
        'AJUSTE'
    ),

    quantidade INT NOT NULL,
    observacao VARCHAR(255),
    data_movimento DATETIME DEFAULT CURRENT_TIMESTAMP,
    usuario_id INT,
    FOREIGN KEY (produto_id)
    REFERENCES produtos(id),

    FOREIGN KEY (usuario_id)
    REFERENCES usuarios(id)
);

CREATE TABLE caixa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    data_abertura DATETIME,
    data_fechamento DATETIME,
    valor_inicial DECIMAL(10,2),
    valor_final DECIMAL(10,2),
    status ENUM(
        'ABERTO',
        'FECHADO'
    ) DEFAULT 'ABERTO',

    FOREIGN KEY (usuario_id)
    REFERENCES usuarios(id)
);

CREATE TABLE movimentacao_caixa (
    id INT AUTO_INCREMENT PRIMARY KEY,
	caixa_id INT NOT NULL,
    tipo ENUM(
        'ENTRADA',
        'SAIDA',
        'SANGRIA'
        ),
    descricao VARCHAR(255),
    valor DECIMAL(10,2),
    data_movimento DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (caixa_id)
    REFERENCES caixa(id)
);

CREATE TABLE contas_receber (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    venda_id INT,
    vencimento DATE,
    valor DECIMAL(10,2),
    status ENUM(
        'PENDENTE',
        'PAGO'
    ) DEFAULT 'PENDENTE',

    FOREIGN KEY (cliente_id)
    REFERENCES clientes(id),
    FOREIGN KEY (venda_id)
    REFERENCES vendas(id)
);

CREATE TABLE contas_pagar (
    id INT AUTO_INCREMENT PRIMARY KEY,
	fornecedor_id INT,
    vencimento DATE,
    valor DECIMAL(10,2),
    status ENUM(
        'PENDENTE',
        'PAGO'
    ) DEFAULT 'PENDENTE',
    FOREIGN KEY (fornecedor_id)
    REFERENCES fornecedores(id)
);

show  tables
('José Silva', 'jose.silva', 'silva2024', 'VENDEDOR', 1), ('Ana Paula', 'ana.paula', 'ana123', 'CAIXA', 1), ('Carlos Eduardo', 'carlos.edu', 'carlos99', 'ADMIN', 1), ('Fernanda Lima', 'fernanda.l', 'ferlima', 'VENDEDOR', 1), ('Roberto Santos', 'roberto.s', 'bertosantos', 'CAIXA', 1), ('Juliana Oliveira', 'juliana.o', 'julioliveira', 'VENDEDOR', 0), ('Miguel Rodrigues', 'miguel.r', 'miguel123', 'VENDEDOR', 1), ('Patricia Souza', 'patricia.s', 'patysouza', 'ADMIN', 1), ('Bruno Costa', 'bruno.c', 'brunocosta', 'CAIXA', 1)
