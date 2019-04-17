create or replace function test()
   returns text AS $$
    declare
        total_rentals integer;
        id integer;
        list_of_custs text default '';
    begin
      for id in select distinct customer_id from payment order by customer_id
       loop
         select into total_rentals count(*) from payment where customer_id = id;
         if (total_rentals % 10 = 8) then
           raise notice 'customer: % has % rentals - two more is free!', id,total_rentals;
           list_of_custs := list_of_custs || ',' || id || ':' || total_rentals;
         end if;
       end loop;
      return list_of_custs;
    end;
$$ language plpgsql;

--delete from payment where payment_date to_timestamp(201800000);
insert into payment
values (0,17,2,1520,7.99,now());
insert into payment
values (1,17,2,1520,7.99,now());
insert into payment
values (2,17,2,1520,7.99,now());
insert into payment
values (3,17,2,1520,7.99,now());
insert into payment
values (4,17,2,1520,7.99,now());
insert into payment
values (5,17,2,1520,7.99,now());
insert into payment
values (6,17,2,1520,7.99,now());
insert into payment
values (7,17,2,1520,7.99,now());
insert into payment
values (8,17,2,1520,7.99,now());
insert into payment
values (9,17,2,1520,7.99,now());
insert into payment
values (10,17,2,1520,7.99,now());
insert into payment
values (11,17,2,1520,7.99,now());
insert into payment
values (12,17,2,1520,7.99,now());
insert into payment
values (13,17,2,1520,7.99,now());
insert into payment
values (14,17,2,1520,7.99,now());
insert into payment
values (15,17,2,1520,7.99,now());
insert into payment
values (16,17,2,1520,7.99,now());
insert into payment
values (17,17,2,1520,7.99,now());
insert into payment
values (18,17,2,1520,7.99,now());
insert into payment
values (19,17,2,1520,7.99,now());
insert into payment
values (20,17,2,1520,7.99,now());
insert into payment
values (21,17,2,1520,7.99,now());
insert into payment
values (22,17,2,1520,7.99,now());

select * from payment where customer_id = 17;

select test();