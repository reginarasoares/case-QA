#language: pt

Funcionalidade: Cadastro de "Pessoa Fisica" na loja

Contexto: 
Dado eu estar na pagina de cadastro 

@cadastro_oferta
Cenario: Fazer cadastro com sucesso aceitando oferta

Quando eu preencho todos os campos obrigatorios corretamente
E marco para receber emails de ofertas
Entao eu verifico se foi feito o cadastro


@cadastro_s_oferta
Cenario: Fazer cadastro com sucesso sem aceitar oferta
Quando eu preencho todos os campos obrigatorios corretamente
E finalizo o cadastro sem marcar a opcao de receber emails de ofertas
Entao eu verifico se foi feito o cadastro


@erro_s_campo
Esquema do Cenario: Fazer cadastro sem preencher algum campo obrigatorio
Quando eu preencho todos os campos obrigatorios corretamente
E excluo um <campo> obrigatorio
Entao eu verifico se o cadastro foi <impedido>
Exemplos:
|          campo         |                impedido              |
|       "InputNome1"     |            "Informe o nome"          |
|    "InputSobrenome1"   |          "Informe o sobrenome"       |
|      "InputEmail1"     |        "Informe um e-mail válido"    |
|      "InputSenha1"     |           "Informe uma senha"        |
|  "InputConfirmeSenha1" |           "Confirme a senha"         |
|       "InputCpf1"      |         "Informe um CPF válido"      |   
| "InputDataNascimento1" |        "Informe uma data válida"     |
|     "InputCelular1"    |"Informe um número de telefone válido"|
|       "InputCep1"      |         "Informe um CEP válido"      |
|      "InputNumero1"    |           "Informe o Número"         |
|      "InputBairro1"    |         "Informe o seu Bairro"       |
|     "InputEndereco1"   |        "Informe o seu Endereço"      |
|     "InputTelefone1"   |"Informe um número de telefone válido"|