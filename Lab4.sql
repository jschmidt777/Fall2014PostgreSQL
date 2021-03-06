﻿--Lab4 Assignment--
--Joseph Schmidt, started 9/13/2014--

--Example subquery--
select cid
from orders
where aid in (select aid
              from agents
              where city = 'Dallas')
--Question1--
select distinct city
from agents 
where aid in(select aid
			 from orders 
             where cid in (select cid
						   from customers 
						   where name = 'Tiptop'
						   )
			)
			   			
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
			--THIS IS THE ANSWER. IT SATISFYS THE CONDITION THAT THEY ORDERED FOR A CUSTOMER IN KYOTO AND THEN LISTS THE PRODUCTS THAT THEY ORDERED.--

--Question3--
select cid, name
from customers
where cid not in(select cid
				 from orders
			     where aid in(select aid
						      from agents	
							  where aid = 'a04'
							  )
				)
--Question4--
select cid, name
from customers
where cid in(select cid
			 from orders
             where pid='p01'
			 intersect
			 select cid
			 from orders
			 where pid='p07'
			)
--Nailed it. Intersect was the syntax I was missing.--
--Question5--
select pid 
from products
where pid in(select pid 
			 from orders
			 where aid in(select aid 
						  from agents
						  where aid = 'a04'
						 )
			)
--Question6--
select name, discount
from customers 
where cid in(select cid
			 from orders
			 where aid in(select aid
						  from agents
						  where city in('Dallas', 'New York')
						 )
			)
--Question7--
select *
from customers
where discount in(select discount 
				  from customers
				  where city in('Dallas','Kyoto')
				 )
--This is right, but I just want to make sure--
--Finished 9/30/2014--

