--Lab6 Assignment--
--Joseph Schmidt, started 10/13/2014--

--Question 1 and Question 2--
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
			       order by count(*) desc
			       limit 1)
-- The answers are the same for quesitons one and two because event though there are two cities that make the most products--
--(Dallas and Newark) there are no customers from Newark ( well, at least not yet. idk, this is a trick question).

--Question 3--
--I was making this more complicated than it needed to be--
select p.pid
from products p
where p.priceUSD > (select avg(priceUSD)
		    from products p)
