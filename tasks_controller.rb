require_relative "task"
require_relative "tasks_view"
require_relative "repository"


class TasksController
  def initialize
    @repository = Repository.new
    @view = TasksView.new
  end

  def list
    tasks = @repository.all
    @view.display_tasks(tasks)
  end

  def add_task
    # pergar o titulo do usuário
    title = @view.ask_user_for_title
    # passar essse titulo para o meu modelo
    task = Task.new(title)
    # salvar no repositorio
    @repository.create(task)
    list
  end

  def mark_as_done
    # mostrar as tarefas para o usuário
    list
    # perguntar qual tarefa marcar
    index = @view.ask_user_for_index
    # encontrar a tarefa escolhida no repositorio
    task = @repository.find(index)
    # marcar como completa
    task.mark_as_completed!
    # mostrar as tarefas atualizadas para o usuário
    list
  end

  def delete
    # mostrar as tarefas para o usuário
    list
    # perguntar qual tarefa deletar
    index = @view.ask_user_for_index
    # remover do repositorio
    @repository.destroy(index)
  end

end
