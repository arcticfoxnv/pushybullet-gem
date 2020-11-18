# frozen_string_literal: true

require_relative 'lib/pushybullet/version'

Gem::Specification.new do |spec|
  spec.name          = 'pushybullet'
  spec.version       = Pushybullet::VERSION
  spec.authors       = ['Nick King']
  spec.email         = ['TBD']

  spec.summary       = 'A ruby gem for the pushybullet api'
  spec.homepage      = 'https://github.com/arcticfoxnv/pushybullet-gem'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/arcticfoxnv/pushybullet-gem'
  spec.metadata['changelog_uri'] = 'https://github.com/arcticfoxnv/pushybullet-gem/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|.idea)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 1.1.0'
  spec.add_dependency 'faraday_middleware', '~> 1.0.0'
end
