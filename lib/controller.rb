# CONTROLLER: atende cada ação do usuario (no Poupatempo, é o atendente do guichê)
# Ele não guarda as tarefas e não tem puts nem gets: ele PEDE para o repositorio e para a view.
# Cada ação do menu é um método aqui.

# carregar as classes que o controller usa
require_relative "task"
require_relative "tasks_view"

class Controller
  def initialize(repo)
    # guardar o repositorio que veio de fora (do app.rb)
    @repo = repo
    # criar a view aqui dentro: ela não guarda nada, então pode ser nova
    @view = TasksView.new
  end

  def list
    # mostrar todas as tarefas (o passo a passo está no display_tasks, lá embaixo)
    display_tasks
  end

  def add
    # pedir para a view perguntar ao usuario a descrição da tarefa
    description = @view.ask_for_description
    # criar uma nova tarefa (instância de Task) com essa descrição
    task = Task.new(description)
    # pedir para o repositorio guardar a nova tarefa
    @repo.create(task)
  end

  def mark_as_done
    # mostrar as tarefas para o usuario saber qual número escolher
    display_tasks
    # pedir para a view perguntar ao usuario o número da tarefa (a view já devolve o índice do array)
    index = @view.ask_for_index
    # pedir para o repositorio encontrar a tarefa nesse índice
    task = @repo.find(index)
    # pedir para a própria tarefa se marcar como feita
    task.mark_as_done!
  end

  def remove
    # mostrar as tarefas para o usuario saber qual número escolher
    display_tasks
    # pedir para a view perguntar ao usuario o número da tarefa
    index = @view.ask_for_index
    # pedir para o repositorio apagar a tarefa nesse índice
    @repo.destroy(index)
  end

  private

  # método privado: só o próprio controller usa, para não repetir esses dois passos
  def display_tasks
    # pedir todas as task para o repositorio
    tasks = @repo.all
    # pedir para a view mostrar essas tarefas para o usuario(mostrar no terminal)
    @view.display_list(tasks)
  end
end
