class StringRepeater
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello. I will repeat a string many times."
    @io.puts "Please enter a string"
    str = @io.gets.chomp
    @io.puts "Please enter a number of repeats"
    num = get_number
    @io.puts "Here is your result:"
    @io.puts "#{str * num}"
  end

  private

  def get_number
    input = @io.gets.chomp
    return input.to_i if input.to_i.to_s == input
    fail "Please enter a number"
  end

end


string_repeater = StringRepeater.new(Kernel)
string_repeater.run

