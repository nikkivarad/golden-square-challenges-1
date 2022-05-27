require 'todo'

RSpec.describe Todo do
  it "initialises" do
    todo = Todo.new("A task")
    expect(todo.task).to eq "A task"
  end

  it "able to tell a task is undone when it is" do
    todo = Todo.new("A task")
    expect(todo.done?).to eq false
  end 

  it "able to tell a task is done when it is" do
    todo = Todo.new("A task")
    todo.mark_done!
    expect(todo.done?).to eq true
  end 
end