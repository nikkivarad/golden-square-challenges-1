require 'todo_list'
require 'todo'

RSpec.describe "integration of classes" do
  it "makes a new list" do
    todolist = TodoList.new
    task1 = Todo.new("Buy milk")
    todolist.add(task1)
    expect(todolist.show_incomplete).to eq [task1]
  end

  it "completes a task, and show accordingly" do
    todolist = TodoList.new
    task1 = Todo.new("Buy milk")
    todolist.add(task1)
    task1.mark_done
    expect(todolist.show_incomplete).to eq []
    expect(todolist.show_complete).to eq [task1]
  end

  it "Multiple tasks, some completed, and show accordingly" do
    todolist = TodoList.new
    task1 = Todo.new("Buy milk")
    todolist.add(task1)
    task2 = Todo.new("Walk the dog")
    todolist.add(task2)
    task1.mark_done
    expect(todolist.show_incomplete).to eq [task2]
    expect(todolist.show_complete).to eq [task1]
  end

  it "Multiple tasks, mark all done, and show accordingly" do
    todolist = TodoList.new
    task1 = Todo.new("Buy milk")
    todolist.add(task1)
    task2 = Todo.new("Walk the dog")
    todolist.add(task2)
    todolist.mark_all_done
    expect(todolist.show_incomplete).to eq []
    expect(todolist.show_complete).to eq [task1, task2]
  end
end