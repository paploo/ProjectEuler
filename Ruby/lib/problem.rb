class Problem
  
  def initialize(submitted_answer=nil)
    @submitted_answer = nil
    @duration = nil
    yield(self) if block_given?
  end
  
  attr_reader :computed_answer, :submitted_answer
  attr_writer :submitted_answer
  attr_reader :duration
  
  def check(answer, &block)
    computed_answer = block.call
    output_check(computed_answer, answer)
  end
  
  def run(&block)
    start_at = Time.now
    @computed_answer = block.call
    stop_at = Time.now
    @duration = stop_at - start_at
    if( submitted_answer )
      output_check(self.computed_answer, self.computed_answer)
    end
    puts "-- Computed in #{self.duration * 1000.0} ms"
    puts "ANSWER: #{submitted_answer.inspect}"
  end
  
  private
  
  def output_check(computed_answer, right_answer)
    puts "-- Answer Correct: #{(computed_answer==right_answer) ? 'YES' : 'NO'}, Expected: #{right_answer.inspect}, Got: #{computed_answer.inspect}"
  end
  
end