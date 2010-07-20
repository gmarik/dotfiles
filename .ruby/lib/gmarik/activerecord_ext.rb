module ActiveRecord
  class Base
      class << self
      def first
        find(:first); 
      end unless instance_methods.include?(:first)

      def last
        find(:first, :order => 'id DESC' ); 
      end unless instance_methods.include?(:last)

        alias  :[] :find 
        alias  :f  :first
        alias  :l  :last 
      end
  end
end if defined?(::ActiveRecord)
