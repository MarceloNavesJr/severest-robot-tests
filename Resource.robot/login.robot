*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://front.serverest.dev/login
${EMAIL}        testando02@teste.com
${SENHA}        215487
${NOME}         Teste


*** Keywords ***
Abrir navegador
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Fazer login ou cadastrar
    Input Text    id=email       ${EMAIL}
    Input Text    id=password    ${SENHA}
    Click Element    xpath=//button[@data-testid='entrar']
    ${login_falhou}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//div[@role='alert']    timeout=3
    IF    ${login_falhou}
        Realizar cadastro
    ELSE
        Wait Until Element Is Visible    xpath=//a[@data-testid='shopping-cart-button']
    END

Realizar cadastro
    Click Element    xpath=//a[@data-testid='cadastrar']
    Input Text    id=nome        ${NOME}
    Input Text    id=email       ${EMAIL}
    Input Text    id=password    ${SENHA}
    Click Button    xpath=//button[@data-testid='cadastrar']
    Wait Until Element Is Visible    xpath=//a[@data-testid='shopping-cart-button']

Fechar navegador
    Close Browser

    