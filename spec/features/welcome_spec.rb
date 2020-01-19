require 'rails_helper'

RSpec.feature "Welcomes", type: :feature do
  scenario 'Mostra a mensagem de Bem-Vindo' do
  	visit(root_path)
  	expect(page).to have_content('Seja Bem-Vindo!!!')
  end

  scenario 'Verificar o link de cadastro de clientes' do
  	visit(root_path)
  	expect(find('ul li')).to have_link('Cadastro de Clientes')
  end
end
