module ActiveHash
  module Paginatable
    def self.prepended(base)
      class << base
        self.prepend(ClassMethods)
      end
    end

    module ClassMethods
      [:find, :all, :where].each do |method|
        define_method(method) do |*args|
          paginatize(super(*args))
        end
      end

      private

      def paginatize(ary)
        return ary unless ary.is_a?(Array)

        ::Kaminari.paginate_array(ary, {
          total_count: _data.count,
          offset:      0,
          limit:       _data.count
        })
      end
    end
  end
end
