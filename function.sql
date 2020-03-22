CREATE PROCEDURE insert_user(_name varchar(200), _age integer)
    LANGUAGE SQL AS
    $BODY$
        INSERT INTO "user" (name, age)
        VALUES(_name, _age);
    $BODY$;

CREATE PROCEDURE create_message(_text varchar(500), _user_id integer)
    LANGUAGE SQL AS
$BODY$
INSERT INTO "message" (value, user_id)
VALUES(_text, _user_id);
$BODY$;

CREATE OR REPLACE FUNCTION my_function(user_id integer) RETURNS TABLE(id integer, name varchar(200)) AS $$
BEGIN
    RETURN QUERY
        SELECT "user".id, "user".name
        FROM "user"
        WHERE "user".id = user_id;
END
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION get_users(user_id integer) RETURNS TABLE(id integer, name varchar(200)) AS $$
BEGIN
    RETURN QUERY
        
END
$$ LANGUAGE plpgsql;


select * from my_function(5);
