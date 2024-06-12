# frozen_string_literal: true

RSpec.describe FactoryBot::ScopedSequence::Extension do
  describe FactoryBot::ScopedSequence::Extension::DefinitionProxyExtension do
    def build_proxy(factory_name)
      definition = FactoryBot::Definition.new(factory_name)
      FactoryBot::DefinitionProxy.new(definition)
    end

    it "creates a new sequence with original arguments" do
      allow(FactoryBot::ScopedSequence).to receive(:new).and_call_original
      allow(FactoryBot::Sequence).to receive(:new).and_call_original
      sequence_block = proc { |n| "user+#{n}@example.com" }

      proxy = build_proxy(:factory)

      proxy.sequence(:sequence_name, 1, &sequence_block)
      expect(FactoryBot::ScopedSequence).not_to have_received(:new)
      expect(FactoryBot::Sequence).to have_received(:new).with(:sequence_name, 1, &sequence_block)
    end

    it "creates a new scoped sequence starting at 1" do
      allow(FactoryBot::ScopedSequence).to receive(:new).and_call_original
      proxy = build_proxy(:factory)

      proxy.sequence(:sequence_name, scope: :scope_name)

      expect(FactoryBot::ScopedSequence).to have_received(:new).with(:sequence_name, :scope_name)
    end

    it "creates a new scoped sequence with an overridden starting value" do
      allow(FactoryBot::ScopedSequence).to receive(:new).and_call_original
      proxy = build_proxy(:factory)
      override = "override"

      proxy.sequence(:sequence_name, override, scope: :scope_name)

      expect(FactoryBot::ScopedSequence).to have_received(:new)
        .with(:sequence_name, :scope_name, override)
    end

    it "creates a new scoped sequence with a block" do
      allow(FactoryBot::ScopedSequence).to receive(:new).and_call_original
      sequence_block = proc { |n| "user+#{n}@example.com" }
      proxy = build_proxy(:factory)
      proxy.sequence(:sequence_name, 1, scope: :scope_name, &sequence_block)

      expect(FactoryBot::ScopedSequence).to have_received(:new)
        .with(:sequence_name, :scope_name, 1, &sequence_block)
    end
  end
end
