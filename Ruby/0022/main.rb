require_relative '../lib/problem'

Problem.new do |p|

  A_BYTE = 65

  p.submitted_answer = 871198282

  p.run do
    names = File.read("names.txt").split(",").map {|n| n.delete('^A-Za-z').upcase}.sort
    puts "Name Count: #{names.length}"
    
    name_alpha_scores = names.map {|name| name.bytes.map {|b| b-65+1}.inject(:+)}

    score = 0
    name_alpha_scores.each_with_index do |alpha_score, index|
      score += alpha_score * (index+1)
    end

    score
  end
  
end
