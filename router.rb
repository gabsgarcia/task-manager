require_relative "tasks_controller"
class Router
  #direciona o que o usuário quer fazer para o controler
  def initialize(controller)
    @controller = controller
    @running = true #variavel para ter o loop das ações
  end

  def run
    puts "Welcome to the Cookbook!"
    puts "           --           "
    #loop das ações
    while @running
      #mostrar o que o user pode fazer
      show_action
      #pegar o que ele quer fazer
      action = gets.chomp.to_i
      #fazer essa ação
      dispatch(action)
    end
  end

  def show_action
    puts "------"
    puts "which number do you want to do?"
    puts "1 - Display tasks"
    puts "2 - Add a task"
    puts "3 - Remove a task"
    puts "4 - Mark a task as completed"
    puts "5 - Stop and exit the program"
    puts "------"
  end

  def stop
    @running = false
  end

  def dispatch(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.add_task
    when 3 then @controller.delete
    when 4 then @controller.mark_as_done
    when 5 then stop
    else
      puts "please chose from 1,2,3 or 4"
    end
  end

end
