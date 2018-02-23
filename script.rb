require 'pdf-reader'

reader = PDF::Reader.new("pharm.pdf")

question_blocks_array = Array.new
questions_array = Array.new
answers_array = Array.new

regexp_question_block = /(?<=[\]][ ])(.+?)(?=\d{1,5})/mo
regexp_question = /((.+?)(?=[А][)]))/mo
regexp_answer = /(?=\))(.+?)(?=(\b[)]|\z))/mo

reader.pages.each do |page|
  page.text.scan(regexp_question_block) do |m|
    question_blocks_array << m[0].tr("\n", '')
  end
  break
end
question_blocks_array.each do |el|
  el.scan(regexp_question) do |m|
    questions_array << m[0].strip
  end
  el.scan(regexp_answer) do |m|
    puts m.class.to_s
      m.each do |q|
        puts q.class.to_s
        puts q
        answers_array << q.strip
      end
 #   answers_array << m[0].strip
  end
  puts answers_array.inspect
end
#puts question_blocks_array.inspect
