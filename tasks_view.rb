class TasksView
  # local onde eu passo e recebo informação do meu usuário

  def ask_user_for_title
    puts "What task do you want to create?"
    gets.chomp

  end

  def ask_user_for_index
    puts "Index?"
    gets.chomp.to_i - 1
  end

  def display_tasks(tasks)
    tasks.each_with_index do |task, index|
      completed = task.completed? ? "[x]" : "[ ]"
      puts "#{completed} #{index + 1} - #{task.title}"
    end
  end
end

# @tasks = [{@title:"andar com o cachooro", @completed:false },{}]
