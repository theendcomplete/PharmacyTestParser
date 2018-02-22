require 'pdf-reader'
# require 'pdf/reader/html' pdf = PDF::Reader.new('pharm.pdf') puts 
# pdf.to_html
reader = PDF::Reader.new("pharm.pdf")
#match = string.match((/>(.*)</)[1]) page.text.scan(/\d[.].*/)[0]
#  one, two, three = match.captures
str = Array.new
# regexp =/(?<=\])(.*\n?)(?=\[)/
regexp =/(?<=[\]][ ])(.*\n?)(?=\[)/mo reader.pages.each do |page|
# #   #puts page.fonts
# #
  s=page.text.scan(regexp).to_s.strip.gsub(/\n{1,5}/,"")
  str << s
# #
# #
# #   #  break puts page.raw_content
end
puts str
