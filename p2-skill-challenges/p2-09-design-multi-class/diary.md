# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user  
> So that I can record my experiences  
> I want to keep a regular diary

> As a user  
> So that I can reflect on my experiences  
> I want to read my past diary entries 

> As a user  
> So that I can reflect on my experiences in my busy day  
> I want to select diary entries to read based on how much time I have and my
> reading speed

> As a user  
> So that I can keep track of my tasks  
> I want to keep a todo list along with my diary

> As a user  
> So that I can keep track of my contacts  
> I want to see a list of all of the mobile phone numbers in all my diary
> entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```chart
┌───────────────────────────────┐     ┌─────────────────────────────┐
│  Diary                        │     │  Todo List                  │
│ - find entries                │     │                             │
│   according to time and wpm   │     │  - read tasks               │
│ - display all phone num       │     │   (completed & incomplete)  │
│                               │     │  - mark all done            │
│                               │     │                             │
└────────┬──────────────────────┘     └─────┬───────────────────────┘
         │contains                          │ contains
         │0 to multiple entries             │ 0 to multiple tasks
         ▼                                  ▼
┌───────────────────────────────┐     ┌─────────────────────────────┐
│ Entries                       │     │  Tasks                      │
│  - write entries              │     │   - add tasks               │
│  - read entries               │     │   - mark done?              │
│  - contains mobile phone num. │     │                             │
└───────────────────────────────┘     └─────────────────────────────┘

```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
    # an array containing entries
    # returns nothing
  end

  def add(entry)
    # entry is a DiaryEntry object
    # adds the entry into the diary
  end

  def find_entries(wpm, time)
    # wpm (word per minute) and time should be integer
    # returns the approriate entry (longest entry with readinging time no exceeding the available time)
  end

  def display_all_titles
    # takes no parameters
    # return an array of titles of entries in the Diary
  end

  def display_all_phone_num
    # takes no parameters
    # return an array of phone numbers
  end
end

class DiaryEntry
  def initialize(title, contents, phone)
    # title,  contents and phone are strings
    # returns nothing
  end

  def title
    # returns the title
  end

  def contents
    # returns the contents
  end

  def phone
    # returns the phone number
  end

  def word_count
    # returns the the word count (an integer) of the entry
  end
  
  def reading_time(wpm)
    # wpm is an integer
    # returns the time (integer) needed for reading the whole contents according to its word counts
  end
end

class TodoList
  def initialize
    # an array containing tasks
  end

  def add(task)
    # task is a Todo Class object
    # adding the task into the list
  end

  def show_incomplete
    # display an array containing all incomplete tasks
  end

  def show_complete
    # display an array containing all complete tasks
  end

  def mark_all_done
    # marks all tasks inside the List as completed
  end
end

class Todo 
  def initialize(task)
    # task is a string
    # complete status (start as false)
  end

  def show
    # display the task
  end

  def status
    # show whether it is completed
  end

  def mark_done
    # change complete status to completed
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE
# Diary
# making a new entry into the diary
diary = Diary.new
entry1 = DiaryEntry("Title1", "Contents1", "12345678")
diary.add(entry1)
diary.display_all_titles # => ["Title1"]
diary.display_all_phone_num # => ["12345678"]

# searching for the entry to read now (within the given time and wpm)
diary = Diary.new
str201 = "word " * 201
entry1 = DiaryEntry("Title1", str201 , "12345678")
diary.add(entry1)
str401 = "word " * 401
entry2 = DiaryEntry("Title2", str401 , "23456789")
diay.find_entries(200, 2) # => return entry1

# display all phone numbers
diary = Diary.new
str201 = "word " * 201
entry1 = DiaryEntry("Title1", str201 , "12345678")
diary.add(entry1)
str401 = "word " * 401
entry2 = DiaryEntry("Title2", str401 , "23456789")
diay.display_all_phone_num # => returns ["12345678", "23456789"]

# TodoList
# Making a new list
todolist = TodoList.new
task1 = Todo.new("Buy milk")
todolist.add(task1)
todolist.show_incomplete # => returns [task1]

# completing a task, and show accordingly
todolist = TodoList.new
task1 = Todo.new("Buy milk")
todolist.add(task1)
task1.mark_done
todolist.show_incomplete # =>  returns []
todolist.show_complete # =>  returns [task1]

# Multiple tasks, some completed, and show accordingly
todolist = TodoList.new
task1 = Todo.new("Buy milk")
todolist.add(task1)
task2 = Todo.new("Walk the dog")
todolist.add(task2)
task1.mark_done
todolist.show_incomplete # =>  returns [task2]
todolist.show_complete # =>  returns [task1]

# Multiple tasks, mark all done, and show accordingly
todolist = TodoList.new
task1 = Todo.new("Buy milk")
todolist.add(task1)
task2 = Todo.new("Walk the dog")
todolist.add(task2)
todolist.mark_all_done
todolist.show_incomplete # =>  returns []
todolist.show_complete # =>  returns [task1, task2]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Diary Entry
# Constructs a new entry
str401 = "word " * 401
entry1 = DiaryEntry("Title1", str401 , "12345678")
entry1.contents # => str401 (word word word... )
entry1.title # => "Title1"
entry1.phone # => "12345678"

# calculate word count
str401 = "word " * 401
entry1 = DiaryEntry("Title1", str401 , "12345678")
entry1.word_count # => 401

# calculate reading time
str401 = "word " * 401
entry1 = DiaryEntry("Title1", str401 , "12345678")
entry1.reading_time(200) # => 3

# Todo task
# construct a new todo task
task = Todo.new("Buy fruit")
task.show # => "Buy fruit"
task.status # => false (not completed)

# mark task as done
task = Todo.new("Buy fruit")
task.mark_done
task.status # => true


```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


