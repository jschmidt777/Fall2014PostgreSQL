--Lab4 Assignment--
--Joseph Schmidt, started 9/13/2014--

--Question1--
select distinct city
from agents
where city in(	select name 
		from customers
		where name='Tiptop')
select city
from agents
where city in(	select cid 
		from orders
		where cid='c001')
select distinct cid 
from orders
where cid='c001'



select distinct city
from Agents
where city in ( select cid
		from orders
		where cid in (	select name
				from customers
				where name='Tiptop'))
select name 
from customers
where name='Tiptop' 

select name
from customers
where 'Tiptop' in (select distinct city
			from Agents)
--does this work--
select distinct city 
from Agents
where 'ACME' in ( 	select name
			from customers
			where name = 'ACME')

select name
from customers
where name in (		select distinct city
			from agents
			where name ='Tiptop')
--Example subquery--
select cid
from orders
where aid in (select aid
              from agents
              where city = 'Dallas')
select distinct city
from agents
where aid in(
	select distinct aid
	from orders
	where cid in (select cid
		      from customers
		      where name = 'Tiptop'))
			
--Question2--
--Question3--
select cid, name
from customers
where 

