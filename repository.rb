class Repository
  # local de salvar/guardar as minhas task
  def initialize
    @tasks = []
  end

  def create(task)
    # salvando a task no repositorio
    @tasks << task
  end

  def all
    @tasks
  end

  def find(index)
    @tasks[index]
  end

  def destroy(index)
    @tasks.delete_at(index)
  end
end
