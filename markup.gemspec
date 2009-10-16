# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{markup}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Wilding"]
  s.date = %q{2009-10-16}
  s.description = %q{Small command line that reads Markdown files and outputs HTML}
  s.email = %q{james@jameswilding.net}
  s.executables = ["markup", "markup"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "bin/markup"
  ]
  s.homepage = %q{http://github.com/jameswilding/markup}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Command line Markdown-to-HTML conversion}
  s.test_files = [
    "test/markup_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end
