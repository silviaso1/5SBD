-- 1. Exiba todos os dados cadastrados na tabela de clientes:
	SELECT * FROM cliente

-- 2. Exiba apenas os nomes e as cidades dos clientes.
	SELECT cliente_nome, cidade FROM cliente

-- 3. Liste todas as contas registradas, exibindo o número da conta e o saldo.
    SELECT conta_numero, saldo FROM conta

-- 4. Liste os nomes dos clientes da cidade de Macaé.
	SELECT cliente_nome FROM cliente WHERE cidade LIKE 'Macaé'

-- 5. Exiba o código e o nome de todos os clientes com código entre 5 e 15.
	SELECT cliente_nome, cliente_cod 
    FROM cliente WHERE cliente_cod 
    BETWEEN 5 AND 15

-- 6. Exiba os clientes que moram em Niterói, Volta Redonda ou Itaboraí.
	SELECT cliente_nome 	
    FROM cliente 
    WHERE cidade IN ('Niterói', 'Volta Redonda', 'Itaboraí');

-- 7. Exiba os nomes dos clientes que começam com a letra "F".
	SELECT cliente_nome 
    FROM cliente 
    WHERE cliente_nome LIKE 'F%'

-- 8. Exiba uma frase com a seguinte estrutura para todos os clientes:
-- Exemplo: João Santos mora em Nova Iguaçu.
-- Utilize concatenação e alias para nomear a coluna como "Frase".
    SELECT cliente_nome || ' mora em ' || cidade AS "Frase"
    FROM cliente;

-- 9. Exiba os dados de todas as contas com saldo superior a R$ 9.000, ordenados do maior para o menor saldo.
	SELECT *
    FROM conta
    WHERE saldo > 9000
    ORDER BY saldo DESC;

-- 10. Liste os clientes que moram em Nova Iguaçu ou que tenham "Silva" no nome.
	SELECT *
    FROM cliente
    WHERE cidade = 'Nova Iguaçu'
   		OR cliente_nome LIKE '%Silva%';

-- 11. Exiba o saldo das contas com arredondamento para o inteiro mais próximo.
    SELECT conta_numero, ROUND(saldo) AS saldo_arredondado
    FROM conta;

-- 12. Exiba o nome de todos os clientes em letras maiúsculas.
    SELECT UPPER(cliente_nome) AS nome_maiusculo
    FROM cliente;

-- 13. Exiba os nomes dos clientes que não são das cidades de Teresópolis nem Campos dos
-- Goytacazes.
	SELECT cliente_nome, cidade
    FROM cliente
    WHERE cidade NOT IN ('Teresópolis', 'Campos dos Goytacazes');