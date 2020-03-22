-- function no return

CREATE OR REPLACE FUNCTION fix_user()
RETURNS void as
$$
    UPDATE "user"
    SET age =100
    WHERE age > 15
$$ LANGUAGE sql;

select fix_user();

-- function returning single value
CREATE OR REPLACE FUNCTION find_oldest_user()
    RETURNS integer as
    $$
    select max(age) from "user";
    $$ LANGUAGE SQL;

select find_oldest_user();

-- own data types
create type address as (
    street varchar(200),
    flat_number integer
                       );

INSERT INTO"user" (name, age, address)
VALUES ('anotherNameName' , 150 , ROW ('matrosova', 59));

select (address).flat_number as flat_number from "user";
select * from "user" where (address).street='matrosova'

-- function with composite parameters
CREATE OR REPLACE FUNCTION increment_flat(address, _number integer) RETURNS integer as $$
    SELECT $1.flat_number + $2
    $$ LANGUAGE SQL;

select increment_flat(ROW('first street', 2), 10);

-- function returning own type
CREATE OR REPLACE FUNCTION get_address(user_id integer) RETURNS address as $$
    SELECT address FROM "user" WHERE id=$1
    $$ LANGUAGE SQL ;

select (get_address).* from get_address(8);
                                                               
-- function wth out parameters
CREATE OR REPLACE FUNCTION sum_in(x int, y int, OUT sum int, OUT mul int) AS $$
        SELECT x + y, x * y;
    $$ LANGUAGE SQL;

select sum_in(5,2);
