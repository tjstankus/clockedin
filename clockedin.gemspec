lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "clockedin/version"

Gem::Specification.new do |spec|
  spec.name          = "clockedin"
  spec.version       = Clockedin::VERSION
  spec.authors       = ["TJ Stankus"]
  spec.email         = ["tjstankus@gmail.com"]

  spec.summary       = %q{An experimental clock parser and reporter for Org mode-formatted files}
  spec.description   = %q{An experimental clock parser and reporter for Org mode-formatted files}
  spec.homepage      = "https://github.com/tjstankus/clockedin"
  spec.license       = "MIT"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = ""
  # spec.metadata["source_code_uri"] = ""
  # spec.metadata["changelog_uri"] = ""

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.8"
end
