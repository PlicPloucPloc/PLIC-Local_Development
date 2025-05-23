create table public.users (
  id uuid primary key default,
  firtName text not null,
  lastName text not null,
  birthdate date not null
  created_at timestamp with time zone default now()
);

alter table public.users disable row level security;
