require_relative "tasks_controller"
class Router
  #direciona o que o usuário quer fazer para o controler
  def initialize(controller)
    @controller = controller
  end

  def run
    #mostrar o que o user pode fazer
    show_action
    #pegar o que ele quer fazer
    action = gets.chomp.to_i
    #fazer essa ação
    dispatch(action)
  end

  def show_action
    puts "------"
    puts "which number do you want to do?"
    puts "1 - Display tasks"
    puts "2 - Add a task"
    puts "3 - Remove a task"
    puts "4 - Mark a task as completed"
    puts "------"
  end

  def dispatch(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.add_task
    when 3 then @controller.delete
    when 4 then @controller.mark_as_done
    else
      puts "please chose from 1,2,3 or 4"
    end
  end

end
