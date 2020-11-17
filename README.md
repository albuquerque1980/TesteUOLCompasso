# TesteUOLCompasso
Feature: Automatizar o fluxo de compras 

    Background: Usuário com login valido no site de compras
      Given que usuário abriu o navegador
	    And efetuou login corretamente
	    And retornou a página home
	    And clico no campo de busca
      
    Scenario Outline: Pesquisar um produto NÃO existente
      Given que insiro o nome do produto <PRODUTO>
      When clico no botão pesquisar  
      Then a página deve exibir a mensagem <MSG>

      Examples:
        | PRODUTO       | MSG													| 
        | NÃO EXISTENTE | No results were found for your search "NÃO EXISTENTE" |

    Scenario Outline: Pesquisar por produto existente
      Given que insiro o nome do produto <PRODUTO>
	    When clico no botão pesquisar 
      Then confirmo que o produto foi apresentado no resultado da busca

      Examples:
        | PRODUTO            		  |
        | Faded Short Sleeve T-shirts |

    Scenario Outline: Inserir produtos no carrinho e finalizar compra
      Given que insiro o nome do produto <PRODUTOUM>
	    And clico no botão pesquisar
	    And insiro o produto no carrinho
	    And insiro o nome do produto <PRODUTODOIS>
	    And clico no botão pesquisar
	    And insiro o produto no carrinho
      When finalizo a compra dos produtos
      Then confirmo que a compra foi finalizada <MSG>

      Examples:
        | PRODUTOUM      			  | PRODUTODOIS | MSG				 |
        | Faded Short Sleeve T-shirts | Blouse		| ORDER CONFIRMATION |
