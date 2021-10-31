### Sobre o projeto ###

Este projeto foi desenvolvido no curso da QANinja, Gravidade Zero, automação de testes usando o Robot Framework.

### Pré-condições ###

[x] - Instalar o Python 3.7 ou acima;
[x] - Instalar o Node.js 14.15 ou acima;
[x] - Instalar o Git;
[x] - Clonar este projeto:
    [x] - git clone ${URL}
[x] - Executar o comando:
    [x] - pip install -r requirements.txt

### Execução para limpar a base de dado ###

    robot -l NONE -o NONE -r NONE tasks/Delorean.robot

### Transformando um arquivo sh executável ###

    chmod +x run.sh
    chmod +x run.bat

### Execução dos testes ###

[x] - Sem tags

    robot -d ./logs tests/

[x] - Com tags

    robot -d ./logs -i <nome_tag> tests/

### Execução de limpar e executar os testes ###

    ./run.sh

### Arquivos run.sh e run.bat ###

    [x] - o .sh é para executar no linux ou mac;
    [x] - o .bat é para executar no windows;