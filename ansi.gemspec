Gem::Specification.new do |s|
  s.name = %q{ansi}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steven Soroka"]
  s.date = %q{2008-11-12}
  s.description = %q{Use ANSI codes in printed output, including colors and controlling the cursor, clearing the line, and clearing the screen.}
  s.email = %q{ssoroka78@gmail.com}
  s.extra_rdoc_files = ["lib/ansi.rb", "README.rdoc"]
  s.files = ["ansi.gemspec", "init.rb", "lib/ansi.rb", "Manifest", "Rakefile", "README.rdoc", "test/ansi_test.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/ssoroka/ansi}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Ansi", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ansi}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Use ANSI codes in printed output, including colors and controlling the cursor, clearing the line, and clearing the screen.}
  s.test_files = ["test/ansi_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
    else
    end
  else
  end
end
