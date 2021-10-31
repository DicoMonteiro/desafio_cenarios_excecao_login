from faker import Faker
faker = Faker()

import  bcrypt


def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed
    

# Gerador de massa de dados

def factory_new_user():
    
    return {
        "name": faker.first_name(),
        "lastname": faker.last_name(),
        "email": faker.free_email(),
	    "password": "Teste@1234"
    }

def factory_email_invalid():
    name = faker.last_name()
    
    return {
        "name": name,
        "lastname": faker.last_name(),
        "email": name.lower() + "#teste.com",
	    "password": "Teste@1234"
    }

def factory_user_login():

    return {
        "name": "Adriano",
        "lastname": "Almeida",
        "email": "adriano@teste.com.br",
	    "password": "Teste@1234"
    }

# def factory_login_user_invalid():
    
#     return {
#         "email": "teste001@teste001.com.br",
# 	    "password": "123456"
#     }


# def factory_login_password_invalid():
    
#     return {
#         "email": "adriano@teste.com.br",
# 	    "password": "Teste"
#     }

# def factory_without_name():
    
#     return {
#         "name": "",
#         "lastname": "Almeida",
#         "email": "adriano@teste.com",
# 	    "password": "Teste@1234"
#     }


# def factory_without_lastname():
    
#     return {
#         "name": "Adriano",
#         "lastname": "",
#         "email": "adriano@teste.com",
# 	    "password": "Teste@1234"
#     }

# def factory_without_email():
    
#     return {
#         "name": "Adriano",
#         "lastname": "Almeida",
#         "email": "",
# 	    "password": "Teste@1234"
#     }

# def factory_without_password():
    
#     return {
#         "name": "Adriano",
#         "lastname": "Almeida",
#         "email": "adriano@teste.com",
# 	    "password": ""
#     }