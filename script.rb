require 'pdf-reader'
# require 'pdf/reader/html' pdf = 
# PDF::Reader.new('pharm.pdf') puts pdf.to_html
reader = PDF::Reader.new("pharm.pdf")
#match = string.match((/>(.*)</)[1]) 
#page.text.scan(/\d[.].*/)[0]
#  one, two, three = match.captures
str = Array.new
# regexp =/(?<=\])(.*\n?)(?=\[)/
regexp =/(?<=[\]][ ])(.+?)(?=\[)/mo 
reader.pages.each do |page|
# #   #puts page.fonts
# #
  str=page.text.scan(regexp)
 # str << s
# #
# #
# #   #  break puts page.raw_content
break
end
str.each do |el|
  puts el.class
end
puts str.inspect
