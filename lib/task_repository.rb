# REPOSITORY: guarda as tarefas na memória (no Poupatempo, é o arquivo de fichas)
# Ele não fala com o usuario e não sabe mostrar nada: só guarda, entrega, encontra e apaga.
# Fecha o programa, perde tudo. Mais para frente ele vira um banco de dados.
class TaskRepository
  def initialize
    @tasks = [] # guarda INSTÂNCIAS de Task
  end

  # guardar uma tarefa nova no array
  def create(task)
    @tasks << task
  end

  # entregar todas as tarefas
  def all
    @tasks
  end

  # encontrar a tarefa que está nesse índice do array
  def find(index)
    @tasks[index]
  end

  # apagar a tarefa que está nesse índice do array
  def destroy(index)
    @tasks.delete_at(index)
  end
end