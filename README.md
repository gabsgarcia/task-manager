# TODO Manager em MVC

Um gerenciador de tarefas no terminal, feito em Ruby com o padrão **MVC** (Model, View, Controller).
É o live code da aula de Cookbook: a mesma estrutura que vocês vão usar no challenge, trocando `Task` por `Recipe`.

Todos os arquivos estão comentados linha a linha. Leia com calma!

## Como rodar

```bash
git clone https://github.com/gabsgarcia/task-manager.git
cd task-manager
ruby app.rb
```

O menu aparece no terminal:

```
What do you want to do?
1 - List tasks
2 - Add a task
3 - Mark a task as done
4 - Remove a task
5 - Exit
```

Para testar só as ações do controller, sem o menu:

```bash
ruby test.rb
```

## Os arquivos

```
task-manager/
├── app.rb                  # liga tudo e roda o programa
├── test.rb                 # testa cada ação do controller, uma por uma
└── lib/
    ├── task.rb             # MODEL
    ├── task_repository.rb  # REPOSITORY
    ├── tasks_view.rb       # VIEW
    ├── controller.rb       # CONTROLLER
    └── router.rb           # ROUTER
```

## Quem faz o quê (o Poupatempo)

Pense numa ida ao Poupatempo para tirar o RG. Cada um tem um trabalho só:

| No Poupatempo | No código | Responsabilidade |
|---|---|---|
| A triagem na porta ("Qual serviço?") | **Router** (`router.rb`) | Mostra o menu e manda o número escolhido para a ação certa do controller. Não resolve nada sozinho |
| O atendente do guichê | **Controller** (`controller.rb`) | Atende cada ação do usuário. Não guarda nada e não tem `puts`/`gets`: ele **pede** para a view e para o repositório |
| O balcão (você fala, recebe o papel) | **View** (`tasks_view.rb`) | O único lugar com `puts` (mostrar) e `gets` (perguntar) |
| O arquivo de fichas | **Repository** (`task_repository.rb`) | Guarda as tarefas, entrega, encontra e apaga |
| A sua ficha | **Model** (`task.rb`) | Uma tarefa: a descrição e se está feita ou não |

O **Router** e o **Repository** não fazem parte do MVC. No Rails, o router já vem pronto e o repository é trocado pelo banco de dados.

Duas regras para lembrar:
- **1 arquivo = 1 classe**
- **1 classe = 1 responsabilidade** (Single Responsibility Principle)

## Seguindo uma ação do começo ao fim

O que acontece quando você escolhe **3 - Mark a task as done**:

1. `router.rb`: o `route_action` recebe o `3` e chama `@controller.mark_as_done`.
2. `controller.rb`: o `mark_as_done` chama o `display_tasks` para mostrar a lista.
3. `controller.rb` (`display_tasks`): pede as tarefas ao repositório (`@repo.all`) e pede para a view mostrar (`@view.display_list`).
4. `tasks_view.rb`: o `ask_for_index` pergunta o número e devolve o índice do array (`- 1`, porque o usuário conta do 1 e o array conta do 0).
5. `task_repository.rb`: o `find(index)` encontra a tarefa.
6. `task.rb`: a própria tarefa se marca como feita com `mark_as_done!`.

## Como o `app.rb` monta tudo

Leia o `app.rb` de baixo para cima:

- `router.run` precisa de um **router**
- `Router.new(controller)` precisa de um **controller**
- `Controller.new(repo)` precisa de um **repositório**
- `TaskRepository.new` cria o repositório

O repositório é criado uma vez só, fora do controller, e entregue para ele. Isso se chama **dependency injection**.

## A limitação (e o que vem no Cookbook)

Adicione umas tarefas, saia com `5` e rode `ruby app.rb` de novo. A lista está vazia!
O repositório guarda tudo só na **memória**: fechou o programa, perdeu.

No challenge **03-Cookbook-With-CSV**, vocês resolvem isso salvando as receitas num arquivo CSV. Só o repositório (o `Cookbook`) muda.

## Dicas para o Cookbook

O Cookbook é este mesmo programa com outros nomes. Fiquem atentos ao que o `rake` confere:

- No **Controller**, o cookbook fica em `@cookbook` (aqui é `@repo`).
- No **Cookbook**, a lista fica em `@recipes` (aqui é `@tasks`).
- `destroy` recebe o **índice**, não a receita.
- A **View** tem um método `display_list(recipes)`.
- No Cookbook, o `app.rb` fica **dentro** de `lib/`. Rode com `ruby lib/app.rb`.

Travou? Abra este código do lado e pergunte: **em qual arquivo isso acontecia aqui?**
