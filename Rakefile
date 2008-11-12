require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('ansi', '1.0.1') do |p|
  p.description = 'Use ANSI codes in printed output, including colors and controlling the cursor, clearing the line, and clearing the screen.'
  p.url = 'http://github.com/ssoroka/ansi'
  p.author = 'Steven Soroka'
  p.email = 'ssoroka78@gmail.com'
  p.ignore_pattern = ["tmp/*", 'script/**']
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each{|f| load f }