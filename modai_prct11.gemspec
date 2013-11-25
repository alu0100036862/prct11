# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'modai_prct11/version'

Gem::Specification.new do |spec|
  spec.name          = "modai_prct11"
  spec.version       = ModaiPrct11::VERSION
  spec.authors       = ["Dailos Herrera Bencomo y Mohammed Mahrach"]
  spec.email         = ["alu0100036862@etsii.ull.es"]
  spec.description   = %q{Simply generates modai_prct11 ipsum text.}
  spec.summary       = %q{modai_prct11 ipsum generator}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
