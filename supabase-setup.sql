-- À coller dans Supabase > SQL Editor > New query > Run

create table if not exists categories (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  emoji text default '',
  position int default 0,
  created_at timestamptz default now()
);

create table if not exists products (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  description text default '',
  price integer not null,
  category_id uuid references categories(id) on delete set null,
  sizes text[] default '{}',
  images text[] default '{}',
  active boolean default true,
  created_at timestamptz default now()
);

alter table categories enable row level security;
alter table products enable row level security;

-- Les visiteurs peuvent seulement LIRE
create policy "visiteurs lisent categories" on categories for select using (true);
create policy "visiteurs lisent produits actifs" on products for select using (active = true);

-- L'admin connecté peut tout faire
create policy "admin categories" on categories for all to authenticated using (true) with check (true);
create policy "admin produits" on products for all to authenticated using (true) with check (true);

-- Espace de stockage des photos
insert into storage.buckets (id, name, public) values ('products', 'products', true)
on conflict (id) do nothing;

create policy "admin upload photos" on storage.objects for insert to authenticated with check (bucket_id = 'products');
create policy "admin modifie photos" on storage.objects for update to authenticated using (bucket_id = 'products');
create policy "admin supprime photos" on storage.objects for delete to authenticated using (bucket_id = 'products');
