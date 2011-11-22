# see https://gist.github.com/1382974

begin
require 'rubygems'
Gem::Deprecate.skip = true 
rescue LoadError => e
  p e
end

