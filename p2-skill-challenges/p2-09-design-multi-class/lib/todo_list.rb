class TodoList
  def initialize
    @list = []
  end

  def add(task)
    @list.push(task)
  end

  def show_incomplete
    output = []
    @list.each{|task|
      output.push(task) if task.status == false
    }
    return output
  end

  def show_complete
    output = []
    @list.each{|task|
      output.push(task) if task.status == true
    }
    return output
  end

  def mark_all_done
    @list.each{|task|
      task.mark_done
    }
  end
end