-- 1. Usando a sintaxe proprietária da Oracle, exiba o nome de cada cliente junto com o número
de sua conta.
SELECT c.nome, ct.num_conta
FROM cliente c, conta ct
WHERE c.id_cliente = ct.id_cliente;

--2. Mostre todas as combinações possíveis de clientes e agências (produto cartesiano).
SELECT c.nome, a.nome_agencia
FROM cliente c, agencia a;

--3. Usando aliases de tabela, exiba o nome dos clientes e a cidade da agência onde mantêm conta.
SELECT c.nome, a.cidade
FROM cliente c, conta ct, agencia a
WHERE c.id_cliente = ct.id_cliente
  AND ct.id_agencia = a.id_agencia;

--4. Exiba o saldo total de todas as contas cadastradas.
SELECT SUM(saldo) AS saldo_total
FROM conta;

-- 5. Mostre o maior saldo e a média de saldo entre todas as contas.
SELECT MAX(saldo) AS maior_saldo,
       AVG(saldo) AS media_saldo
FROM conta;

-- 6. Apresente a quantidade total de contas cadastradas.
SELECT COUNT(*) AS total_contas
FROM conta;

-- 7. Liste o número de cidades distintas onde os clientes residem.
SELECT COUNT(DISTINCT cidade) AS qtd_cidades
FROM cliente;

-- 8. Exiba o número da conta e o saldo, substituindo valores nulos por zero.
SELECT num_conta,
       NVL(saldo, 0) AS saldo_tratado
FROM conta;

-- 9. Exiba a média de saldo por cidade dos clientes.
SELECT c.cidade, AVG(ct.saldo) AS media_saldo
FROM cliente c
JOIN conta ct ON c.id_cliente = ct.id_cliente
GROUP BY c.cidade;

-- 10. Liste apenas as cidades com mais de 3 contas associadas a seus moradores.
SELECT c.cidade, COUNT(ct.num_conta) AS qtd_contas
FROM cliente c
JOIN conta ct ON c.id_cliente = ct.id_cliente
GROUP BY c.cidade
HAVING COUNT(ct.num_conta) > 3;

-- 11.Utilize a cláusula ROLLUP para exibir o total de saldos por cidade da agência e o total geral.
SELECT a.cidade,
       SUM(ct.saldo) AS total_saldo
FROM agencia a
JOIN conta ct ON a.id_agencia = ct.id_agencia
GROUP BY ROLLUP(a.cidade);

-- 12. Faça uma consulta com UNION que combine os nomes de cidades dos clientes e das agências, sem repetições.
SELECT cidade FROM cliente
UNION
SELECT cidade FROM agencia;
