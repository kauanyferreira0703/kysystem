select * from produtos;

SELECT * FROM PRODUTOs where marca= 'bosch';

update produtos set preco_venda = 40.00 where id= 16;

SELECT p.descricao, p.marca, c.nome AS categoria, p.preco_venda FROM produtos p
INNER JOIN categorias c ON p.categoria_id = c.id;

select count(*) FROM PRODUTOS; 
select max(preco_venda) from produtos;

SELECT marca, COUNT(*) AS quantidade FROM produtos
GROUP BY marca;

select marca, round(avg(preco_venda),2) from produtos
group by marca;

use kysystem;
 select id, codigo_interno, descricao, marca from produtos;
 
 Select descricao, preco_venda from produtos 
 order by preco_venda desc;
 
 Select * from produtos
 where ativo = false;
 
 select * from produtos where estoque >= estoque_minimo;
 

select * from produtos where descricao like '%filtro%' ;

select marca from produtos where upper(marca) like 'bosch' or 'ngk';

select round(avg(preco_venda),2) from produtos; 

select 
   id, estoque,
   sum(custo * estoque) as valor_total_custo 
from produtos
group by id, estoque;



alter table produtos
add column nome text;

select p.descricao,  i.quantidade, i.preco_unitario , i.subtotal
from produtos as p
join itens_venda as i 
on i.id = p.id;


select marca, avg(preco_venda) as quantidade 
 from produtos
 group by marca;



 
 