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
