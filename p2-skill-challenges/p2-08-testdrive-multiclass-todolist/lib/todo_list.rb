# File: lib/todo_list.rb
class TodoList
  def initialize
    @todolist = []
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
    @todolist.push(todo)
  end

  def incomplete
    # Returns all non-done todos
    return @todolist.select { |task|
      !task.done?
    }
  end

  def complete
    # Returns all complete todos
    return @todolist.select { |task|
      task.done?
    }
  end

  def give_up!
    # Marks all todos as complete
    @todolist.map {|task|
      task.mark_done!
    }
  end
end