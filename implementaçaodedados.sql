SELECT * FROM kysystem.clientes;
INSERT INTO kysystem.clientes (nome, cpf_cnpj, telefone, email, endereco, bloqueado) VALUES
('consumidor', '000.000.000-00', '(13) 00000-0000', 'consumidor@email.com', 'sem endereço', false),
('João da Silva', '123.456.789-00', '(13) 99111-1111', 'joao.silva@email.com', 'Rua das Flores, 123 - Santos/SP', FALSE),
('Maria Oliveira', '987.654.321-00', '(13) 99222-2222', 'maria.oliveira@email.com', 'Av. Ana Costa, 456 - Santos/SP', FALSE),
('Carlos Pereira', '456.789.123-00', '(13) 99333-3333', 'carlos.pereira@email.com', 'Rua Brás Cubas, 789 - Santos/SP', FALSE),
('Fernanda Souza', '741.852.963-00', '(13) 99444-4444', 'fernanda.souza@email.com', 'Rua Afonso Pena, 101 - São Vicente/SP', FALSE),
('Auto Mecânica Santos Ltda', '12.345.678/0001-90', '(13) 3222-1234', 'contato@automecanicasantos.com.br', 'Av. Conselheiro Nébias, 500 - Santos/SP', FALSE),
('Transportadora Litoral Ltda', '98.765.432/0001-10', '(13) 3233-4567', 'financeiro@transportadoralitoral.com.br', 'Rua Alexandre Martins, 800 - Guarujá/SP', FALSE),
('Ricardo Mendes', '159.357.258-46', '(13) 99555-5555', 'ricardo.mendes@email.com', 'Rua Goiás, 250 - Praia Grande/SP', TRUE),
('Patrícia Lima', '258.369.147-85', '(13) 99666-6666', 'patricia.lima@email.com', 'Rua Bahia, 75 - Cubatão/SP', FALSE),
('Oficina Rápida Express', '23.456.789/0001-45', '(13) 3228-9876', 'contato@oficinarapida.com.br', 'Av. Senador Feijó, 1200 - Santos/SP', FALSE),
('Lucas Ferreira', '357.951.456-12', '(13) 99777-7777', 'lucas.ferreira@email.com', 'Rua Paraná, 321 - Santos/SP', FALSE);


INSERT INTO kysystem.produtos
(codigo_interno, codigo_fabricante, descricao, marca, categoria_id, custo, preco_venda, estoque, estoque_minimo, localizacao, ativo)
VALUES
('P0001', '0986AF0012', 'Filtro de Óleo Bosch', 'Bosch', 1, 32.50, 45.90, 25, 5, 'A1-01', TRUE),
('P0002', 'PD1234', 'Pastilha de Freio Dianteira', 'Cobreq', 2, 85.00, 120.00, 18, 4, 'A2-03', TRUE),
('P0003', 'BKR6E', 'Vela de Ignição', 'NGK', 3, 18.00, 25.50, 60, 10, 'B1-02', TRUE),
('P0004', 'G16495', 'Amortecedor Dianteiro', 'Allen', 4, 250.00, 350.00, 8, 2, 'C1-01', TRUE),
('P0005', '60A123', 'Bateria 60A', 'Moura', 5, 360.00, 450.00, 12, 3, 'D1-04', TRUE),
('P0006', '17565R14', 'Pneu 175/65 R14', 'Pirelli', 6, 220.00, 280.00, 16, 4, 'E2-01', TRUE),
('P0007', '5W30SN', 'Óleo de Motor 5W30', 'Total', 7, 22.00, 32.00, 40, 10, 'F1-02', TRUE);

UPDATE kysystem.produtos SET nome = 'filtro oleo' WHERE codigo_interno = 'P0001';
UPDATE kysystem.produtos SET nome = 'pastilha freio' WHERE codigo_interno = 'P0002';
UPDATE kysystem.produtos SET nome = 'vela ignicao' WHERE codigo_interno = 'P0003';
UPDATE kysystem.produtos SET nome = 'amortecedor' WHERE codigo_interno = 'P0004';
UPDATE kysystem.produtos SET nome = 'bateria' WHERE codigo_interno = 'P0005';
UPDATE kysystem.produtos SET nome = 'pneu' WHERE codigo_interno = 'P0006';
UPDATE kysystem.produtos SET nome = 'oleo' WHERE codigo_interno = 'P0007';

select * from produtos;
alter table kysystem.produtos
modify column nome text after codigo_interno;

insert into kysystem.categorias (nome) values
('Filtros'),
('Freios'),
('Ignição'),
('Suspensão'),
('Baterias'),
('Pneus'),
('Lubrificantes');