# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubie/version'

Gem::Specification.new do |spec|
  spec.name          = 'rubie'
  spec.version       = Rubie::VERSION
  spec.authors       = ['Takumu Uyama']
  spec.email         = ['sasurai.usagi3@gmail.com']

  spec.summary       = '彼女のいないRubyistのためのgem'
  spec.description   = '彼女のいないRubyiesのためのgem。対話式インタプリタです。'
  spec.homepage      = 'https://github.com/sasurai-usagi3/rubie'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry'
end
