warn "auto-loading #{File.expand_path(__FILE__)}"

require 'rubygems'

require 'gmarik/utils'
require 'gmarik/activerecord_ext'

begin
require 'interactive_editor'
require 'gmarik/interactive_editor_ext'
rescue LoadError
  warn '"interactive_editor" not loaded: gem install interactive_editor'
end

def d(*args)
  puts delim = "\n#{'!' * 20 }\n"
  p(*args)
  puts delim
end

# begin
#   require 'pry'
#   IRB=Pry
#   warn 'Pry IRBs you'
# rescue LoadError
#   warn 'Pry is not available'
# end
