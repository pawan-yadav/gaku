# encoding: UTF-8

require_relative '../common_gaku_gemspec_mixin'

Gem::Specification.new do |s|
  set_gaku_gemspec_shared s

  s.name         = 'gaku_frontend'
  s.summary      = 'Default front end web views for GAKU Engine. See https://github.com/GAKUEngine/gaku'
  s.description  = 'The default Rails front end for GAKU Engine, with web views etc.'

  s.files        = Dir['LICENSE', 'README.md', 'app/**/*', 'config/**/*', 'lib/**/*', 'db/**/*', 'vendor/**/*']
  s.test_files   = `git ls-files -- {spec}/*`.split("\n")
  s.require_path = 'lib'

  s.requirements << 'postgresql'
  s.requirements << 'postgresql-contrib'

  s.add_dependency 'gaku_core', s.version
  s.add_dependency 'gaku_testing', s.version

  s.add_dependency 'coffee-rails',                   '~> 4.1.0'
  s.add_dependency 'sass-rails',                     '~> 5.0.0'
  s.add_dependency 'sprockets',                      '3.2.0'
  s.add_dependency 'sass',                           '~> 3.2'
  s.add_dependency 'slim',                           '~> 3.0'

  s.add_dependency 'responders',                     '~> 2.0'

  s.add_dependency 'rails4_client_side_validations', '~> 4.2'

  s.add_dependency 'phantom_helpers',                '~> 0.11'
  s.add_dependency 'phantom_forms',                  '~> 0.3'
  s.add_dependency 'phantom_nested_forms',           '~> 0.3'

  s.add_dependency 'nested_form'

  s.add_dependency 'jquery-rails',                   '~> 4.0'
  s.add_dependency 'jquery-ui-rails',                '~> 4.2'
  s.add_dependency 'jquery-minicolors-rails',        '2.1.4'
  s.add_dependency 'bootstrap-sass',                 '3.1.1.0'
  s.add_dependency 'bootstrap-datepicker-rails',     '~> 1.3.0.1'
  s.add_dependency 'nprogress-rails'
  s.add_dependency 'underscore-rails',               '~> 1.5.2'
  s.add_dependency 'momentjs-rails',                 '~> 2.5.1'
  s.add_dependency 'select2-rails',                  '3.5.7'
  s.add_dependency 'remotipart',                     '~> 1.2.1'
  s.add_dependency 'bootstrap-datetime-picker-for-rails', '~> 0.0.4'

  s.add_dependency 'socket.io-rails'
end
