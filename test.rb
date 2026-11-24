# Arquivo de teste do live code: cada ação nova ganha uma linha aqui.
# Rode com: ruby test.rb
require_relative "lib/task"
require_relative "lib/task_repository"
require_relative "lib/controller"

repo = TaskRepository.new
repo.create(Task.new("Cleaning"))
repo.create(Task.new("Cooking"))

controller = Controller.new(repo)

controller.list          # 1. List
controller.add           # 2. Add (vai pedir a descrição)
controller.list
controller.mark_as_done  # 3. Mark as done (vai pedir o índice)
controller.list
controller.remove        # 4. Remove (vai pedir o índice)
controller.list
