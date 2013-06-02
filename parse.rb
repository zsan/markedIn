#!ruby
require 'nokogiri'

xml_doc  = Nokogiri::XML(open("citygrid.xml"))

xml_doc.xpath("//results/locations/location").each do |f|
	#f.children.each do |z|
	#	puts "#{z.name} : #{z.text}"
	#end
	puts 'a'
end
#puts xml_doc
