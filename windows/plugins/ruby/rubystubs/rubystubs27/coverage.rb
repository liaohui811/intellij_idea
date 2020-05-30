=begin
 This is a machine generated stub using stdlib-doc for <b>module Coverage</b>
 Sources used:  ruby-2.7.0
 Created by IntelliJ Ruby Stubs Generator.
=end

# Coverage provides coverage measurement feature for Ruby.
# This feature is experimental, so these APIs may be changed in future.
# 
# = Usage
# 
# 1. require "coverage"
# 2. do Coverage.start
# 3. require or load Ruby source file
# 4. Coverage.result will return a hash that contains filename as key and
#    coverage array as value. A coverage array gives, for each line, the
#    number of line execution by the interpreter. A +nil+ value means
#    coverage is disabled for this line (lines like +else+ and +end+).
# 
# = Example
# 
#   [foo.rb]
#   s = 0
#   10.times do |x|
#     s += x
#   end
# 
#   if s == 45
#     p :ok
#   else
#     p :ng
#   end
#   [EOF]
# 
#   require "coverage"
#   Coverage.start
#   require "foo.rb"
#   p Coverage.result  #=> {"foo.rb"=>[1, 1, 10, nil, nil, 1, 1, nil, 0, nil]}
module Coverage
    # Coverage.start  => nil
    # 
    # Enables coverage measurement.
    def self.start()
        #This is a stub, used for indexing
    end
    # Coverage.result(stop: true, clear: true)  => hash
    # 
    # Returns a hash that contains filename as key and coverage array as value.
    # If +clear+ is true, it clears the counters to zero.
    # If +stop+ is true, it disables coverage measurement.
    def self.result(stop: true, clear: true)
        #This is a stub, used for indexing
    end
    # Coverage.peek_result  => hash
    # 
    # Returns a hash that contains filename as key and coverage array as value.
    # This is the same as `Coverage.result(stop: false, clear: false)`.
    # 
    #   {
    #     "file.rb" => [1, 2, nil],
    #     ...
    #   }
    def self.peek_result()
        #This is a stub, used for indexing
    end
    # Coverage.running?  => bool
    # 
    # Returns true if coverage stats are currently being collected (after
    # Coverage.start call, but before Coverage.result call)
    def self.running?()
        #This is a stub, used for indexing
    end
end
