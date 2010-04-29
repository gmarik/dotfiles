module Gmarik
  warn "auto-loading #{File.expand_path(__FILE__)}"
  extend self

  def mps(entry = nil)
    puts entry if entry
    mm = `ps -p #{$$} -o rss -o %mem| tail -1`.strip.split(/\s+/)
    {:rss =>mm[0], :mem => mm[1]}
  end
end

