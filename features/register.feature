# language: pt
Funcionalidade: Realizar cadastro de um usuário no TILIX Business

   Etapa 1 do Cadastro
    Cenário: Na primeira etapa, verificar se o E-mail é válido.
      Dado que esteja na página de cadastro "https://qa-web.tilix.com.br/cadastro/etapa-1"
      Quando preencher o campo E-mail com "emaildobreno@email.com"
      E pressionar o botão "Experiemente Grátis"
      Então deverá redirecionar para página com o título "Cadastro - Etapa 2 - Tilix Work"

    Cenário: Na primeira etapa, verificar se o E-mail é inválido.
     Dado que esteja na página de cadastro "https://qa-web.tilix.com.br/cadastro/etapa-1"
     Quando preencher o campo E-mail com "b@bcom"
     E pressionar o botão "Experiemente Grátis"
     Então deverá exibir a mensagem "E-mail inválido."
    
    Cenário: Na primeira etapa, verificar se o campo E-mail é obrigatório.
      Dado que esteja na página de cadastro "https://qa-web.tilix.com.br/cadastro/etapa-1"
      Quando pressionar o botão "Experiemente Grátis"
      Então deverá exibir a mensagem "Campo obrigatório."
    
    Cenário: Na primeira etapa, verificar se o e-mail foi cadastrado anteriormente.
      Dado que esteja na página de cadastro "https://qa-web.tilix.com.br/cadastro/etapa-1"
      Quando preencher o campo E-mail com "brenoborgesfranca@gmail.com"
      E pressionar o botão "Experiemente Grátis"
      Então deverá exibir o erro  "E-mail já cadastrado, clique aqui para efetuar seu login."

    Cenário: Na segunda etapa, verificar se o CNPJ é válido.
      Dado que esteja na página de cadastro "https://qa-web.tilix.com.br/cadastro/etapa-1"
      Quando preencher o campo E-mail com "emaildobreno@email.com"
      E pressionar o botão "Experiemente Grátis"
      Quando preencher o campo "CNPJ ou CPF" com "80.393.866/0001-49"
      E remover o foco do campo
      Então não irá exibir a mensagem "CPF/CNPJ inválido."

    Cenário: Na segunda etapa, verificar se o CPF é válido  
      Dado que esteja na página de cadastro "https://qa-web.tilix.com.br/cadastro/etapa-1"
      Quando preencher o campo E-mail com "emaildobreno@email.com"
      E pressionar o botão "Experiemente Grátis"
      Quando preencher o campo "CNPJ ou CPF" com "741.725.150-10"
      E remover o foco do campo
      Então não irá exibir a mensagem "CPF/CNPJ inválido."

    Cenário: Na segunda etapa, verificar se o CNPJ é inválido.
      Dado que esteja na página de cadastro "https://qa-web.tilix.com.br/cadastro/etapa-1"
      Quando preencher o campo E-mail com "emaildobreno@email.com"
      E pressionar o botão "Experiemente Grátis"
      Quando preencher o campo "CNPJ ou CPF" com "80.393.866/0001-48"
      E remover o foco do campo
      Então irá exibir a mensagem "CPF/CNPJ inválido."

    Cenário: Na segunda etapa, verificar se o CPF é inválido.
      Dado que esteja na página de cadastro "https://qa-web.tilix.com.br/cadastro/etapa-1"
      Quando preencher o campo E-mail com "emaildobreno@email.com"
      E pressionar o botão "Experiemente Grátis"
      Quando preencher o campo "CNPJ ou CPF" com "741.725.150-11"
      E remover o foco do campo
      Então irá exibir a mensagem "CPF/CNPJ inválido."

    Cenário: Na segunda etapa, verificar se o campo Data de Nascimentos estará disponível ao inserir CPF.
      Dado que esteja na página de cadastro "https://qa-web.tilix.com.br/cadastro/etapa-1"
      Quando preencher o campo E-mail com "emaildobreno@email.com"
      E pressionar o botão "Experiemente Grátis"
      Quando preencher o campo "CNPJ ou CPF" com "741.725.150-10"
      Então o campo "Data de nascimento" irá aparecer

    Cenário: Na segunda etapa, verificar se o campo Data de Nascimentos não estará disponível ao inserir CNPJ.
      Dado que esteja na página de cadastro "https://qa-web.tilix.com.br/cadastro/etapa-1"
      Quando preencher o campo E-mail com "emaildobreno@email.com"
      E pressionar o botão "Experiemente Grátis"
      Quando preencher o campo "CNPJ ou CPF" com "80.393.866/0001-49"
      Então o campo "Data de nascimento" não irá aparecer

    Cenário: Na segunda etapa, verificar se o CNPJ já está cadastrado.
      Dado que esteja na página de cadastro "https://qa-web.tilix.com.br/cadastro/etapa-1"
      Quando preencher o campo E-mail com "emaildobreno@email.com"
      E pressionar o botão "Experiemente Grátis"
      E o formulário preenchido com "28.038.705/0002-06" e "GO"
      Quando pressionar o botão "CONTINUAR CADASTRO"
      Então deverá exibir um alerta de erro "CNPJ/CPF já cadastrado. Por favor, clique aqui para efetuar seu login."

    Cenário: Na segunda etapa, verificar se o CPF já está cadastrado.
      Dado que esteja na página de cadastro "https://qa-web.tilix.com.br/cadastro/etapa-1"
      Quando preencher o campo E-mail com "emaildobreno@email.com"
      E pressionar o botão "Experiemente Grátis"
      E o formulário preenchido com "751.788.341-00" e "GO"
      E preencher a data de nascimento com "12/04/1994"
      Quando pressionar o botão "CONTINUAR CADASTRO"
      Então deverá exibir um alerta de erro "CNPJ/CPF já cadastrado. Por favor, clique aqui para efetuar seu login."

    #   Exemplos:
    #     |        cpf         |    nasc    | uf |
    #     | 80.393.866/0001-49 | 13/08/1993 | GO |

    Cenário: verificar campos obrigatórios na segunda etapa
      Dado que esteja na página de cadastro "https://qa-web.tilix.com.br/cadastro/etapa-1"
      Quando preencher o campo E-mail com "emaildobreno@email.com"
      E pressionar o botão "Experiemente Grátis"
      Quando pressionar o botão "CONTINUAR CADASTRO"
 
  # # Etapa 3 do Cadastro

   Cenário: Na terceira etapa, verificar quantidade mínima de 3 caracteres nos campos Nome e Sobrenome.
    Dado  que esteja na etapa 3 do cadastro
    Quando preencher os campos nome e sobrenome com caracteres"Br" e "Bo"
    Então irá exibir a mensagem "Deve conter no mínimo 3 caracteres."
 
   Cenário: Na terceira etapa, verificar comparação dos campos de Senha e Confirmação.
    Dado  que esteja na etapa 3 do cadastro
    Quando preencher os campos nome e sobrenome com caracteres"Breno" e "Borges"
    E preencher o telefone com "62992594355"
    E preencher as senhas com "br229022" e "oi229022"
    E remover o foco do campo senha
    Então irá exibir a mensagem "Senha e confirmar senha não conferem."
  
  Cenário: Na terceira etapa, verificar a possibilidade de visualizar senha ao preencher.
   Dado  que esteja na etapa 3 do cadastro
   Quando preencher os campos nome e sobrenome com caracteres"Breno" e "Borges"
   E preencher o telefone com "62992594355"
   E preencher as senhas com "br229022" e "br229022"
   Então deverá visualizar senhas "br229022"
  
  Cenário: Na terceira etapa, verificar validação de nível de força no campo senha.
   Dado  que esteja na etapa 3 do cadastro
   Quando preencher os campos nome e sobrenome com caracteres"Breno" e "Borges"
   E preencher o telefone com "62992594355"
   E preencher as senhas com "12345678" e "12345678"
   Então irá exibir a mensagem "Senha inválida."
  
  Cenário: Na terceira etapa, verificar aceite de termos de uso pelo usuário.
    Dado  que esteja na etapa 3 do cadastro
    Quando preencher os campos nome e sobrenome com caracteres"Breno" e "Borges"
    E preencher o telefone com "62992594355"
    E preencher as senhas com "oi229022" e "oi229022"
    E finalizar sem aceitar os termos de uso
    Então irá exibir a mensagem "Para continuar com o cadastro, deve aceitar os termos de uso."
  
  Cenário: Na terceira etapa, verificar campos obrigatórios.
    Dado  que esteja na etapa 3 do cadastro
    E finalizar sem aceitar os termos de uso
    Então deverá exibir a mensagem "Campo obrigatório."
  
#Observação: como não possuo um controle da base de teste, 
#então sempre que rodar este cenário deverá ser cadastrado um novo e-mail e CNPJ, 
#pois o sistema não permite realizar o teste para
#este cenário como o mesmo e-mail nem com o mesmo CNPJ
  Cenário: Concluindo cadastro até etapa quatro
    Dado que eu conclua a etapa um
    E conclua a etapa dois
    E conclua a etapa três
    Então deverá redirecionar para página com o título "Cadastro - Etapa 4 - Tilix Work"
  