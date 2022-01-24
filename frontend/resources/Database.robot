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

    # ${user_login}       Factory User        user_login

    Execute SQL String          DELETE from public.geeks;
    Execute SQL String          DELETE from public.users;
    # Execute SQL String          DELETE from public.users where email = '${user_login}[email]';


Insert User
    [Arguments]         ${user}

    ${password}         Get Hashed Pass     ${user}[password]

    ${query}            Set Variable        INSERT INTO public.users (name, email, password_hash, is_geek) VALUES ('${user}[name] ${user}[lastname]', '${user}[email]', '${password}', false);

    Execute SQL String          ${query}


Users Seed

    # ${user_login}       Factory User        user_login

    # Insert User         ${user_login}

    # ${user_geek}        Factory User        be_geek

    # Insert User         ${user_geek}

    # ${user_attempt_be_geek}        Factory User        attempt_be_geek

    # Insert User         ${user_attempt_be_geek}

    ${users}            Users To Insert Db

    FOR  ${user}    IN      @{users}
        Insert User         ${user}
    END