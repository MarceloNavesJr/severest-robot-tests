*** Settings ***
Documentation    Esse teste verifica o site da Severest

Resource    ../testes.cases/severest_resouce.robot
Resource    ../Resource.robot/login.robot

Suite Setup       Abrir Navegador
Test Setup        Fazer login ou cadastrar
Suite Teardown    Fechar Navegador

*** Test Cases ***

Caso de teste 01 - Adicionando produto ao carrinho
     Dado que eu esteja na pagina inicial
     E pesquisar pelo produto Logitech MX Vertical
     E clicar em adicionar ao carrinho o produto
     Quando clicar em adicionar no carrinho
     Então deve acessar a pagina Em construção aguarde

 Caso de teste 02 - add e esvaziando carrinho
     Dado que eu esteja na pagina inicial
     E pesquisar pelo produto Persevering bottomline protocol
     E clicar em adicionar ao carrinho o produto 
     Quando clicar em limpar lista
     Então deve acessar a pagina onde consta Seu carrinho está vazio  
     




