# APP.RB: o arquivo que a gente roda (ruby app.rb)
# Ele monta todas as peças e liga o programa.
# Leia de baixo para cima: router.run precisa de um router,
# que precisa de um controller, que precisa de um repositorio.

# carregar as classes que este arquivo usa (toda classe com letra maiúscula aqui embaixo)
require_relative "lib/task_repository"
require_relative "lib/controller"
require_relative "lib/router"

# criar o repositorio: o lugar onde as tarefas ficam guardadas (um só para o programa todo)
repo = TaskRepository.new
# criar o controller e entregar o repositorio para ele (dependency injection)
controller = Controller.new(repo)
# criar o router e entregar o controller para ele
router = Router.new(controller)

# ligar o programa: mostrar o menu e esperar o usuario escolher
router.run
