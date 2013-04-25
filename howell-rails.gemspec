# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'howell-rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'howell-rails'
  spec.version       = Howell::Rails::VERSION
  spec.authors       = ['James Newton']
  spec.email         = ['james@Zaphyous.com']
  spec.description   = %q{Send notices to howell throughout rails applications}
  spec.summary       = %q{Send notices to howell throughout rails applications}
  spec.homepage      = 'http://git.zaphyous.com/zaphyous/howell-rails'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-colorize'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'shoulda'
end
