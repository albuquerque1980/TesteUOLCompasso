*** Settings ***
Resource         ../resource/Resource.robot
Test Setup       Abrir navegador
Test Teardown    Fechar navegador

*** Test Case ***

Cenário 01: Pesquisar um produto NÃO existente
    Dado que estou na página home do site
    Quando pesquisar pelo produto "NÃO EXISTENTE"
    Então a página deve exibir a mensagem "No results were found for your search "NÃO EXISTENTE""

Cenário 02: Pesquisar por produto existente
    Dado que estou na página home do site
    Quando pesquisar pelo produto "Faded Short Sleeve T-shirts"
    Então o produto deve ser apresentado no resultado da busca

Cernário 03: Inserir produtos no carrinho e finalizar compra
    Dado que estou na página home do site
    Quando pesquisar pelos produtos "Faded Short Sleeve T-shirts", "Blouse" e adiciona no carrinho
    Então finaliza a compra e confirmar mensagem "ORDER CONFIRMATION"

*** Keywords ***

Dado que estou na página home do site
    Acessar a página home do site

Quando pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisar
    Clicar no botão Pesquisar

Então o produto deve ser apresentado no resultado da busca
    Conferir se o produto foi listado no resultado da busca

Então a página deve exibir a mensagem "${MENSAGEM}"
    Conferir se a "${MENSAGEM}" é apresentada

Quando pesquisar pelos produtos "${PRODUTO}", "${PRODUTODOIS}" e adiciona no carrinho
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisar
    Clicar no botão Pesquisar
    Adcionar o primeiro produto no carrinho
    Digitar o nome do produto "${PRODUTODOIS}" no campo de pesquisar
    Clicar no botão Pesquisar
    Adcionar o segundo produto no carrinho

Então finaliza a compra e confirmar mensagem "${CONFIRMACAO}"
    Finalizar compra dos produtos
    Confirma compra "${CONFIRMACAO}"
