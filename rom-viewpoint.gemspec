# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rom/viewpoint/version'

Gem::Specification.new do |spec|
  spec.name = 'rom-viewpoint'
  spec.version = ROM::Viewpoint::VERSION.dup
  spec.authors = ['Errin Larsen']
  spec.email = ['errinlarsen@gmail.com']
  spec.summary = 'WinRb/Viewpoint adapter for ROM'
  spec.description = spec.summary
  spec.homepage = 'https://github.com/errinlarsen/rom-viewpoint'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'viewpoint', '~> 1.0'
  spec.add_runtime_dependency 'virtus', '~> 1.0'
  spec.add_runtime_dependency 'equalizer', '~> 0.0', '>= 0.0.9'
  spec.add_runtime_dependency 'rom', '~> 0.8', '>= 0.8.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 10.0'
end
