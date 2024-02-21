require_relative "task"

task1 = Task.new("andar com o cachooro")

task2 = Task.new("ir no supermercado")

p task1
p task2

task1.mark_as_completed!
p task1
p task2
