require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  require 'jeweler/gemcutter_tasks'

  Jeweler::Tasks.new do |gem|
    gem.name        = "markup"
    gem.summary     = %Q{Command line Markdown-to-HTML conversion}
    gem.description = %Q{Small command line tool that reads Markdown files and outputs HTML}
    
    gem.email       = "james@jameswilding.net"
    gem.homepage    = "http://github.com/jameswilding/markup"
    gem.authors     = ["James Wilding"]
    
    gem.files       = Dir['lib/**/*'] + Dir['bin/*']
    gem.executables << 'markup'
    gem.add_dependency 'rdiscount', '>= 1.3.5'
    
    gem.add_development_dependency "thoughtbot-shoulda", '>= 2.10.2'
    gem.add_development_dependency "redgreen", '>= 1.2.2'
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION')
    version = File.read('VERSION')
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "markup #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
