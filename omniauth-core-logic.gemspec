lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth/core_logic/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-core-logic"
  spec.version       = Omniauth::CoreLogic::VERSION
  spec.authors       = ["Realhub Systems"]
  spec.email         = ["support@realhub.com.au"]

  spec.summary       = %q{A CoreLogic OAuth2 strategy for OmniAuth}
  spec.description   = %q{A CoreLogic OAuth2 strategy for OmniAuth. This allows you to login to CoreLogic with your ruby app.}
  spec.homepage      = "https://github.com/realhub/omniauth-core-logic"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug", "~> 11"
end
