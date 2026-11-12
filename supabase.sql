-- Gestão de Leads DV Beauty — cole tudo no Supabase > SQL Editor e clique em Run

create table if not exists public.leads (
  id               uuid primary key default gen_random_uuid(),
  nome             text not null,
  contato          text default '',
  instagram        text default '',
  origem           text default '',
  servico          text default '',
  etapa            text default 'novo',
  responsavel      text default '',
  primeiro_contato date,
  ultimo_retorno   date,
  proximo_followup date,
  notas            jsonb default '[]'::jsonb,
  criado_em        timestamptz default now(),
  atualizado_em    timestamptz default now(),
  atualizado_por   text default ''
);

-- Segurança: só quem fez login (as contas que você criar) lê e edita
alter table public.leads enable row level security;

drop policy if exists "equipe le" on public.leads;
drop policy if exists "equipe cria" on public.leads;
drop policy if exists "equipe edita" on public.leads;
drop policy if exists "equipe exclui" on public.leads;

create policy "equipe le"     on public.leads for select to authenticated using (true);
create policy "equipe cria"   on public.leads for insert to authenticated with check (true);
create policy "equipe edita"  on public.leads for update to authenticated using (true) with check (true);
create policy "equipe exclui" on public.leads for delete to authenticated using (true);

-- Atualização ao vivo entre as telas
alter publication supabase_realtime add table public.leads;
