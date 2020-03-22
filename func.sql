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

	
