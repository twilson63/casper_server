# Need a rake task to build XmlDataReportProducer.java

#javac -cp lib/commons-digester-1.7.jar:lib/commons-logging-1.1.1.jar:lib/commons-collections-2.1.1.jar:lib/commons-beanutils-1.8.0.jar:lib/groovy-all-1.7.5.jar:lib/xalan-2.7.1.jar:lib/itext-2.1.7.jar:dist/jasperreports-4.0.1.jar XmlDataReportProducer.java

#ruby -J-Xss64m -J-cp lib/commons-digester-1.7.jar:lib/commons-logging-1.1.1.jar:lib/commons-collections-2.1.1.jar:lib/commons-beanutils-1.8.0.jar:lib/groovy-all-1.7.5.jar:lib/xalan-2.7.1.jar:lib/itext-2.1.7.jar:dist/jasperreports-4.0.1.jar test.rb
require 'rspec/core/rake_task'

desc 'Build XmlDataReportProducer'
task :build do |t|
  system 'javac -cp include/lib/commons-digester-1.7.jar:include/lib/commons-logging-1.1.1.jar:include/lib/commons-collections-2.1.1.jar:include/lib/commons-beanutils-1.8.0.jar:include/lib/groovy-all-1.7.5.jar:include/lib/xalan-2.7.1.jar:include/lib/itext-2.1.7.jar:include/dist/jasperreports-4.0.1.jar ./include/XmlDataReportProducer.java'
  puts 'compiled XmlDataReportProducer ....'
end

require 'bundler'
Bundler::GemHelper.install_tasks

desc 'Default: run specs.'
task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb" # don't need this, it's default.
  # Put spec opts in a file named .rspec in root
end

desc "Generate code coverage"
RSpec::Core::RakeTask.new(:coverage) do |t|
  t.pattern = "./spec/**/*_spec.rb" # don't need this, it's default.
  t.rcov = true
  t.rcov_opts = ['--exclude', 'spec']
end
