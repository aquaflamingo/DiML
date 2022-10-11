# frozen_string_literal: true

require_relative "lib/diml/version"

Gem::Specification.new do |spec|
  spec.name = "diml"
  spec.version = Diml::VERSION
  spec.authors = ["aquaflamingo"]
  spec.email = ["16901597+aquaflamingo@users.noreply.github.com"]

  spec.summary = "Convert a diml document to markdown"
  spec.description = "A diml document provides a simple markup format for dictating notes in a way to preserve formatting for transformation to a presentable format (e.g. markdown)"
  spec.homepage = "https://github.com/aquaflamingo/diml"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/aquaflamingo/diml"
  spec.metadata["changelog_uri"] = "https://github.com/aquaflamingo/diml/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "minitest"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
