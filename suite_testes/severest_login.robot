*** Settings ***

Resource    ../testes.cases/severest_resouce.robot
Resource    ../resource.robot/login.robot

Test Setup       Abrir navegador
Test Teardown    Fechar Navegador


*** Test Cases ***

Caso de teste 01 - Ralizar Login com usuario valido
    Dado que eu esteja na homepage do severest 
    E incruir testando02@teste.com e 215487
    Quando clicar em entrar
    Então deve acessar a pagina inicial
    
Caso de teste 02 - Realizar Login com email invalido 
    Dado que eu esteja na homepage do severest 
    E incruir teste_erro@teste.com e 215487
    Quando clicar em entrar
    Então deve aparecer mensagem que email e/ou senha invalidos

Caso de teste 02 - Realizar Login com senha invalida
    Dado que eu esteja na homepage do severest 
    E incruir testando02@teste.com e 1235
    Quando clicar em entrar
    Então deve aparecer mensagem que email e/ou senha invalidos   







