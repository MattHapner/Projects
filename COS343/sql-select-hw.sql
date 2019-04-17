-- #1
select category_id, name from category

-- #2
select country, count(city) as city_count
from country inner join city on country.country_id = city.country_id
group by country
order by count(city) desc

-- #3
select first_name, last_name, count(film_id)
from actor inner join film_actor fa on actor.actor_id = fa.actor_id
group by actor.actor_id
order by last_name, first_name

-- #4
select title, count(rental_id) as count
from film inner join inventory i on film.film_id = i.film_id
          inner join rental r on i.inventory_id = r.inventory_id
group by film.film_id
order by count(rental_id) desc, title
limit 10

-- #5
select first_name, last_name, c.name, count(f.film_id) as count
from actor inner join film_actor fa on actor.actor_id = fa.actor_id
           inner join film f on fa.film_id = f.film_id
           inner join film_category f2 on f.film_id = f2.film_id
           inner join category c on f2.category_id = c.category_id
where last_name like 'S%'
group by actor.actor_id, c.category_id
having count(f.film_id) >= 3
order by last_name, first_name, count(f.film_id) desc
