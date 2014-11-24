--
-- An example stored procedure ("function")
--
create or replace function get_courses_by_credits(int, REFCURSOR) returns refcursor as 
$$
declare
   num_credits int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select num, name, credits
      from   courses
       where  credits >= num_credits;
   return resultset;
end;
$$ 
language plpgsql;

select get_courses_by_credits(4, 'results');
Fetch all from results;


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
fetch all from results;

select * from prerequisites


   