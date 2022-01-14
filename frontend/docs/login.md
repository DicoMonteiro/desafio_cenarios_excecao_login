### User Story - Login Cliente

> Sendo um visitante que deseja contratar serviços de TI
> Posso realizar meu login
> Para que eu possa procurar por prestadores de serviços (Geeks)

##### Cenário: Login com sucesso

Dado que acesso a página de login
Quando realizo o login com meu e-mail e senha
Então vejo meu nome na área logada

##### Cenário: Usuário não encontrado

Dado que acesso a página de login
Quando realizo o login com meu e-mail e senha
Mas com o e-mail inexistente
Então vejo a mensagem de alerta:
    "Usuário e/ou senha inválidos."

##### Cenário: Senha inválida

Dado que acesso a página de login
Quando realizo o login com meu e-mail e senha
Mas com a senha inválida
Então vejo a mensagem de alerta:
    "Usuário e/ou senha inválidos."

##### Cenário: E-mail incorreto

Dado que acesso a página de login
Quando realizo o login com meu e-mail e senha
Mas com a e-mail incorreto
Então deve exibir uma mensagem de alerta do e-mail inválido

##### Cenário: E-mail incompleto

Dado que acesso a página de login
Quando realizo o login com meu e-mail e senha
Mas informar o e-mail incompleto
Então vejo a mensagem de alerta:
    "email must be a valid email"

##### Cenário: E-mail em branco

Dado que acesso a página de login
Quando realizo o login com meu e-mail e senha
Mas sem informar o e-mail
Então vejo a mensagem de alerta:
    "E-mail obrigatório"

##### Cenário: Senha em branco

Dado que acesso a página de login
Quando realizo o login com meu e-mail e senha
Mas sem informar a senha
Então vejo a mensagem de alerta:
    "Senha obrigatória"

##### Cenário: Campos obrigatórios

Dado que acesso a página de login
Quando realizo o login sem o e-mail e senha
Então devo ver uma mensagem informando que todos os campos são obrigatórios
