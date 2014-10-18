--Lab6 Assignment--
--Joseph Schmidt, started 10/13/2014--

--Question 1 and Question 2--
select distinct c.city, c.name
from customers c right join(
	 select count(*) as num_city, c.name, c.city
	 from products p inner join customers c
	 on p.city = c.city
	 group by c.name, c.city 
) as count_cities on c.city = count_cities.city
where count_cities.num_city = (select count(*)
							   from products p
							   group by p.city
							   order by count(*) desc
							   limit 1
							  )
-- The answers are the same for questions one and two because event though there are two cities that make the most products--
--(Dallas and Newark) there are no customers from Newark ( Well, at least not yet; this will work for all time).

--Question 3--
--I was making this more complicated than it needed to be--
select p.pid
from products p
where p.priceUSD > (select avg(priceUSD)
					from products p
				   )
--Question 4--
select c.name, o.pid, o.dollars
from orders o inner join customers c
on o.cid = c.cid
order by o.dollars asc

--Question 5--
select c.name, count(o.ordno) 
from customers c left outer join orders o
on o.cid = c.cid
where o.ordno is not null
   or o.ordno is null
group by c.name
order by c.name asc
--This looks nice already, so coalesce was not needed.--

--Question 6--
select distinct c.name, a.name, p.name
from customers c inner join orders o
on o.cid = c.cid
inner join agents a
on o.aid = a.aid
inner join products p
on o.pid = p.pid
where a.city = 'New York'
order by c.name asc

--Question 7--
select o.dollars
from orders o
where o.dollars not in ( select p.priceUSD * o.qty as "Actual_Dollars"
						 from products p inner join orders o
						 on o.pid = p.pid
					   )
--Finished 10/17/14--				

