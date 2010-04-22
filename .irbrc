require 'pp'
require 'irb/completion'
require 'irb/ext/save-history'

# http://stackoverflow.com/questions/2065923/irb-history-not-working
module IRB
  # use at_exit hook instead finalizer to save history
  # as finalizer is NOT guaranteed to run
  def HistorySavingAbility.extended(obj); 
    Kernel.at_exit{ HistorySavingAbility.create_finalizer.call }
    obj.load_history #TODO: super?
    obj
  end
end 

IRB.conf[:USE_READLINE] = true
IRB.conf[:AUTO_INDENT] = true

IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:PROMPT_MODE]  = :SIMPLE


# Just for Rails...
if rails_env = ENV['RAILS_ENV']
  rails_root = File.basename(Dir.pwd)
  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:RAILS] = {
    :PROMPT_I => "#{rails_root}> ",
    :PROMPT_S => "#{rails_root}* ",
    :PROMPT_C => "#{rails_root}? ",
    :RETURN   => "=> %s\n" 
  }

  IRB.conf[:PROMPT_MODE] = :RAILS

  # Called after the irb session is initialized and Rails has
  # been loaded (props: Mike Clark).
  IRB.conf[:IRB_RC] = Proc.new do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.instance_eval { alias :[] :find }
  end
end

def mps(entry = nil)
  puts entry if entry
  mm = `ps -p #{$$} -o rss -o %mem| tail -1`.strip.split(/\s+/)
  {:rss =>mm[0], :mem => mm[1]}
end

