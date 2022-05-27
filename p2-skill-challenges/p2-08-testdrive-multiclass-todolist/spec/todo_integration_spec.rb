require 'todo_list'
require 'todo'

RSpec.describe "Todo integration" do
  it "returns the incomplete task when it is newly added" do
    todolist = TodoList.new
    todo = Todo.new("Buy milk")
    todolist.add(todo)
    expect(todolist.incomplete).to eq [todo]
  end

  it "returns when completed task when it is marked done" do
    todolist = TodoList.new
    todo = Todo.new("Buy milk")
    todolist.add(todo)
    todo.mark_done!
    expect(todolist.complete).to eq [todo]
  end

  it "returns the incomplete task when it is newly added, but not shown as completed task" do
    todolist = TodoList.new
    todo = Todo.new("Buy milk")
    todolist.add(todo)
    expect(todolist.incomplete).to eq [todo]
    expect(todolist.complete).to eq []
  end

  it "returns when completed task when it is marked done, and it will not show as incomplete task" do
    todolist = TodoList.new
    todo = Todo.new("Buy milk")
    todolist.add(todo)
    todo.mark_done!
    expect(todolist.complete).to eq [todo]
    expect(todolist.incomplete).to eq []
  end

  it "Add 2 tasks, mark 1 done. Returns tasks as appropriate" do
    todolist = TodoList.new
    todo = Todo.new("Buy milk")
    todolist.add(todo)
    todo2 = Todo.new("Clean room")
    todolist.add(todo2)
    todo.mark_done!
    expect(todolist.complete).to eq [todo]
    expect(todolist.incomplete).to eq [todo2]
  end

  it "Add 2 tasks, give up. Returns all tasks as done" do
    todolist = TodoList.new
    todo = Todo.new("Buy milk")
    todolist.add(todo)
    todo2 = Todo.new("Clean room")
    todolist.add(todo2)
    todolist.give_up!
    expect(todolist.complete).to eq [todo, todo2]
    expect(todolist.incomplete).to eq []
  end

end