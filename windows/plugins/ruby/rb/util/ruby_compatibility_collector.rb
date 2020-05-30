#
# script for gem ruby_version_requirement collector. See: org.jetbrains.plugins.ruby.gem.gem.GemCompatibilityUtil
#

almost_default = Gem::Requirement.new '> 0.0.0'
specs_file_name = 'specs.4.8.gz'
unless File.exist? specs_file_name
  specs_file_url = "https://api.rubygems.org/#{specs_file_name}"
  puts "Downloading #{specs_file_url}"
  `curl #{specs_file_url} > #{specs_file_name}`
end


gems = Marshal.load(Gem::Util.gunzip(File.read(specs_file_name)))

Dir.mkdir 'specs' unless Dir.exist? 'specs'

constraints = {}
%w[ bundler rake rails rubocop standard puppet rubygems-update parallel rainbow sprockets i18n nokogiri nio4r minitest rack rspec cucumber
    activesupport simplecov simplecov-html
].each do |gem_name|
  constraints[gem_name] = Hash.new { |hash, key| hash[key] = {max: -1} }
end

gems.each do |gem|
  gem_name = gem[0]
  gem_constraints = constraints[gem_name]
  if gem_constraints.nil?
    next
  end

  gem_version = gem[1].version
  base_name = "#{gem_name}-#{gem_version}"
  spec_file_name = "#{base_name}.gemspec.rz"
  local_spec_path = "specs/#{spec_file_name}"

  unless File.exist? local_spec_path
    file_url = "https://api.rubygems.org/quick/Marshal.4.8/#{spec_file_name}"
    puts "Downloading #{file_url}..."
    `curl #{file_url} > #{local_spec_path}`
  end

  puts "Loading #{local_spec_path}..."
  begin
    spec = Marshal.load(Gem::Util.inflate(File.read(local_spec_path)))
    required_version = spec.required_ruby_version
    if required_version == almost_default
      required_version = Gem::Requirement.default
    end
    gem_constraints["#{required_version}"][:max] = gem_version
  rescue
    puts "Something went wrong..."
  end
end

constraints.select { |_, gem_constraints| gem_constraints.size != 0 }.each do |gem_name, gem_constraints|
  gem_constraints.each do |ruby_restriction, versions_range|
    op_and_version = Gem::Requirement.parse ruby_restriction
    puts "CONSTRAINTS.putValue(\"#{gem_name}\", new Constraint(\"#{op_and_version[0]}\", \"#{op_and_version[1]}\", \"#{versions_range[:max]}\"));"
  end
end