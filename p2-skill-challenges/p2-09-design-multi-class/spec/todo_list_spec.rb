
require 'todo_list'

RSpec.describe TodoList do
  it "initialises a todo list with an empty array" do
    todolist = TodoList.new
    expect(todolist.show_complete).to eq []
    expect(todolist.show_incomplete).to eq []
  end
end