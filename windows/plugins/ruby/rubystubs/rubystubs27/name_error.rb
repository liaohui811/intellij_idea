=begin
 This is a machine generated stub using stdlib-doc for <b>class NameError</b>
 Sources used:  ruby-2.7.0
 Created by IntelliJ Ruby Stubs Generator.
=end

# Raised when a given name is invalid or undefined.
# 
#    puts foo
# 
# <em>raises the exception:</em>
# 
#    NameError: undefined local variable or method `foo' for main:Object
# 
# Since constant names must start with a capital:
# 
#    Integer.const_set :answer, 42
# 
# <em>raises the exception:</em>
# 
#    NameError: wrong constant name answer
class NameError < StandardError
    # NameError.new(msg=nil, name=nil, receiver: nil)  -> name_error
    # 
    # Construct a new NameError exception. If given the <i>name</i>
    # parameter may subsequently be examined using the NameError#name
    # method. <i>receiver</i> parameter allows to pass object in
    # context of which the error happened. Example:
    # 
    #    [1, 2, 3].method(:rject) # NameError with name "rject" and receiver: Array
    #    [1, 2, 3].singleton_method(:rject) # NameError with name "rject" and receiver: [1, 2, 3]
    def initialize(msg=nil, name=nil, receiver: nil)
        #This is a stub, used for indexing
    end
    # name_error.name    ->  string or nil
    # 
    # Return the name associated with this NameError exception.
    def name()
        #This is a stub, used for indexing
    end
    # name_error.receiver  -> object
    # 
    # Return the receiver associated with this NameError exception.
    def receiver()
        #This is a stub, used for indexing
    end
    # name_error.local_variables  ->  array
    # 
    # Return a list of the local variable names defined where this
    # NameError exception was raised.
    # 
    # Internal use only.
    def local_variables()
        #This is a stub, used for indexing
    end
end
