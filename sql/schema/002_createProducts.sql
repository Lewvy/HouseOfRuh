-- +goose Up
create extension if not exists "citext";

CREATE TABLE products (
    id serial PRIMARY KEY,
	name text not null,
	description text not null,
	price int,
	created_at timestamp default now(),
	updated_at timestamp default now(),
	version int not null default 1
);

-- +goose Down
DROP TABLE if exists products;
