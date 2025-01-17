-- Script para criar roles e conceder privilégios
-- Nomeie este arquivo para garantir que seja o primeiro a ser executado, por exemplo, "00-initial-setup.sql"

DO $$
BEGIN
    -- Cria o role 'anon' se ele não existir
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'anon') THEN
        CREATE ROLE anon NOLOGIN NOINHERIT;
    END IF;
    
    -- Cria o role 'authenticated' se ele não existir
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'authenticated') THEN
        CREATE ROLE authenticated NOLOGIN NOINHERIT;
    END IF;

    -- Cria o role 'service_role' se ele não existir
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'service_role') THEN
        CREATE ROLE service_role NOLOGIN NOINHERIT BYPASSRLS;
    END IF;
END
$$;

-- Concede privilégios básicos para os roles
GRANT USAGE ON SCHEMA public TO anon, authenticated, service_role;

-- Altera os privilégios padrões para novas tabelas, funções e sequências
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO anon, authenticated, service_role;

-- Cria o schema '_supavisor' se ele ainda não existir
CREATE SCHEMA IF NOT EXISTS _supavisor;
