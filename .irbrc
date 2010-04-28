require 'pp'
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:USE_READLINE] = true
IRB.conf[:AUTO_INDENT] = true

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:PROMPT_MODE] = :VERBOSE

IRB.conf[:PROMPT] ||= {}
IRB.conf[:PROMPT][:VERBOSE] = {
  :PROMPT_I => "#{cwd = File.basename(Dir.pwd)}> ",
  :PROMPT_S => "#{cwd}* ",
  :PROMPT_C => "#{cwd}? ",
  :RETURN   => "=> %s\n" 
}

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

