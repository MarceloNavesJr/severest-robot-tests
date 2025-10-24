*** Settings ***

Library    SeleniumLibrary

*** Variables ***
${pesquisa}           //input[@data-testid='pesquisar']
${bt_add_lista}       xpath=//button[contains(@data-testid, 'adicionarNaLista')]
${bt_add_carrinho}    xpath=//button[@data-testid='adicionar carrinho']
${bt_entrar}          xpath=//button[@data-testid='entrar']
${pag_inc}            //a[@data-testid='shopping-cart-button']
${bt_LimparLista}     //button[@type='button' and @data-testid='limparLista' and text()='Limpar Lista']

*** Keywords ***


 Dado que eu esteja na homepage do severest 
     Go To    https://front.serverest.dev/login

E incruir ${Email} e ${senha}
    Input Text    xpath=//input[@id='email']       ${Email}  
    Input Text    xpath=//input[@id='password']    ${senha}    
Quando clicar em entrar
    Click Element    ${bt_entrar}

Então deve acessar a pagina inicial
    Execute JavaScript    document.querySelector("[data-testid='entrar']").click()
    Wait Until Element Is Visible    ${pag_inc}

    
Então deve aparecer mensagem que email e/ou senha invalidos
    Wait Until Element Is Visible    xpath=//div[@role='alert']          

Dado que eu esteja na pagina inicial
    Wait Until Element Is Visible    ${pag_inc}

E pesquisar pelo produto ${Produto}
    Input Text    ${pesquisa}    ${Produto}

E clicar em adicionar ao carrinho o produto 
    Wait Until Element Is Visible    ${bt_add_lista}
    Click Button    ${bt_add_lista}
    
    
Quando clicar em adicionar no carrinho
    Click Button                     ${bt_add_carrinho}
Então deve acessar a pagina Em construção aguarde
    Page Should Contain    Em construção aguarde

Quando clicar em limpar lista
    Click Button    ${bt_LimparLista}
    
Então deve acessar a pagina onde consta Seu carrinho está vazio 
    Page Should Contain    Seu carrinho está vazio