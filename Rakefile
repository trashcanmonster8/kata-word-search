# frozen_string_literal: true

require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)

RuboCop::RakeTask.new

desc 'Format and test the code'
task :rubospec do
  Rake::Task['rubocop:auto_correct'].execute
  Rake::Task['spec'].execute
end
