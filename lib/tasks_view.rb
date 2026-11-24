# VIEW: o único lugar que conversa com o usuario (no Poupatempo, é o balcão)
# Só aqui pode ter puts (mostrar) e gets (perguntar).
# Não guarda nada, por isso não tem initialize.
class TasksView
  # mostrar a lista de tarefas no terminal, numerada e com [x] nas feitas
  def display_list(tasks)
    # faz uma interação em todas as task e printa cada uma
    tasks.each_with_index do |task, index|
      # escolher a caixinha: [x] se a tarefa está feita, [ ] se não está
      box = task.done? ? "[x]" : "[ ]"
      # mostrar o número (index + 1, porque o usuario conta a partir do 1), a caixinha e a descrição
      puts "#{index + 1}. #{box} #{task.description}"
    end
  end

  # perguntar ao usuario o que ele precisa fazer e devolver o texto digitado
  def ask_for_description
    puts "What do you need to do?"
    print "> "
    # gets pega o que o usuario digitou, chomp tira o "enter" do final
    gets.chomp
  end

  # perguntar ao usuario o número da tarefa e devolver o índice do array
  def ask_for_index
    puts "Index?"
    print "> "
    # transformar em número e tirar 1: o usuario conta do 1, o array conta do 0
    gets.chomp.to_i - 1
  end
end
