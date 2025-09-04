-- +goose Up
create extension if not exists "uuid-ossp";
create extension if not exists "citext";


CREATE TABLE products (
    id uuid PRIMARY KEY,
	name text not null,
	description text not null,
	created_at timestamp default now(),
	updated_at timestamp default now(),
	version int not null default 1
);

-- +goose Down
DROP TABLE products;
