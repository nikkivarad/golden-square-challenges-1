# As a user
# So that I can keep track of my tasks
# I want to check if a text includes the string #TODO.

def keep_track_task(text)
  fail "Input is an empty string." if text.nil?
  fail "Input is an empty string." if text == ""
  if text.match? "#TODO"
    return true
 else
   false
 end
end
