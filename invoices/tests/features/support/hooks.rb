
Before do
    @home = HomePage.new
    @nav = NavbarPage.new
    @login = LoginPage.new
    @dash = DashboardPage.new
end

# After do
#     puts 'tudo aqui acontece quando finaliza um cenário'
# end

After('@logout') do
    @nav.logout
    @login.load
end