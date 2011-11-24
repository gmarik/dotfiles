# see https://gist.github.com/1382974

begin
require 'rubygems'
Gem::Deprecate.skip = true if defined?(Gem::Deprecate)
rescue LoadError => e
  p e
end

