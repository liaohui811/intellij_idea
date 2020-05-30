=begin
 This is a machine generated stub using stdlib-doc for <b>class SystemCallError</b>
 Sources used:  ruby-2.7.0
 Created by IntelliJ Ruby Stubs Generator.
=end

# SystemCallError is the base class for all low-level
# platform-dependent errors.
# 
# The errors available on the current platform are subclasses of
# SystemCallError and are defined in the Errno module.
# 
#    File.open("does/not/exist")
# 
# <em>raises the exception:</em>
# 
#    Errno::ENOENT: No such file or directory - does/not/exist
class SystemCallError < StandardError
    # SystemCallError.new(msg, errno)  -> system_call_error_subclass
    # 
    # If _errno_ corresponds to a known system error code, constructs the
    # appropriate Errno class for that error, otherwise constructs a
    # generic SystemCallError object. The error number is subsequently
    # available via the #errno method.
    def initialize(msg, errno)
        #This is a stub, used for indexing
    end
    # system_call_error.errno   -> integer
    # 
    # Return this SystemCallError's error number.
    def errno()
        #This is a stub, used for indexing
    end
    # system_call_error === other  -> true or false
    # 
    # Return +true+ if the receiver is a generic +SystemCallError+, or
    # if the error numbers +self+ and _other_ are the same.
    def self.=== other
        #This is a stub, used for indexing
    end
end
