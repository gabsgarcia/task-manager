#bota todo mundo pra funcionar

require_relative "router"
require_relative "tasks_controller"

controller  = TasksController.new
router = Router.new(controller)
router.run
