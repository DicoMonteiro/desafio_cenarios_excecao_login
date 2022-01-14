
def factory_new_user():
    
    return {
        'name': 'Clint Barton',
        'email': 'barton@shield.com',
        'password': 'Teste@1234'
    }
    
def factory_get_user():
    
    return {
        'name': 'Gwen Stacy',
        'email': 'stacy@hotmail.com',
        'password': 'Teste@1234'
    }
    
def factory_remove_user():
    
    return {
        'name': 'Thaddeus Ross',
        'email': 'ross@gmail.com',
        'password': 'Teste@1234'
    }

def factory_update_user():
    
    email = 'almeida.adriano@gmail.com'
    
    data = {
        'before': {
            'name': 'Almeida Adriano',
            'email': email,
            'password': 'Teste@1234'
        },
        'after': {
            'name': 'Adriano Almeida',
            'email': email,
            'whatsapp': '71999999912',
            'avatar': 'https://avatars.githubusercontent.com/u/22827479'
        }
    }
    
    return data

def factory_user_geek():
    
    name = 'Adriano Almeida'
    email = 'adriano.almeida@io.com'
    password = 'Teste@1234'
    
    data = {
        'signup': {
            'name': name,
            'email': email,
            'password': password
        },
        'login': {
            'email': email,
            'password': password
        },
        'geek': {
            'whatsapp': '11999999999',
            'desc': 'Seu computador está lento? Talvez seja um vírus, malware ou outras inconsistência no sistema, eu posso resolver, bem como consertar impressoa EPSON e HP. Também instalo, desistalo e configuro aplicativos.',
            'printer_repair': 'Sim',
            'work': 'Ambos',
            'cost': '150'
        }
    }
    
    return data

def factory_get_geek():
    
    name = 'Adriano Monteiro'
    email = 'adriano.monteiro@io.com'
    password = 'Teste@1234'
    
    data = {
        'signup': {
            'name': name,
            'email': email,
            'password': password
        },
        'login': {
            'email': email,
            'password': password
        },
        'geek': {
            'whatsapp': '11888888888',
            'desc': 'Seu computador está lento? Talvez seja um vírus, malware ou outras inconsistência no sistema, eu posso resolver, bem como consertar impressoa EPSON e HP. Também instalo, desistalo e configuro aplicativos.',
            'printer_repair': 'Não',
            'work': 'Remote',
            'cost': '120.00'
        }
    }
    
    return data

def factory_user_session(target):
    
    name = 'Adriano Almeida'
    email = 'adriano.almeida@teste.com'
    password = 'Teste@1234'
    
    data = {
        'signup': {
            'name': name,
            'email': email,
            'password': password
        },
        'login': {
            'email': email,
            'password': password
        }
    }
    
    return data[target]


def factory_search_for_geeks():
    
    return {
        'user': {
            'name': 'Peter Quill',
            'email': 'quill@marvel.com',
            'password': 'pwd123'
        },
        'geeks': [
            {
                'name': 'Riri Willians',
                'email': 'riri@marvel.com',
                'password': 'pwd123',
                'geek_profile': {
                    'whatsapp': '11999999999',
                    'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
                    'printer_repair': 'Não',
                    'work': 'Presencial',
                    'cost': '100'
                }
            },
            {
                'name': 'Arnim Zola',
                'email': 'zola@hidra.com',
                'password': 'pwd123',
                'geek_profile': {
                    'whatsapp': '21999999999',
                    'desc': 'Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unit',
                    'printer_repair': 'Não',
                    'work': 'Ambos',
                    'cost': '110'
                }
            },
            {
                'name': 'Reed Richards',
                'email': 'reed@fantastic4.com',
                'password': 'pwd123',
                'geek_profile': {
                    'whatsapp': '31999999999',
                    'desc': 'Instalado e faço manutenção em qualquer tipo de impressora, matricial padrão, matricial fiscal, a jato, a cera, a laser e até 3D. Também faço remold de fitas coloridas para Epson LX300. ',
                    'printer_repair': 'Sim',
                    'work': 'Remoto',
                    'cost': '120'
                }
            }
        ]
    }