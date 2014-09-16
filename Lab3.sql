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
