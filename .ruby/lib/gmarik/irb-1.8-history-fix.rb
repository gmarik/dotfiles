# http://stackoverflow.com/questions/2065923/irb-history-not-working
module IRB
  # use at_exit hook instead finalizer to save history
  # as finalizer is NOT guaranteed to run
  def HistorySavingAbility.extended(obj); 
    Kernel.at_exit{ HistorySavingAbility.create_finalizer.call }
    obj.load_history #TODO: super?
    obj
  end
end if IRB::HistorySavingAbility.respond_to?(:create_finalizer)

