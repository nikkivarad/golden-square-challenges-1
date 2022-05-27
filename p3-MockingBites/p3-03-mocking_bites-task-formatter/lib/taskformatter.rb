class TaskFormatter
  def initialize(task) # task is an instance of Task
    @task = task
  end

  def format
    # Returns the task formatted as a string.
    # If the task is not complete, the format is:
    # - [ ] Task title
    # If the task is complete, the format is:
    # - [x] Task title
    output = "- ["
    @task.complete? ? (output += "x] ") : (output += " ] ")
    output += @task.title
    return output
  end
end