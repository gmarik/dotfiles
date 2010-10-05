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
