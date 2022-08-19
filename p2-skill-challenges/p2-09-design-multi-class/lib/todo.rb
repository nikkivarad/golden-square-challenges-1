class Todo 
  def initialize(task)
    # task is a string
    @task = task
    # complete status (start as false)
    @status = false
  end

  def show
    @task
  end

  def status
    @status
  end

  def mark_done
    # change complete status to completed
    @status = true
  end
end