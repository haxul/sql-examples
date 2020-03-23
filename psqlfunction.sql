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
