class InteractiveCalculator
  def initialize(io)
    @io = io
  end

  def run 
    @io.puts "Hello. I will subtract two numbers."
    @io.puts "Please enter a number"
    num1 = @io.gets.chomp.to_i
    @io.puts "Please enter another number"
    num2 = @io.gets.chomp.to_i
    @io.puts "Here is your result:"
    @io.puts ("#{num1} - #{num2} = #{num1 - num2}")

  end
end

interactive_calculator = InteractiveCalculator.new(Kernel)
interactive_calculator.run
