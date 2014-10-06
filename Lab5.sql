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
select distinct pid
from orders
where aid in(select aid
			 from orders
			 where cid in (select cid 
						   from customers
						   where city = 'Kyoto'
						  )
	        )
order by pid asc

select distinct o.pid
from orders o,
     customers c,
     agents a
where o.aid = a.aid
  and o.cid = c.cid
  and c.city = 'Kyoto'
-- Right now, this gives me the answer that I thought I needed last lab, when in fact there are three results missing.--

select *
from orders o left outer join customers c
on o.cid = c.cid
where c.city = 'Kyoto'
  

--Question3--
select name
from customers
where cid not in(select cid
		 from orders)
		 
--Question4--
select c.name
from customers c left outer join orders o
on o.cid = c.cid
where o.ordno is null

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
select distinct c.name, a.name, c.city
from orders o,
     customers c,
     agents a
where a.city = c.city

--Question7--
select *
from customers
where discount in(select discount 
				  from customers
				  where city in('Dallas','Kyoto')
				 )
--This is right, but I just want to make sure--


