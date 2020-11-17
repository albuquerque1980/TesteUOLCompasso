*** Settings ***
Library          SeleniumLibrary

*** Variables ***
${BROWSER}      firefox
${URL}          http://automationpractice.com/index.php
${EMAIL}        jl_albuquerque@live.com
${SENHA}        parabens1

*** Keywords ***

### Setup e TearDown
Abrir navegador
    Open Browser       ${URL}             ${BROWSER}
    Click Element      css=.login
    Input Text         id=email           ${EMAIL}
    Input Text         id=passwd          ${SENHA}
    Click Element      id=SubmitLogin
    Click Element      class=icon-home

Fechar navegador
    Close Browser

### Passo a Passo
Acessar a página home do site
    Title Should Be    My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisar
    Input Text    name=search_query    ${PRODUTO}

Clicar no botão Pesquisar
    Click Element    name=submit_search

Conferir se o produto foi listado no resultado da busca
    Wait Until Element Is Visible    css=.page-heading
    Title Should Be                  Search - My Store
    Page Should Contain Image        XPath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/1/1-home_default.jpg']

Adcionar o primeiro produto no carrinho
    Click Element                    XPath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/1/1-home_default.jpg']
    Click Element                    css=button.exclusive

Adcionar o segundo produto no carrinho
    Click Element                    XPath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
    Click Element                    css=button.exclusive

Finalizar compra dos produtos
    Click Element                    css=.shopping_cart > a:nth-child(1)
    Page Should Contain Image        XPath=//*[@alt='Faded Short Sleeve T-shirts']
    Click Element                    css=.standard-checkout > span:nth-child(1)
    Click Element                    css=button.button:nth-child(4) > span:nth-child(1)
    Click Element                    id=cgv
    Click Element                    css=button.button:nth-child(4) > span:nth-child(1)
    Click Element                    css=.bankwire
    Click Element                    css=button.button-medium > span:nth-child(1)

Confirma compra "${CONFIRMACAO}"
    Element Text Should Be           XPath=/html/body/div/div[2]/div/div[3]/div/h1    ${CONFIRMACAO}

Conferir se a "${MENSAGEM}" é apresentada
    Wait Until Element Is Visible    //*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be           //*[@id="center_column"]/p[@class='alert alert-warning']     ${MENSAGEM}
