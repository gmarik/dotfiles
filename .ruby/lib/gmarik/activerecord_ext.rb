module ActiveRecord
  class Base
    #logger = ::Logger.new(STDOUT)

    class << self
      def first
        find(:first); 
      end unless defined?(first)

      def last
        find(:first, :order => 'id' ); 
      end unless defined?(last)

      alias :[] :find 
      alias :f :first 
      alias :l :last 
    end
  end
end
