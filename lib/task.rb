# MODEL: representa UMA tarefa (no Poupatempo, é a ficha)
# Estado: a descrição e se está feita ou não
# Comportamento: dizer se está feita e se marcar como feita
class Task
  # deixar quem está de fora ler a descrição (a view precisa dela para mostrar no terminal)
  attr_reader :description

  def initialize(description)
    # guardar a descrição que recebemos
    @description = description
    # toda tarefa nova começa como não feita
    @done = false
  end

  # responder true ou false: a tarefa está feita?
  def done?
    @done
  end

  # mudar o estado da própria tarefa para feita
  def mark_as_done!
    @done = true
  end
end
