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
							   limit 1)
-- The answers are the same for questions one and two because even though there are two cities that make the most products--
--(Dallas and Newark) there are no customers from Newark ( Well, at least not yet; this should work for all time though).

--Question 3--
--I was making this more complicated than it needed to be--
select p.pid
from products p
where p.priceUSD > (select avg(priceUSD)
					from products p)
--Question 4--
select c.name, o.pid, o.dollars
from orders o inner join customers c
on o.cid = c.cid
order by o.dollars asc

--Question 5--
select count(o.ordno), c.name
from customers c left outer join orders o
on o.cid = c.cid
where o.ordno is not null
   or o.ordno is null
group by c.name
order by c.name
-- So I think I've done it here. There is no need for coalesce because it already says there are no orders from Weyland.--

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
from orders o full outer join (
select p.priceUSD * o.qty as "Actual_Dollars"
from products p inner join orders o
on o.pid = p.pid         ) 
as actual_dollars on actual_dollars = o.dollars

with actual_dollars as (	
			select p.priceUSD * o.qty as "Actual_Dollars"
			from products p inner join orders o
			on o.pid = p.pid  
				)
select o.dollars
from orders o,
     actual_dollars
where actual_dollars = o.dollars

select o.dollars
from orders o
where o.dollars not in ( select p.priceUSD * o.qty as "Actual_Dollars"
						 from products p inner join orders o
						 on o.pid = p.pid
					   )
--This is totally right if we are allowed to use sub-queries, which I don't see why we wouldn't be allowed to anyways. Otherwise, I have the other join query above to work on.--		       


