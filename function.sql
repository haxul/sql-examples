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


CREATE OR REPLACE FUNCTION get_users(_user_id integer) RETURNS TABLE(
    id integer,
    name varchar(200),
    message_id integer,
    message_value varchar(200)
    ) AS $$
BEGIN
    RETURN QUERY
    select u.id as id, u.name as name, m.id as message_id, m.value as message_value
    from "user" u
    left join message m on u.id = m.user_id
    where u.id = _user_id;
END
$$ LANGUAGE plpgsql;


select * from get_users(5);
