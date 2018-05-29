
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'siimple/version'

Gem::Specification.new do |spec|
  spec.name          = 'siimple'
  spec.version       = Siimple::VERSION
  spec.authors       = ['Siimple', 'Berkhan Berkdemir']
  spec.email         = ['community@siimple.xyz']

  spec.summary       = 'Minimal and responsive CSS Framework for flat and clean designs.'
  spec.description   = 'Minimal and responsive CSS Framework for flat and clean designs.'
  spec.homepage      = 'https://github.com/siimple/siimple'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split('\n')
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'sass', '>= 3.5.2'
  spec.add_runtime_dependency 'autoprefixer-rails', '>= 6.0.3'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 12.3'
end
