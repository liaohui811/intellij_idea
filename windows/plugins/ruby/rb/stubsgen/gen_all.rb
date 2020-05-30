require 'tmpdir'
require 'open3'

URL = 'https://ftp.ruby-lang.org/pub/ruby'
SCRIPT_PATH = File.expand_path File.dirname(__FILE__)

# Since 2.6 there is no more `-stable` in root directory and you need to specify the exact
# version (e.g., 2.6.5) and look in the subdirectory. See https://ftp.ruby-lang.org/pub/ruby/
RUBY_VERSIONS = %w(1.8.7-p374 1.9-stable 2.0-stable 2.1-stable 2.2-stable 2.3-stable 2.4-stable 2.5-stable 2.6.5 2.7.0)

def download_ruby_version(version)
  version =~ /^(\d\.\d)/;
  filename = "ruby-#{version}.tar.bz2"
  if filename.include? 'stable'
    # stable releases are located in the root directory
    source = "#{URL}/#{filename}"
  else
    source = "#{URL}/#{$1}/#{filename}"
  end
  $stderr.puts "Downloading: #{source} => #{filename}"
  p `curl -sSL #{source} -o #{filename}` unless File.file?(filename)
  filename
end


RubyDownloads = "#{Dir.tmpdir()}/rubies-downloads"
RubyReleases = "#{Dir.tmpdir()}/rubies-releases"
RubyStubs = "#{SCRIPT_PATH}/../../../rubystubs"

FileUtils.rm_rf(RubyDownloads) if File.directory?(RubyDownloads)
FileUtils.rm_rf(RubyReleases) if File.directory?(RubyReleases)

Dir.mkdir(RubyDownloads)
Dir.mkdir(RubyReleases)
Dir.mkdir(RubyStubs) unless File.directory?(RubyStubs)

Dir.chdir(RubyDownloads)
RUBY_VERSIONS.each do |version|
  $stderr.puts "Downloading #{version}"
  filename = download_ruby_version(version)
  $stderr.puts "Extracting #{version}"
  `tar -xf #{filename} -C "#{RubyReleases}"`
end

Dir.chdir(RubyReleases)
Dir["*"].each do |dir|
  dir =~ /ruby-(\d+)\.(\d+)\..+/
  rubystubs_dir = "rubystubs#{$1}#{$2}"
  $stderr.puts "Regenerating stubs in #{RubyStubs}/#{rubystubs_dir}"
  `rm -rf #{dir}/spec`
  stdout, stderr, status = Open3.capture3("ruby #{SCRIPT_PATH}/gen_stubs.rb  --source-directory=#{dir} -b -v -s #{dir} --output-directory #{RubyStubs}/#{rubystubs_dir}")
  if status != 0
    $stderr.puts "EXIT CODE #{status}"
    $stderr.puts "Stdout: #{stdout}\nStderr: #{stderr}"
    next
  end
end
