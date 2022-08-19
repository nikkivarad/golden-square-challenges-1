class Tasks
  
def initialize
    @tasks = []
  end

  def add_task(task)
    @tasks.push(task)
  end

  def mark_done(task) # task is a string
    index_remove = @tasks.find_index(task)
    @tasks.delete_at(index_remove)
  end

  def show_tasks
    # show all unfinished tasks
    @tasks
  end

end
