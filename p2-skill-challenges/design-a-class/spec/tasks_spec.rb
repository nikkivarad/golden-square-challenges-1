require 'tasks'

RSpec.describe Tasks do
  context "adding tasks and show" do
    it "add one task to the list and able to show it" do
      tasks = Tasks.new
      tasks.add_task("Buy milk")
      result = tasks.show_tasks
      expect(result).to eq ["Buy milk"]
    end

    it "add multiple tasks to the list and able to show all" do
      tasks = Tasks.new
      tasks.add_task("Buy milk")
      result = tasks.show_tasks
      expect(result).to eq ["Buy milk"]
      tasks.add_task("Pay water bill")
      tasks.add_task("Practise coding")
      expect(result).to eq ["Buy milk", "Pay water bill", "Practise coding"]
    end
  end

  context "Showing correct tasks after removal" do
    it "addes two tasks and remove one, able to show one unfinished task" do
      tasks = Tasks.new
      tasks.add_task("Buy milk")
      tasks.add_task("Pay water bill")
      result = tasks.show_tasks
      expect(result).to eq ["Buy milk", "Pay water bill"]
      tasks.mark_done("Buy milk")
      result = tasks.show_tasks
      expect(result).to eq ["Pay water bill"]
    end

    it "addes three tasks and remove second, able to show three unfinished task" do
      tasks = Tasks.new
      tasks.add_task("Buy milk")
      tasks.add_task("Pay water bill")
      tasks.add_task("Practise coding")
      result = tasks.show_tasks
      expect(result).to eq ["Buy milk", "Pay water bill", "Practise coding"]
      tasks.mark_done("Pay water bill")
      result = tasks.show_tasks
      expect(result).to eq ["Buy milk", "Practise coding"]
    end


  end

end