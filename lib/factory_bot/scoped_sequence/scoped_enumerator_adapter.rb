# frozen_string_literal: true

module FactoryBot
  class ScopedSequence
    class ScopedEnumeratorAdapter
      attr_reader :scope_value

      delegate :peek, :next, :rewind, to: :@value

      def initialize(scope_value, value)
        @scope_value = scope_value
        @value =
          if value.respond_to?(:peek)
            value
          else
            FactoryBot::Sequence::EnumeratorAdapter.new(value)
          end
      end
    end
  end
end
