# A class for managing a problem.
class Problem
  
  # Initialize the problem.  One primarily interacts through it using the block.
  def initialize
    @submitted_answer = nil
    @duration = nil
    yield(self) if block_given?
  end
  
  attr_reader :computed_answer, :submitted_answer
  attr_writer :submitted_answer
  attr_reader :duration
  
  # The check an answer.
  #
  # Used for when we know an answer to a simpler input.
  def check(answer, &block)
    computed_answer = block.call
    output_check(computed_answer, answer)
    return computed_answer
  end
  
  # Run the real answer.  If we have completed the problem and know the answer,
  # we can set that via the submitted_answer property to get check output.
  def run(&block)
    start_at = Time.now
    @computed_answer = block.call
    stop_at = Time.now
    @duration = stop_at - start_at
    if( submitted_answer )
      output_check(self.computed_answer, self.submitted_answer)
    end
    puts "-- Computed in #{self.duration * 1000.0} ms"
    puts "ANSWER: #{computed_answer.inspect}"
    return @computed_answer
  end
  
  private
  
  # Print the output.  Note that we return the message to be more functional (for fun).
  def output_check(computed_answer, right_answer)
    message = "-- Answer Correct: #{(computed_answer==right_answer) ? 'YES' : 'NO'}, Expected: #{right_answer.inspect}, Got: #{computed_answer.inspect}"
    puts message
    return message
  end
  
end