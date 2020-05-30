This scripts are used to generate stubs for ruby built-in classes and modules

settings.rb - settings file, where you can define global variables used in generation process
gen_stubs.rb - run it to generate stubs files for all built-in modules and classes

stubs_test.rb - file to test stubs content.

Prefered way to update stubs:
ruby ./gen_all.rb
This script will download required ruby versions from https://ftp.ruby-lang.org/pub/ruby/ unzip them and regenerate stubs.

If you need to regenerate stubs manually then use gen_stubs.rb, example:
ruby ./gen_stubs.rb  --source-directory=/Users/user/Downloads/ruby-2.2.0-preview2/ -b -v -s "Ruby 2.2.0-preview2" --output-directory /tmp/rubystubs
