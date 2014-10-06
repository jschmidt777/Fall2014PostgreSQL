--Lab5 Assignment--
--Joseph Schmidt, started 10/3/2014--

--Example subquery--
select cid
from orders
where aid in (select aid
              from agents
              where city = 'Dallas')
--Question1--
select agents.aid, orders.cid
from orders
left join agents on agents.aid = orders.cid
where customers.name = 'Tiptop'

--No clue as to how this should work w/ three tables (orders being involved some how)--

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

--Class helped clear a lot of this up--
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


