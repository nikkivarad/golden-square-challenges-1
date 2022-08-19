require 'todo'

RSpec.describe Todo do
  it "construct a new todo task" do
    task = Todo.new("Buy fruit")
    expect(task.show).to eq "Buy fruit"
    expect(task.status).to eq false #(not completed)
  end

  it "mark task as done" do
    task = Todo.new("Buy fruit")
    task.mark_done
    expect(task.status).to eq true
  end
end
