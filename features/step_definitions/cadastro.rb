#cadastro_oferta
Dado("eu estar na pagina de cadastro") do
    visit '/'
    windows.last.maximize
    find('#link-account').click
    sleep(2)
    find('#vtexIdUI-saraiva-oauth').click
    sleep(2)
    @popup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(@popup)
    windows.last.maximize
    find('.btn.btn--block.btn-large.m-t-15.cadastrar-usuario').click
    sleep(2)
end
  
Quando("eu preencho todos os campos obrigatorios corretamente") do
    fill_in(name: "InputNome1", with: "Regina")   #Altere após "with:" com outro nome
    fill_in(name: "InputSobrenome1", with: "Vitta")
    fill_in(name: "InputEmail1", with: "regina_vitta@hotmail.com") #Altere após "with:" com um email válido ainda não cadastrado
    fill_in(name: "InputSenha1", with: "#vittano")
    fill_in(name: "InputConfirmeSenha1", with: "#vittano")
    fill_in(name: "InputCpf1", with: "61834661587")  #Altere após "with:" com um cpf válido ainda não cadastrado
    choose('RadioFeminino1', allow_label_click: true)
    fill_in(name: "InputDataNascimento1", with: "19021978")
    fill_in(name: "InputCelular1", with: "94995794329")
    fill_in(name: "InputCep1", with: "68506-200")
    page.execute_script ("window.scrollBy(0,100000)")
    find("#InputNumero1").click
    fill_in(name: "InputNumero1", with: "598")
    fill_in(name: "InputBairro1", with: "Nova Marabá")
    fill_in(name: "InputEndereco1", with: "Quadra Vinte")
    fill_in(name: "InputTelefone1", with: "94995794329")
    sleep(3)
end
  
E("marco para receber emails de ofertas") do
    check('InputOfertasPromocionais1', allow_label_click: true)
    find("#FinalizarCadastro1").click 
    sleep(6)
end
  
#A verificação é feita realizando o login do cadastro recém-realizado e conferindo os dados básicos.
Entao("eu verifico se foi feito o cadastro") do
    visit '/'
    windows.last.maximize
    find('#link-account').click
    sleep(2)
    find('#vtexIdUI-saraiva-oauth').click
    sleep(2)
    @popup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(@popup)
    windows.last.maximize
    fill_in(name: "username", with: "regina_vitta@hotmail.com")  #Altere após "with:" com o email cadastrado
    fill_in(name: "password", with: "#vittano")
    sleep(2)
    find("#submit-1").click
    @popup = page.driver.browser.window_handles.first
    page.driver.browser.switch_to.window(@popup)
    sleep(10)
    @conta = find('.detalhes-conta')
    expect(@conta.text).to eql "Nome: Regina\nSobrenome: Vitta\nCPF: 61834661587\nData de Nascimento: 19/02/1978\nTelefone: 94995794329" #Altere após "Nome: " e "CPF: " com os dados cadastrados
end



#cadastro_s_oferta
E("finalizo o cadastro sem marcar a opcao de receber emails de ofertas") do
    find("#FinalizarCadastro1").click 
    sleep(6)
end




#erro_s_campo
Quando("excluo um {string} obrigatorio") do |campo_name|
    page.execute_script ("window.scrollBy(0,-100000)")
    sleep(1)
    fill_in(name: campo_name , with: "")
    sleep(3)
    page.execute_script ("window.scrollBy(0, 100000)")
    sleep(2)
    find("#FinalizarCadastro1").click
    sleep(2)
    page.execute_script ("window.scrollBy(0,-100000)")
    sleep(5)
end
  
Entao("eu verifico se o cadastro foi {string}") do |msg_impedido|
    @mensagem = all(".error") [1]
    puts @mensagem.text
    expect(@mensagem.text).to eq msg_impedido
end