# Gestão de Leads — DV Beauty

Sistema de prospecção da recepção da DV Beauty: cadastro de leads, follow-ups, observações, alertas, importação e exportação de planilha.

## Arquivos
- `index.html` — o sistema inteiro (página única).
- `supabase.sql` — cria a tabela de leads no Supabase. Rodar uma vez no SQL Editor.

## Configuração
1. No Supabase, rode `supabase.sql` no SQL Editor.
2. Crie os usuários em Authentication → Users e desligue o cadastro público.
3. No começo do `<script>` do `index.html`, preencha `SUPABASE_URL` e `SUPABASE_ANON_KEY` (Project Settings → API).
4. Publique na Vercel (importar este repositório, sem configuração extra) ou envie o `index.html` para a Hostinger.
