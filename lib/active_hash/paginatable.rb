module ActiveHash
  module Paginatable
    def self.prepended(base)
      class << base
        self.prepend(ClassMethods)
      end
    end

    module ClassMethods
      [:find, :all, :where, :method_missing].each do |method|
        define_method(method) do |*args|
          paginatize(super(*args))
        end
      end

      private

      def define_custom_find_all_method(field_name)
        super(field_name)

        method_name         = :"find_all_by_#{field_name}"
        orignal_method_name = :"#{method_name}_org"

        the_meta_class.instance_eval do
          alias_method orignal_method_name, method_name

          define_method(method_name) do |*args|
            paginatize(send(orignal_method_name, *args))
          end
        end
      end

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
