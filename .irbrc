require 'pp'
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf.merge!({
  :USE_READLINE =>  true,
  :AUTO_INDENT  =>  true,
  :SAVE_HISTORY =>  1000,
  :PROMPT_MODE  =>  :VERBOSE,
  :HISTORY_FILE =>  "#{ENV['HOME']}/.irb_history",
})

IRB.conf[:PROMPT] ||= {}
IRB.conf[:PROMPT][:VERBOSE] = {
  :PROMPT_I => "#{cwd = File.basename(Dir.pwd)}> ",
  :PROMPT_S => "#{cwd}* ",
  :PROMPT_C => "#{cwd}? ",
  :RETURN   => "=> %s\n" 
}

IRB.conf[:IRB_RC] = Proc.new do
  require 'gmarik'
  require 'gmarik/activerecord_ext'
end

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

