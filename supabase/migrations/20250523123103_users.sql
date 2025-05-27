CREATE TABLE public.users (
  id uuid PRIMARY KEY,
  firtName text NOT null,
  lastName text NOT null,
  birthdate date NOT null,
  created_at timestamp with time zone default now()
);

alter table public.users disable row level security;
