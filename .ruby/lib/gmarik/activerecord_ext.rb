module ActiveRecord
  class Base
      class << self
        def first
          find(:first, *args); 
        end unless method_defined?(:first)

        def last
          find(:first, :order => 'id DESC' ); 
        end unless method_defined?(:last)

        alias  :[] :find unless method_defined?(:[])
        alias  :f  :first
        alias  :l  :last 
      end
  end
end if defined?(::ActiveRecord)

if defined?(::ActiveRecord)
  def DB!(db_env)
    ActiveRecord::Base.establish_connection(db_env)
  end

  def C()
    ActiveRecord::Base.connection
  end
end
