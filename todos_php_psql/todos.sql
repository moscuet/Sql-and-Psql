-- inser data base:  $ heroku pg:psql postgresql-elliptical-05335 --app postgres-todos-app < todos.sql
-- accessing database/ heroku cli: $ heroku pg:psql postgresql-elliptical-05335 --app postgres-todos-app

-- create user TABLE
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS pgcrypto;
DROP TABLE IF EXISTS todos;
DROP TABLE IF EXISTS users; 
CREATE TABLE users (
    user_id uuid DEFAULT uuid_generate_v4 (),
    email VARCHAR (255) UNIQUE NOT NULL,
    password VARCHAR NOT NULL,
    created_on TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_on TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (user_id)
);

-- insert values to users table

INSERT INTO users (
    user_id,
    email,
    password,
    created_on,
    updated_on

)
VALUES
    (   '2b30e942-4313-4b6e-88ee-ad335a13ef2a',
        'mos1@gmail.com',
        crypt('mos1', gen_salt('bf')),
        current_timestamp,
        current_timestamp
    ),
    (
        uuid_generate_v4 (),
        'mos2@gmail.com',
        crypt('mos2', gen_salt('bf')),
        current_timestamp,
        current_timestamp
    );


-- create todos table 

CREATE TABLE todos (
    todo_id uuid DEFAULT uuid_generate_v4 (),
    name VARCHAR (255) NOT NULL,
    user_id uuid NOT NULL,
    created_on TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_on TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (todo_id),
    FOREIGN KEY(user_id)
        REFERENCES users(user_id)
);


-- insert values to todos table

INSERT INTO todos (
    name,
    user_id,
    created_on,
    updated_on

)
VALUES
    (
        'sports',
        '2b30e942-4313-4b6e-88ee-ad335a13ef2a',
        current_timestamp,
        current_timestamp
    ),
    (
       'visiting bank',
        '32067211-9022-4e80-9695-87663bfef540',
        current_timestamp,
        current_timestamp
    );
    select * from users;