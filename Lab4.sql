--Lab4 Assignment--
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
where aid in(select distinct aid
	     from orders
             where cid in (select cid
			   from customers
			   where name = 'Tiptop'))
			   			
--Question2--
--Get the pids of products ordered through and agent who makes at least one order for a customer in Kyoto.--
select aid
from orders
where pid in(select pid
	     from products)
select distinct pid
from products
where pid in(select pid
	     from orders
	     where cid in(select cid 
			  from customers
			  where city = 'Kyoto'))
			  --This needs more something but not nesting to include agents--

--Question3--
select cid, name
from customers
where cid not in (select cid
		  from orders
		  where aid in(select aid
			       from agents	
			       where aid = 'a04'))
--Question4--
select cid, name
from customers
where cid in (select cid
	      from orders
	      where pid in (select pid
			    from products
			    where pid='p01'and pid='p07'))
			    --This should be working but it doesn't and I can't figure out why.--
--Question5--
select pid 
from products
where pid in(select pid 
	     from orders
	     where aid in(select aid 
			  from agents
			  where aid = 'a04'))
--Question6--
select name, discount
from customers 
where cid in (select cid
	      from orders
	      where aid in(select aid
			   from agents
			   where city in('Dallas', 'New York')))
--Question7--
select *
from customers
where discount in(select discount 
		  from customers
		  where city in('Dallas','Kyoto'))
--This is right, but I just want to make sure--

