*** Settings ***
Documentation           Database Helpers


Library         DatabaseLibrary
Library         factories/massas_dados.py


*** Keywords ***
Connect To Postgres

    Connect To Database         psycopg2
    ...                         uehdgyzm
    ...                         uehdgyzm
    ...                         ajUrFwIJ9Zrec054F2mH5XQGlEg4_-rH
    ...                         fanny.db.elephantsql.com
    ...                         5432


Reset Env

    Execute SQL String          DELETE from public.geeks;
    Execute SQL String          DELETE from public.users;


Insert User
    [Arguments]         ${user}

    ${password}         Get Hashed Pass     ${user}[password]

    ${query}            Set Variable        INSERT INTO public.users (name, email, password_hash, is_geek) VALUES ('${user}[name] ${user}[lastname]', '${user}[email]', '${password}', false);

    Execute SQL String          ${query}


Users Seed

    ${user_login}       Factory User        user_login

    Insert User         ${user_login}

    ${user_geek}        Factory User        be_geek

    Insert User         ${user_geek}

    ${user_short_desc}        Factory User        short_desc

    Insert User         ${user_short_desc}

    ${user_long_desc}        Factory User        long_desc

    Insert User         ${user_long_desc}