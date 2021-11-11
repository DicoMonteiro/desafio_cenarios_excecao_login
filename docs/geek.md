### User Story - Geek

> Sendo um visitante que deseja disponibilizar meus serviços de TI
> Posso realizar meu login
> Para que eu possa configurar meu perfil de prestadores de serviços (Geeks)

##### Cenário: Ser um Geek

Dado que estou na área logada
E acesso o formulario de Geek
Quando preencho as informações
E confirmo o desejo de ser Geek
Então vejo a mensagem de sucesso:
    "Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp."

##### Cenário: Campo Descrição Curta

Dado que estou na área logada
E acesso o formulario de Geek
Quando preencho as informações
Mas com a descrição curta
E confirmo o desejo de ser Geek
Então vejo a mensagem de alerta:
    "A descrição deve ter no minimo 80 caracteres"

##### Cenário: Campo Descrição Longo

Dado que estou na área logada
E acesso o formulario de Geek
Quando preencho as informações
Mas com a descrição longa
E confirmo o desejo de ser Geek
Então vejo a mensagem de alerta:
    "A descrição deve ter no máximo 255 caracteres"

##### Cenário: WhatsApp em branco

Dado que estou na área logada
E acesso o formulario de Geek
Quando preencho as informações
Mas com o whatsapp em branco
E confirmo o desejo de ser Geek
Então vejo a mensagem de alerta:
    "O Whatsapp deve ter 11 digitos contando com o DDD"

##### Cenário: Whatsapp somente com DDD

Dado que estou na área logada
E acesso o formulario de Geek
Quando preencho as informações
Mas com o whatsapp somente com DDD
E confirmo o desejo de ser Geek
Então vejo a mensagem de alerta:
    "O Whatsapp deve ter 11 digitos contando com o DDD"

##### Cenário: Whatsapp somente com 10 dígitos

Dado que estou na área logada
E acesso o formulario de Geek
Quando preencho as informações
Mas com o whatsapp somente com 10 dígitos
E confirmo o desejo de ser Geek
Então vejo a mensagem de alerta:
    "O Whatsapp deve ter 11 digitos contando com o DDD"

##### Cenário: Descrição em branco

Dado que estou na área logada
E acesso o formulario de Geek
Quando preencho as informações
Mas com a descrição em branco
E confirmo o desejo de ser Geek
Então vejo a mensagem de alerta:
    "Informe a descrição do seu trabalho"

##### Cenário: Valor em branco

Dado que estou na área logada
E acesso o formulario de Geek
Quando preencho as informações
Mas com o valor em branco
E confirmo o desejo de ser Geek
Então vejo a mensagem de alerta:
    "Valor hora deve ser numérico"

##### Cenário: Valor contendo alfanumerico

Dado que estou na área logada
E acesso o formulario de Geek
Quando preencho as informações
Mas com o valor contendo alfanumerico
E confirmo o desejo de ser Geek
Então vejo a mensagem de alerta:
    "Valor hora deve ser numérico"

##### Cenário: Valor contendo letras

Dado que estou na área logada
E acesso o formulario de Geek
Quando preencho as informações
Mas com o valor contendo letras
E confirmo o desejo de ser Geek
Então vejo a mensagem de alerta:
    "Valor hora deve ser numérico"

##### Cenário: Valor contendo caracteres especiais

Dado que estou na área logada
E acesso o formulario de Geek
Quando preencho as informações
Mas com o valor contendo caracteres especiais
E confirmo o desejo de ser Geek
Então vejo a mensagem de alerta:
    "Valor hora deve ser numérico"

##### Cenário: Conserta impressora em branco

Dado que estou na área logada
E acesso o formulario de Geek
Quando preencho as informações
Mas com o conserta impressora em branco
E confirmo o desejo de ser Geek
Então vejo a mensagem de alerta:
    "Por favor, informe se você é um Geek Supremo"

##### Cenário: Modelo de trabalho em branco

Dado que estou na área logada
E acesso o formulario de Geek
Quando preencho as informações
Mas com o modelo de trabalho em branco
E confirmo o desejo de ser Geek
Então vejo a mensagem de alerta:
    "Por favor, selecione o modelo de trabalho"


### Resumo do Desafio Final Módulo PRO###

1 - whatsapp em branco; - OK <br>
2 - whatsapp somente DDD; - OK <br>
3 - whatsapp com 10 dígitos; - OK <br>
4 - descricao em branco; - OK <br>
5 - valor hora em branco; - OK <br>
6 - valor hora com alfanumerico; - OK <br>
7 - valor hora com letras; - OK <br>
8 - valor hora com caracteres especiais; - OK <br>
EXTRAS:
9 - conserta impressora em branco; - OK <br>
10 - modelo de trabalho em branco; - OK <br>

Dica 1: Usa o modelo de template de teste
Dica 2: O login ficará melhor se for executado uma única vez para todos os comportamentos.