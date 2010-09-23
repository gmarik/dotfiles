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
  require 'gmarik/irb-1.8.6-history-fix'
  #require 'gmarik/activerecord_ext'
end

