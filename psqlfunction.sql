CREATE OR REPLACE FUNCTION get_max(a real, b real) RETURNS real AS
    $$
        BEGIN
           RETURN a + b;
        END;
    $$ LANGUAGE plpgsql;


SELECT get_max(1.2, 1.1);


CREATE OR REPLACE FUNCTION sum_p(a int, b int , OUT sum int , OUT product int) AS $$
    BEGIN
        sum:= a + b;
        product:= a * b;
    end;
    $$ LANGUAGE plpgsql;

SELECT (sum_p(10, 10)).*;

CREATE OR REPLACE FUNCTION get_user(a int) RETURNS SETOF "user" AS $$
    begin
        RETURN QUERY select * from "user" where id=a;
    end;
    $$ LANGUAGE plpgsql;

select (get_user(5)).*;

CREATE OR REPLACE FUNCTION find_user() RETURNS SETOF "user" AS $$
    DECLARE
        average_age real;
    begin
        select avg("user".age) into average_age from "user";
        RETURN QUERY SELECT * FROM "user" WHERE age > average_age::int;
    end;
    $$ LANGUAGE plpgsql;

select (find_user()).*;


CREATE OR REPLACE FUNCTION ages() RETURNS int[] AS $$
    DECLARE
        ages_arr int[];
        manager record;
    begin
        FOR manager IN SELECT age FROM "user"  WHERE age is not null LOOP
            ages_arr:= array_append(ages_arr, manager.age);
        end loop;
        RETURN ages_arr;
    end;
    $$ LANGUAGE plpgsql;

select ages();
