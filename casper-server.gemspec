# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'casper_server'

Gem::Specification.new do |s|
  s.name        = "casper_server"
  s.version     = '0.1.2'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tom Wilson"]
  s.email       = ["tom@jackhq.com"]
  s.homepage    = "http://github.com/twilson63/casper_server"
  s.summary     = "A JRuby Reports Server for Jasper"
  s.description = "The JRuby Reports Server for JasperReports"
  s.required_rubygems_version = ">= 1.3.6"
  s.add_development_dependency "rspec", ">= 2.5.0"
  s.add_development_dependency "rack-test", ">= 0"

  s.add_dependency "bundler", ">= 0"
  s.add_dependency "sinatra", ">= 0"
  s.add_dependency "casperreports", ">= 0.1.0"

  s.files        = Dir.glob("{lib}/**/*") + %w(LICENSE readme.md bin/casper-server)
  s.require_path = ['lib']
  s.executables = ["casper-server"]
end

