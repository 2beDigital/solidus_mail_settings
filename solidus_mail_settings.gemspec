# encoding: UTF-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'solidus_mail_settings/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_mail_settings'
  s.version     = SolidusMailSettings.version
  s.summary     = 'Mail setting functionality extracted from Solidus Commerce'
  s.description = s.summary
  s.required_ruby_version = '>= 2.1.0'

  s.author    = 'John Hawthorn'
  s.email     = 'john.hawthorn@gmail.com'
  s.homepage  = 'https://github.com/spree-contrib/spree_mail_settings'
  s.license   = 'BSD-3'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

end
