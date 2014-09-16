--Questions for Lab3--
--Note: Some of the queries were tricky since some of the data is--
--abreviated. For example, in question7, the months are abreviated.--

--Question1--
select name, city
from Agents
where name='Bond'
--Question2--
select pid, name, quantity
from products
where priceUSD >= 0.99
--Question3--
select ordno, qty
from orders
--Question4--
select name, city
from customers
where city = 'Duluth'
--Question5--
select name, city   --I put in city to show more of a distinction.--
from Agents
where city <> 'New York' and city <> 'London'
--Question6--
select *
from products
where city <> 'Dallas' and city <> 'Duluth' and priceUSD <= 1.00
--Question7--
select *
from orders
where mon = 'jan' or mon = 'apr'
--Question8--
select *
from orders
where mon = 'feb' and dollars > 200  --dollars is not a good title--
--Question9--
select *
from orders
where cid = 'c005' --c005 didn't order anything in this snapshot of the db--
