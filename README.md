# Vitta_QA_Regina_Soares
## Case 001 - Como a "pessoa física" gostaria de realizar o cadastro na loja
### Casos

__Contexto:__ 
<br>Dado eu estar na página de cadastro de pessoa física


- __Cenário 01: Verificar layout da página__
<br>__Então__ eu verifico se a página está com layout padrão, utilizando as cores preto e amarelo e com asterisco vermelho nos campos obrigatórios

- __Cenário 02: Fazer cadastro com sucesso, aceitando oferta__ (@cadastro_oferta)
<br>__Quando__ eu preencho todos os campos obrigatórios corretamente
<br>__E__ marco para receber emails de ofertas
<br>__Então__ eu verifico se foi feito o cadastro

- __Cenário 03: Fazer cadastro com sucesso, sem aceitar oferta__ (@cadastro_s_oferta)
<br>__Quando__ eu preencho todos os campos obrigatórios corretamente
<br>__E__ finalizo o cadastro sem marcar a opção de receber emails de ofertas
<br>__Então__ eu verifico se foi feito o cadastro

- __Cenário 04: Fazer cadastro sem preencher algum campo obrigatório__ (@erro_s_campo)
<br>__Quando__ eu preencho todos os campos obrigatórios corretamente
<br>__E__ excluo um campo obrigatório
<br>__Então__ eu verifico se o cadastro foi impedido

- __Cenário 05: Fazer cadastro com um cpf já cadastrado__
<br>__Quando__ eu preencho todos os campos obrigatórios corretamente
<br>__E__ altero um cpf para um valor já cadastrado
<br>__Então__ eu verifico se o cadastro foi impedido

- __Cenário 06: Fazer cadastro preenchendo o campo incorretamente__
<br>__Quando__ eu preencho todos os campos obrigatórios corretamente
<br>__E__ altero um campo preenchido tornando inválido
<br>__Então__ eu verifico se o cadastro foi impedido




### Problemas encontrados

__001 - #erro - Campos obrigatórios sem asterisco__
<br>Os campos obrigatórios: nome, sobrenome, e-mail, senha, confirmar senha, CPF, sexo, data nascimento, celular e endereço não estão sinalizados com um asterisco vermelho.

__002 - #erro - Radio button recebimento de ofertas__
<br>O recebimento de ofertas é feito através de um checkbox, e não radio button com as opções aceitar ou não as ofertas, como especificado.


__003 - #melhoria - Mensagem de erro CPF__
<br>Ao preencher o CPF de maneira inválida, a mensagem de erro está faltando a letra “e” em “Informe”


__004 - #melhoria  - Adicionar máscara no campo Número e limitar Data__
<br>É permitido preencher o campo “Data de Nascimento” com valor posterior a data do dia (Ex: 20/07/2050) e preencher o campo “Número” com letras.



### Procedimentos para rodar automação
__Windows__
1. Instalação do Ruby
<br>Acesse o link abaixo e instale a versão mais recente do ruby com a versão DEVKIT
<br>https://rubyinstaller.org/downloads/
<br>Para verificar se a instalação foi bem sucedida, abra o terminal e utilize o comando:
<br>ruby -v


2. Instalação das gems
<br>Utilize o terminal para instalar as seguintes dependências:
<br>GEM INSTALL BUNDLER "Gerenciador de GEMS"
<br>GEM INSTALL RSPEC "Ferramenta de suporte ao BDD"
<br>GEM INSTALL CUCUMBER "Ferramenta de desenvolvimento orientado a comportamento"
<br>GEM INSTALL CAPYBARA "Ferramenta de automação de testes"
<br>GEM INSTALL SELENIUM-WEBDRIVER "Ferramenta para testes de interface"

3. Download chromedriver
<br>Acesse o link abaixo e instale o driver com a versão corresponde ao chrome que já utiliza. Salve na pasta raiz do projeto
<br>https://chromedriver.chromium.org/downloads

4. Execução
<br>Abra o terminal e execute o comando abaixo para instalar as dependências.
<br>bundle install
<br>Em seguida você conseguirá executar os cenários de teste com o comando
<br>cucumber -t@tag

Obs.: 
- Os casos automatizados estão com as tags junto com os cenários especificados anteriormente. Para executar o cenário 02, por exemplo, execute o comando
	<br>cucumber -t@cadastro_oferta

- Depois de executado o comando pela primeira vez, em qualquer que seja o cenário, para garantir a funcionalidade do script altere os campos assinalados no arquivo cadastro.rb (substituir nome, CPF e email por valores válidos e ainda não cadastrados).



## Case 002 -  Como a "pessoa física" gostaria de buscar e comprar um livro digital

### Casos
__Contexto:__ 
<br>Dado eu estar logado como pessoa física 

- __Cenário 01: Verificar localização da opção digital de um livro__
<br>__Quando__ eu faço uma busca por um livro que possui em versão física e digital
<br>__Então__ eu verifico se tem ambas opções

- __Cenário 02: Verificar descrição e característica do produto__ 
<br>__Quando__ eu faço uma busca por um livro digital
<br>__Então__ eu verifico as informações do produto


- __Cenário 03: Comprar livro digital com sucesso__
<br>__Quando__ eu faço uma busca por um livro digital
<br>__E__ clico no botão comprar
<br>__Então__ eu verifico se o livro foi adicionado ao carrinho


- __Cenário 04: Comprar mais de um livro digital com sucesso__
<br>__Quando__ eu faço uma busca por vários livros digitais
<br>__E__ clico no botão comprar todos
<br>__Então__ eu verifico se todos foram adicionados ao carrinho


- __Cenário 05: Comprar livro digital e físico__
<br>__Quando__ eu faço uma busca por um livro digital
<br>__E__ clico no botão comprar
<br>__E__ faço uma busca por um livro físico
<br>__E__ clico no botão comprar
<br>__Então__ eu verifico apenas uma opção no carrinho


### Problemas encontrados
__001 - #erro  - Página “Meu carrinho” - Livro físico e digital no mesmo carrinho__
<br>É permitido adicionar produtos físicos e digitais no mesmo carrinho, diferente do especificado.


Obs.: 
- Apesar do caso especificar a ação “comprar”, os cenários foram até a página “Meu carrinho”, visto que não tenho acesso ao banco de dados para efetuar a compra sem gastar dinheiro :D.
