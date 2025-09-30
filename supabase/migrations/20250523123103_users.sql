CREATE TABLE public.users (
  id uuid PRIMARY KEY,
  firstName text NOT null,
  lastName text NOT null,
  birthdate date NOT null,
  isColloc boolean default false,
  created_at timestamp with time zone default now()
);

alter table public.users disable row level security;
