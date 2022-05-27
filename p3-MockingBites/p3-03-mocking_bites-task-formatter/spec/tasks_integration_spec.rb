require "task_list"
require "task"

RSpec.describe "tasks integration" do
  context "Task List Integration" do
    it "adds tasks to a list" do
      task_list = TaskList.new
      task_1 = Task.new("Walk the dog")
      task_2 = Task.new("Walk the cat")
      task_list.add(task_1)
      task_list.add(task_2)
      expect(task_list.all).to eq [task_1, task_2]
    end

    it "marks tasks as complete" do
      task_list = TaskList.new
      task_1 = Task.new("Walk the dog")
      task_2 = Task.new("Walk the cat")
      task_list.add(task_1)
      task_list.add(task_2)
      task_1.mark_complete
      task_2.mark_complete
      expect(task_list.all_complete?).to eq true
    end
  end

  context "Task Formatter Integration" do
    it "returns the formatted incomplete task as a string" do
      task_1 = Task.new("Walk the dog")
      formatter = TaskFormatter.new(task_1)
      expect(formatter.format).to eq ("- [ ] Walk the dog")
    end

    it "returns the formatted completed task as a string" do
      task = Task.new("Walk the cat")
      formatter = TaskFormatter.new(task)
      task.mark_complete
      expect(formatter.format).to eq ("- [x] Walk the cat")
    end  
  end  
end
