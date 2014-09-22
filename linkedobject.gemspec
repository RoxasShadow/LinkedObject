Kernel.load 'lib/linkedobject/version.rb'

Gem::Specification.new { |s|
  s.name          = 'linkedobject'
  s.version       = LinkedObject::VERSION
  s.author        = 'Giovanni Capuano'
  s.email         = 'webmaster@giovannicapuano.net'
  s.homepage      = 'http://www.giovannicapuano.net'
  s.platform      = Gem::Platform::RUBY
  s.summary       = 'You and the world will change togheter.'
  s.description   = 'A linked object is a holy object with the power to change itself according to the world.'
  s.licenses      = 'WTFPL'

  s.require_paths = ['lib']
  s.files         = Dir.glob('lib/**/*.rb')
  s.test_files    = Dir.glob('spec/**/*_spec.rb')

  s.add_development_dependency 'rake', '~> 0'
  s.add_development_dependency 'rspec', '~> 0'
}
