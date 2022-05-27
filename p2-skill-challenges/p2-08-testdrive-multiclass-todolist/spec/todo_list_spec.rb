require 'todo_list'

RSpec.describe TodoList do
  it "initialises" do
    todolist = TodoList.new
    expect(todolist.incomplete).to eq []
    expect(todolist.complete).to eq []
  end
  
end