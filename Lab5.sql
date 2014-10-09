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
from agents a full outer join orders o
on o.aid = a.aid,
     customers c, 
     products p
where o.cid = c.cid
  and o.pid = p.pid
  and c.city = 'Kyoto'
order by o.pid

select distinct o.pid
from orders o
where pid in(select o.pid
	from orders o,
	     customers c
	where o.cid = c.cid
	  --and o.aid = a.aid
	  and c.city = 'Kyoto'
     ) 
-- Right now, this gives me the answer that I thought I needed last lab, when in fact there are three results missing.--

select distinct o.pid
from orders o left outer join customers c
on o.cid = c.cid
join agents a
on o.aid = a.aid
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
select distinct c.name as "Customer_name", a.name as "Agent_Name", c.city as "City_Name"
from orders o,
     customers c,
     agents a
where a.city = c.city

--Question7--
-- I can use a sub query for this one. --
select p.city, min((p.city))
from ( select c.name, c.city, count(p.city)
       from orders o,
	    customers c,
	    products p
       group by c.name, c.city
     )

select c.name, c.city, min(p.city), count(p.city)
from(   select p.city, count(p.city)
	from products p
	group by p.city
    ) as foo,
    customers c,
    products p
where c.city = p.city
group by c.name, c.city
having min(p.city)

select count(c.city)
from customers c
where c.city = (select min(p.city)
		 from products p)-- this gives me two, which may or may not be helpful--
--This is helpful. I just have to figure how this worked out and then nest it in the having clause below and I should be golden--
		 
select c.name, c.city, count(c.city)
from customers c
where c.city in (select c.city--, count(p.city)
		 from products p,
		      customers c
		 where p.city = c.city
		 group by c.name, c.city, p.city --this is really close, like, I just need to get rid of those bottom two rows--
		 --limit 2
		)
group by c.name, c.city
--ANSWER FOR 7 THAT I HAVE. NOT 100% SURE IT IS COMPLETELY CORRECT, BUT I'LL TEST IT AND SEE--
select c.name, c.city
from products p,
     customers c
     where p.city = c.city
     group by c.name, c.city, p.city 
     having count(p.city) = ( select count(c.city)
			      from customers c
			      where c.city = (select min(p.city)
					      from products p))

-- this top one is right in a way, but I don't know--
-- this is also the closest I have gotten so far--
select c.city, c.name
from (
	select p.city, count(p.city)
	from orders o,
	     customers c,
	     products p
	group by p.city
     ) as foo
     
 select distinct c.name, c.city
 from orders o
	inner join(
	      select p.city, count(p.city)
	      from products p
	      group by p.city -- this is what i want--
	          ) as foo on o.cid = c.cid,
      customers c
group by c.name, c.city

select p.city, min(p.city)
from products p 
	inner join(
		select p.city, count(p.city)
		from products p
		group by p.city -- this is what i want, sort of...--
		) as foo on p.city = p.city
group by p.city

select c.name, c.city
from customers c
where c.city in( select p.city, count(p.city)
	         from products p
	         group by p.city
	         having  -- this is what i want--
	)


