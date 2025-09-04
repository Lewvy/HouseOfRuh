-- +goose Up
create extension if not exists "uuid-ossp";
create extension if not exists "citext";


CREATE TABLE users (
    id uuid PRIMARY KEY,
	email citext unique not null,
	name text not null,
	phone_number text unique,
	address text,
	password_hash bytea not null,
	created_at timestamp default now(),
	updated_at timestamp default now(),
	version int not null default 1
);

-- +goose Down
DROP TABLE users;
