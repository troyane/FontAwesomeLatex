require 'active_support/core_ext/string'
require 'yaml'

SOURCE_FILE=ARGV[0]
CURRENT_VERSION='4.1'

if SOURCE_FILE.nil? then
	STDERR.puts "No source file given."
	exit 2
end

icons = YAML.load_file(SOURCE_FILE)
categories = {}

icons['icons'].each do |icon|
	cats = icon['categories']
	cats.each do |cat|
		categories[cat] = []  unless categories.keys.include? cat
		categories[cat] << icon
	end
end

categories.keys.each do |cat|
	puts "\\subsection{#{cat}}"
	puts "\\begin{showcase}"
	categories[cat].each do |icon|
		puts "\\showcaseicon{#{icon['id']}}{fa#{icon['id'].gsub('-','_').camelize}}{#{icon['created'].to_s}}% unicode:#{icon['unicode']} / created:#{icon['created']}"
		unless icon['aliases'].nil? then
			icon['aliases'].each do |aliasentry|
				puts "\\showcaseicon{#{aliasentry}}{fa#{aliasentry.gsub('-','_').camelize}}{alias}"
			end
		end
			
	end
	puts "\\end{showcase}"
end


