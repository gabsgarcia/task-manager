# ROUTER: recebe a escolha do usuario e manda para a ação certa do controller
# (no Poupatempo, é a triagem da entrada: "Qual serviço?"). Ele não resolve nada sozinho.
# O router não faz parte do MVC: no Rails ele já vem pronto.
class Router
  def initialize(controller)
    # guardar o controller que recebemos do app.rb, para chamar as ações dele
    @controller = controller
    # o programa começa ligado
    @running = true
  end

  def run
    puts "Welcome to your TODO manager!"
    # repetir enquanto o programa estiver ligado
    while @running
      # mostrar o menu de opções
      print_menu
      # pegar o número que o usuario digitou
      action = gets.chomp.to_i
      # mandar esse número para a ação certa
      route_action(action)
    end
    # o loop acabou: o usuario escolheu sair
    puts "Bye!"
  end

  private

  # mostrar as opções do menu no terminal
  def print_menu
    puts ""
    puts "What do you want to do?"
    puts "1 - List tasks"
    puts "2 - Add a task"
    puts "3 - Mark a task as done"
    puts "4 - Remove a task"
    puts "5 - Exit"
    print "> "
  end

  # para cada número, chamar a ação certa do controller
  def route_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.add
    when 3 then @controller.mark_as_done
    when 4 then @controller.remove
    # desligar o programa: o while para na próxima volta
    when 5 then @running = false
    else
      # número que não existe no menu
      puts "Please type 1, 2, 3, 4 or 5"
    end
  end
end
