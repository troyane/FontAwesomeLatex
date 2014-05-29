#
#
require 'active_support/core_ext/string'

require 'yaml'
icons = YAML.load_file('../Font-Awesome/src/icons.yml')
categories = {}

icons['icons'].each do |icon|
	iconid=icon['id']
	unicode=icon['unicode'].upcase
	created=icon['created']
	name=iconid.gsub('-','_').camelize
	puts "\\expandafter\\def\\csname faicon@#{iconid}\\endcsname {\\symbol{\"#{unicode}}} \\def\\fa#{name} {{\\FA\\csname faicon@#{iconid}\\endcsname}}"
	unless icon['aliases'].nil? then
		icon['aliases'].each do |aliasentry|
			aliasname=aliasentry.gsub('-','_').camelize
			puts "\\expandafter\\def\\csname faicon@#{aliasentry}\\endcsname {\\fa#{name}} \\def\\fa#{aliasname} {\\fa#{name}}"
		end
	end
end

exit 0



