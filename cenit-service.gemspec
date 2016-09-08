$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'cenit/service/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'cenit-service'
  s.version     = Cenit::Service::VERSION
  s.authors     = ['Maikel Arcia']
  s.email       = ['macarci@gmail.com']
  s.homepage    = 'https://cenit.io'
  s.summary     = 'The Cenit service engine.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '>= 4.2.5'

  s.add_runtime_dependency 'cenit-token'
end
