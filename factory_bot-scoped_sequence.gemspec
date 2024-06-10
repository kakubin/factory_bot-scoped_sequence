# frozen_string_literal: true

require_relative "lib/factory_bot/scoped_sequence/version"

Gem::Specification.new do |spec|
  spec.name = "factory_bot-scoped_sequence"
  spec.version = FactoryBot::ScopedSequence::VERSION
  spec.authors = ["kakubin"]
  spec.email = ["wetsand.wfs@gmail.com"]

  spec.summary = "Extension to add scope to factory_bot's sequence"
  spec.description = "Extension to add scope to factory_bot's sequence"
  spec.homepage = "https://github.com/kakubin/factory_bot-scoped_sequence"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir.glob("lib/**/*") + [File.basename(__FILE__)]
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "factory_bot"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
