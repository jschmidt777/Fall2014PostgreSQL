
--Stored Procedure One--
create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as
$$
declare
   courseNumber int   	   :=$1;
   resultset REFCURSOR	   :=$2;

begin 
   open resultset for 
   select prereqnum
   from Prerequisites
   where coursenum = courseNumber;
   return resultset;
end;
$$
language plpgsql;   


select PreReqsFor(308, 'results');
fetch all from results;

--Stored Procedure Two--
create or replace function IsPreReqsFor(int, REFCURSOR) returns refcursor as
$$
declare
   courseNumber int   	   :=$1;
   resultset REFCURSOR	   :=$2;

begin 
   open resultset for 
   select coursenum
   from Prerequisites
   where prereqnum = courseNumber;
   return resultset;
end;
$$
language plpgsql;   

select IsPreReqsFor(308, 'results');
fetch all from results;

--Honest Attempt For the optional Recursive Stored Procedure--
drop function allprereqsfor(integer)
create or replace function AllPreReqsFor(int) returns SETOF prerequisites as
$$
declare
   courseNumber int   	   :=$1;
   req int; 
begin 
   for req in select prereqnum from Prerequisites
   where coursenum = courseNumber
   loop 
   return next req;
   end loop;
end;
$$
language plpgsql;   

select * from AllPreReqsFor(499);


   