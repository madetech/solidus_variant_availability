# encoding: UTF-8
$:.push File.expand_path('./lib', File.dirname(__FILE__))
require 'solidus_variant_availability/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_variant_availability'
  s.version     = SolidusVariantAvailability::VERSION
  s.summary     = 'Adds the ability to toggle purchasablility (real word?) of Spree::Variant'
  s.description = s.summary
  s.license     = 'BSD-3-Clause'

  s.author    = 'Seb Ashton'
  s.email     = 'seb@madetech.com'
  s.homepage  = 'http://www.madetech.com'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'solidus_core', '2.3.0'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop', '0.37.2'
  s.add_development_dependency 'rubocop-rspec', '1.4.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
