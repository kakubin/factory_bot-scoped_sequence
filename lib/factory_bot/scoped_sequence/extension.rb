# frozen_string_literal: true

require "factory_bot"

module FactoryBot
  class ScopedSequence
    module Extension
      module DefinitionProxyExtension
        def sequence(name, *args, **options, &block)
          if (scope_name = options.delete(:scope))
            sequence = ::FactoryBot::ScopedSequence.new(name, scope_name, *args, **options, &block)
            add_attribute(name) { increment_scoped_sequence(sequence) }
          else
            super
          end
        end

        ::FactoryBot::DefinitionProxy.prepend self
      end

      module EvaluatorExtension
        def increment_scoped_sequence(sequence)
          scope_value = send(sequence.scope_name)
          sequence.next(scope_value, self)
        end

        ::FactoryBot::Evaluator.include self
      end
    end
  end
end
