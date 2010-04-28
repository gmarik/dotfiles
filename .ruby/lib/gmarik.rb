module Gmarik
  extend self

  def mps(entry = nil)
    puts entry if entry
    mm = `ps -p #{$$} -o rss -o %mem| tail -1`.strip.split(/\s+/)
    {:rss =>mm[0], :mem => mm[1]}
  end

  # TODO: put in proper location
  if defined?(::ActiveRecord)
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.instance_eval { alias :[] :find }
  end
end
