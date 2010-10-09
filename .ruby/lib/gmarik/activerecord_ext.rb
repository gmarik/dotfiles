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

  def SQL(sql)
    ActiveRecord::Base.connection.select_all(sql)
  end

  def log!(stream = $stdout) 
    ActiveRecord::Base.logger = Logger.new(stream)
    ActiveRecord::Base.clear_active_connections!
  end

  def nolog!; log!(nil); end
end
