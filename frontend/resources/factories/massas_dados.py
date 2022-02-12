from faker import Faker
faker = Faker()

import  bcrypt


def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed
    

# Gerador de massa de dados
def users_to_insert_db():
    return [
        factory_user('user_login'),
        factory_user('be_geek'),
        factory_user('attempt_be_geek'),
        factory_user('search_alien'),
        factory_user('search_common'),
        factory_user('searcher')
    ]

def factory_user(target):
    name = faker.first_name()
    
    data = {
        "faker": {
            "name": faker.first_name(),
            "lastname": faker.last_name(),
            "email": faker.free_email(),
            "password": "Teste@1234"
        },
        "wrong_email": {
            "name": name,
            "lastname": faker.last_name(),
            "email": name.lower() + "#teste.com",
            "password": "Teste@1234"
        },
        "user_login": {
            "name": "Adriano",
            "lastname": "Almeida",
            "email": "adriano@teste.com.br",
            "password": "Teste@1234"
        },
        "be_geek": {
            "name": "Kim",
            "lastname": "Dotcom",
            "email": "kim@dot.com",
            "password": "Teste@1234",
            "geek_profile": {
                "whatsapp": "11999999999",
                "desc": "Seu computador está lento? Talvez seja um vírus, malware ou outras inconsistência no sistema, eu posso resolver, bem como consertar impressoa EPSON e HP. Também instalo, desistalo e configuro aplicativos.",
                "printer_repair": "Sim",
                "work": "Remoto",
                "cost": "100"
            }
        },
        "short_desc": {
            "geek_profile": {
                "whatsapp": "11999999999",
                "desc": "Seu computador está lento? Eu formato!",
                "printer_repair": "Sim",
                "work": "Remoto",
                "cost": "100"
            }
        },
        "long_desc": {
            "geek_profile": {
                "whatsapp": "71988888888",
                "desc": "Seu computador está lento? Talvez seja um vírus, malware ou outras inconsistência no sistema, eu posso resolver, bem como consertar impressoa EPSON e HP. Também instalo, desistalo e configuro aplicativos. Testando o máximo do campo de descrição disponível!!",
                "printer_repair": "Sim",
                "work": "Remoto",
                "cost": "250"
            }
        },
        "without_printer_repair": {
            "geek_profile": {
                "whatsapp": "11999999999",
                "desc": "Seu computador está lento? Talvez seja um vírus, malware ou outras inconsistência no sistema, eu posso resolver, bem como consertar impressoa EPSON e HP. Também instalo, desistalo e configuro aplicativos.",
                "printer_repair": "",
                "work": "Remoto",
                "cost": "100"
            }
        },
        "without_work": {
            "geek_profile": {
                "whatsapp": "11999999999",
                "desc": "Seu computador está lento? Talvez seja um vírus, malware ou outras inconsistência no sistema, eu posso resolver, bem como consertar impressoa EPSON e HP. Também instalo, desistalo e configuro aplicativos.",
                "printer_repair": "Sim",
                "work": "",
                "cost": "100"
            }
        },
        "without_whatsapp": {
            "geek_profile": {
                "whatsapp": "",
                "desc": "Seu computador está lento? Talvez seja um vírus, malware ou outras inconsistência no sistema, eu posso resolver, bem como consertar impressoa EPSON e HP. Também instalo, desistalo e configuro aplicativos.",
                "printer_repair": "Sim",
                "work": "Remoto",
                "cost": "100"
            }
        },
        "only_ddd_whatsapp": {
            "geek_profile": {
                "whatsapp": "11",
                "desc": "Seu computador está lento? Talvez seja um vírus, malware ou outras inconsistência no sistema, eu posso resolver, bem como consertar impressoa EPSON e HP. Também instalo, desistalo e configuro aplicativos.",
                "printer_repair": "Sim",
                "work": "Remoto",
                "cost": "100"
            }
        },
        "with_10_digits_whatsapp": {
            "geek_profile": {
                "whatsapp": "1198765432",
                "desc": "Seu computador está lento? Talvez seja um vírus, malware ou outras inconsistência no sistema, eu posso resolver, bem como consertar impressoa EPSON e HP. Também instalo, desistalo e configuro aplicativos.",
                "printer_repair": "Sim",
                "work": "Remoto",
                "cost": "100"
            }
        },
        "without_desc": {
            "geek_profile": {
                "whatsapp": "11987654322",
                "desc": "",
                "printer_repair": "Sim",
                "work": "Remoto",
                "cost": "150"
            }
        },
        "without_cost": {
            "geek_profile": {
                "whatsapp": "11987654322",
                "desc": "Seu computador está lento? Talvez seja um vírus, malware ou outras inconsistência no sistema, eu posso resolver, bem como consertar impressoa EPSON e HP. Também instalo, desistalo e configuro aplicativos.",
                "printer_repair": "Sim",
                "work": "Remoto",
                "cost": ""
            }
        },
        "with_number_text_cost": {
            "geek_profile": {
                "whatsapp": "11987654322",
                "desc": "Seu computador está lento? Talvez seja um vírus, malware ou outras inconsistência no sistema, eu posso resolver, bem como consertar impressoa EPSON e HP. Também instalo, desistalo e configuro aplicativos.",
                "printer_repair": "Sim",
                "work": "Remoto",
                "cost": "teste12"
            }
        },
        "with_only_text_cost": {
            "geek_profile": {
                "whatsapp": "11987654322",
                "desc": "Seu computador está lento? Talvez seja um vírus, malware ou outras inconsistência no sistema, eu posso resolver, bem como consertar impressoa EPSON e HP. Também instalo, desistalo e configuro aplicativos.",
                "printer_repair": "Sim",
                "work": "Remoto",
                "cost": "teste"
            }
        },
        "with_special_characters_cost": {
            "geek_profile": {
                "whatsapp": "11987654322",
                "desc": "Seu computador está lento? Talvez seja um vírus, malware ou outras inconsistência no sistema, eu posso resolver, bem como consertar impressoa EPSON e HP. Também instalo, desistalo e configuro aplicativos.",
                "printer_repair": "Sim",
                "work": "Remoto",
                "cost": "12#$%&!"
            }
        },
         "attempt_be_geek": {
            "name": "Dio",
            "lastname": "Netcom",
            "email": "dio@net.com",
            "password": "Teste@1234",
            "geek_profile": {
                "whatsapp": "11999999999",
                "desc": "Seu computador está lento? Talvez seja um vírus, malware ou outras inconsistência no sistema, eu posso resolver, bem como consertar impressoa EPSON e HP. Também instalo, desistalo e configuro aplicativos.",
                "printer_repair": "Sim",
                "work": "Remoto",
                "cost": "100"
            }
        },
        "searcher": {
            "name": "Johnny",
            "lastname": "Lawrence",
            "email": "johnny@cobrakai.com",
            "password": "Teste@1234"
        },
        "search_alien": {
            "name": "Dok",
            "lastname": "Ock",
            "email": "dok@oscorp.com",
            "password": "Teste@1234",
            "geek_profile": {
                "whatsapp": "11999999999",
                "desc": "Faço conserto de qualquer impressora. Matricial a fita, Matricial a fita colorida, a laser, a jato de tinta e também impressora 3D.",
                "printer_repair": "Sim",
                "work": "Presencial".lower(),
                "cost": "250"
            }
        },
        "search_common": {
            "name": "Peter",
            "lastname": "Parker",
            "email": "peter@parker.com",
            "password": "Teste@1234",
            "geek_profile": {
                "whatsapp": "11999999999",
                "desc": "Seu computador está lento? Talvez seja um vírus, malware ou outras inconsistência no sistema win 95 ou 97, eu posso resolver. Também instalo, desistalo e configuro aplicativos.",
                "printer_repair": "Não",
                "work": "Remoto".lower(),
                "cost": "100"
            }
        }
    }
    return data[target]
