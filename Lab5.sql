--Lab5 Assignment--
--Joseph Schmidt, started 10/3/2014--

--Question1--
select distinct a.city
from orders o,
     agents a,
     customers c
where o.aid = a.aid
  and o.cid = c.cid
  and c.name = 'Tiptop'
order by a.city desc
			
--Question2--
with needed_agents as (select o.aid, o.pid
					   from customers c,
							orders o
					   where o.cid = c.cid
					   and c.city = 'Kyoto')
select distinct o.pid
from orders o inner join needed_agents
on o.aid = needed_agents.aid
order by o.pid
	   
--Question3--
select name
from customers
where cid not in(select cid
		 from orders)
		 
--Question4--
select c.name
from customers c left outer join orders o
on o.cid = c.cid
where o.ordno is not null

--In general, class helped clear a lot of this up.--
--Question5--
select distinct c.name, a.name
from orders o,
     customers c,
     agents a
where o.cid = c.cid
  and o.aid = a.aid
  and c.city = a.city
  
--Question6--
select distinct c.name as "Customer_name", a.name as "Agent_Name", c.city as "City_Name"
from orders o,
     customers c,
     agents a
where a.city = c.city

--Question7--
select distinct c.city, c.name
from customers c right join(
	 select count(p.city) as num_city, c.name, c.city
	 from products p inner join customers c
	 on p.city = c.city
	 group by c.name, c.city 
) as count_cities on c.city = count_cities.city
where count_cities.num_city = (select count(*)
							   from products p
							   group by p.city
							   order by count(*) asc
							   limit 1)
