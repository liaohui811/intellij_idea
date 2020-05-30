require 'rubygems'

# RUBY-17641 - build rbenv gemsets GEM_PATH before simplecov initialization
def check_rbenv_gemset
  `rbenv which gem`.strip == $0
rescue
  false
end

unless check_rbenv_gemset
  require 'simplecov'

  SimpleCov.at_exit do
    # getting result will trigger ResultMerger to store results
    # if merging is not disabled
    SimpleCov.result
  end

# trick SimpleCov::ResultMerger into using provided output file
  module SimpleCov::ResultMerger
    def self.resultset_path
      ENV['RUBYMINE_SIMPLECOV_COVERAGE_PATH']
    end
  end
  SimpleCov.track_files "#{Dir.getwd}/**/*.rb" # include "0% covered" files into coverage report
  SimpleCov.project_name ENV['RUBYMINE_SIMPLECOV_RUN_CONFIGURATION']
  SimpleCov.command_name "#{SimpleCov.project_name}:#{Process.pid.to_s}"
  SimpleCov.use_merging ENV['RUBYMINE_SIMPLECOV_MERGING'] != 'false'

  pattern = ""
  i = 0
  patterns = []
  while pattern do
    pattern = ENV["RUBYMINE_SIMPLECOV_EXCLUDE_#{i}"]
    if pattern
      pattern = pattern.strip
      if pattern[0] == "/" && pattern[-1] == "/"
        patterns << pattern[1..-2]
      else
        patterns << pattern
      end
    end
    i += 1
  end

  patterns.each do |pattern|
    SimpleCov.add_filter pattern
  end

  SimpleCov.start
end