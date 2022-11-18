CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int8,
  "role_id" int
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" varchar,
  "level_id" int,
  "teacher" varchar
);

CREATE TABLE "levels" (
  "id" serial PRIMARY KEY,
  "level" varchar
);

CREATE TABLE "course_Videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "url" varchar,
  "course_id" uuid
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar,
  "course_id" uuid
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "categories" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");

ALTER TABLE "course_Videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");


/* C-R-U-D */

INSERT INTO users
(id, "name", email, "password", age, role_id)
VALUES('f75c4944-7b43-49db-996c-8efa22848dd1'::uuid, 'luis', 'luis@gmail.com', 'secreto123', 18, 1);

INSERT INTO roles
(id, "name")
VALUES(1, 'student');

INSERT INTO roles
("name")
VALUES(1, 'teacher');

insert into users (id,name,email,password,age,role_id) 
values (
'025c7519-6dd8-4971-b37d-9d1d0512bd17',
'fernando',
'fernando@gmail.com',
'root',
25,
2
)

insert into courses (
id,
title,
description,
level_id,
teacher
) values (
'f5b8aa31-c733-40bc-816b-2396924328b3',
'Curso de caricatura',
'en este curso aprenderas a hacer caricaturas divertidas',
2,
'fernando'
), ('6b1d1894-ddab-4fe0-b4a5-bed0f9c80cb3',
'Curso de tamboras',
'en este curso aprenderas sobre percusion y tamboras',
1,
'fernando'
);

insert into levels (
level
) values (
'principiante'), 
('medio'),
('avanzado');

insert into "course_Videos" (
id,
title,
url,
course_id
) values (
'bd3f8fb7-8017-4f33-96d7-1970c00c9266',
'creando nuestro primer boceto',
'http:primerboceto.com',
'f5b8aa31-c733-40bc-816b-2396924328b3'
),(
'b5016b56-e1f2-4254-b371-7810d1f543d0',
'la historia de la percusion',
'http:lahistoria.com',
'6b1d1894-ddab-4fe0-b4a5-bed0f9c80cb3'
);

insert into categories (
name,
course_id
) values (
'artes',
'f5b8aa31-c733-40bc-816b-2396924328b3'
), (
'musica',
'6b1d1894-ddab-4fe0-b4a5-bed0f9c80cb3'
)

select name from users;

update users 
set "email" = 'fernando@hotmail.com' 
where name  = 'fernando'


