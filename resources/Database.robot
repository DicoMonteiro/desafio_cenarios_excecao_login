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

    ${user_login}       Factory User Login

    Insert User         ${user_login}