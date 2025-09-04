-- name: ListUsers :many
SELECT * from users;

-- name: InsertUser :one
insert into users (id, email, name)
	values ($1, $2, $3)
	returning email, name, created_at, version;

