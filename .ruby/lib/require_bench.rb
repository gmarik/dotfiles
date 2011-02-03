module Kernel

  alias require_orig_bench require

  def require(*args)
    from = Time.now.to_f
    $__deep ||= 0; $__deep += 1
    require_orig_bench(*args)
    $stderr.puts %Q[ #{"  " * ($__deep - 1) } #{(Time.now.to_f - from).round(5)} in #{args.inspect} ]
    $__deep -= 1
  end
end
