-- Create stored procedure is_next_movie_free
-- to determine if the next movie is free
create or replace function is_next_movie_free(cust_id integer)
  returns boolean as $$
    declare
        total_rentals integer;
    begin
      select into total_rentals
        count(*)
      from payment
      where customer_id = cust_id;
      return (total_rentals % 10) = 9;
    end;
  $$ language plpgsql;

-- Create trigger payment_trigger function
-- This function will set the payment amount to 0 if customer's next
-- rental will be free.
create or replace function payment_trigger()
  returns trigger as $$
    begin
      if is_next_movie_free(new.customer_id) then
        new.amount = 0;
      end if;
      return new;
    end;
  $$ language plpgsql;

-- Drop the below trigger if it already exists
drop trigger if exists one_free_every_ten on payment;

-- Create trigger one_free_every_ten to execute trigger function
-- before insert into payment table
create trigger one_free_every_ten
  before insert
  on payment
  for each row
  execute procedure payment_trigger()

