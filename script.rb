require 'pdf-reader'

reader = PDF::Reader.new('pharm.pdf')

question_blocks_array = []
questions_array = []
answers_array = []

regexp_question_block = /(?<=[\]][ ])(.+?)(?=\d{1,5})/mo
regexp_question = /((.+?)(?=[А][)]))/mo
regexp_answer = /(?<=\))(.+?)(?=([А-Г][)]|\z))/mo

reader.pages.each do |page|
  page.text.scan(regexp_question_block) do |m|
    question_blocks_array << m[0].tr("\n", '')
  end
  # break
end
question_blocks_array.each do |el|
  el.scan(regexp_question) do |m|
    questions_array << m[0].strip
  end
  el.scan(regexp_answer) do |m|
    puts m.class.to_s
    # m.each do |q|
    #   puts q.class.to_s
    #   puts q[0]
    #   answers_array << q.strip
    # end
    answers_array << m[0].strip
  end

end
puts answers_array.size.to_s
answers_array.each do |q|
  puts q
end
# puts question_blocks_array.inspect
