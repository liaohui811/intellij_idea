# author oleg

rdoc_version = if RUBY_VERSION < '2.3.0'
                   '3.9.4'
                 else
                   '6.0.2'
                 end

$:.unshift(File.expand_path("./gems/gems/rdoc-#{rdoc_version}/lib", File.dirname(__FILE__)))

def debug_print(line)
  puts line if $GEN_DEBUG
end

$: << File.dirname(__FILE__)
require 'gen_main_file'
require 'our_rdoc'

debug_print "Using RDOC #{RDoc::VERSION}"
rdoc = RDoc::RDoc.new

dirs = %W(#{$RUBY_SOURCE_DIR})
dirs.map! {|dir| File.expand_path(dir)}

rdoc.document(dirs)


if $RUBY_STUB_TEST
  puts '--STUBS CONTENT START--' 

  stub_files = Dir.entries("#{$DIRECTORY}").sort

  stub_files.each do |file_path|
    begin
      next if file_path[0] == '.'
      puts "--#{file_path}--"
      file = File.open("#{$DIRECTORY}" + file_path, "rb")
      puts file.read
    rescue => bt
      puts bt
    end
  end


end