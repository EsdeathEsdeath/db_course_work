SELECT car_name FROM car WHERE car_id = (SELECT MIN(inventory_id) FROM inventory); -- подзапрос, возвращает 1 значение

SELECT first_name, last_name FROM customer WHERE customer_id = (SELECT MAX(rental_id) FROM rental); -- same

SELECT carmaker, car_name, release_year, state, avg(state)  OVER (PARTITION BY carmaker) FROM car; -- оконная функция, выводит машины и среднее состояние
-- по каждому производителю

WITH low_rent_time AS ( SELECT carmaker, car_name, car_id FROM car WHERE rental_duration < 5) SELECT * FROM inventory WHERE car_id IN ( SELECT car_id FROM low_rent_time);
-- CTE
