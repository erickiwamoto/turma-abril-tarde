
Before do
    @home = HomePage.new
    @nav = NavbarPage.new
    @login = LoginPage.new
    @dash = DashboardPage.new
    @customer = CustomerPage.new
end

# After do
#     puts 'tudo aqui acontece quando finaliza um cenário'
# end

Before('@login') do
    @home.load
    @home.login.click
    @login.with('kato.danzo@qaninja.com.br', 'secret')
end

After('@remove_customer') do
    ## delete from tb_customer where email = 'teste@teste.com.br'
end
 
After('@logout') do
    @nav.logout
    @login.load
end