use PRACTICE

select *from AGENTS

SELECT AGENT_CODE, AGENT_NAME
FROM AGENTS
WHERE WORKING_AREA='London'
GROUP BY AGENT_CODE, AGENT_NAME;


----------ORDER BY USING COUNT()
SELECT COUNT(AGENT_CODE) AS NoOfAgents, WORKING_AREA
FROM AGENTS
GROUP BY WORKING_AREA
ORDER BY COUNT(AGENT_CODE)
ASC


SELECT *FROM AGENTS
WHERE COMMISSION = (SELECT MAX(COMMISSION) FROM AGENTS);


-----------AGV OG TOP THREE COMMISSION
SELECT TOP 3 AVG(COMMISSION) AS TOPTHREE
FROM AGENTS




----------------USNG UNION AND UNION ALL CLAUSE
CREATE TABLE TABLE1(ID INT)
INSERT INTO TABLE1 VALUES(1),(2),(3),(4),(5);
SELECT * FROM TABLE1

CREATE TABLE TABLE2(ID INT)
INSERT INTO TABLE2 VALUES(6),(7),(8),(9),(10);
SELECT * FROM TABLE2

SELECT ID 
FROM TABLE1 
UNION 
SELECT ID 
FROM TABLE2;


---------------CREATE THIRD TABLE FROM THAT UNION SET TABLE(IN DESENDING ORDER )

CREATE TABLE TABLE3(ID INT)

INSERT INTO TABLE3 SELECT ID FROM TABLE1
UNION
SELECT ID FROM TABLE2
ORDER BY ID
DESC

SELECT * FROM TABLE3


--------------USING HAVING CLAUSE
SELECT *FROM AGENTS

SELECT COUNT(COMMISSION) AS COMMISSIONCOUNT,WORKING_AREA
FROM AGENTS 
GROUP BY WORKING_AREA
HAVING COUNT(COMMISSION)>=1
ORDER BY COUNT(COMMISSION)
DESC


SELECT *
FROM AGENTS
WHERE EXISTS(
SELECT AGENT_NAME
FROM AGENTS 
WHERE WORKING_AREA='abc' OR COMMISSION=0.15)

SELECT *FROM AGENTS









