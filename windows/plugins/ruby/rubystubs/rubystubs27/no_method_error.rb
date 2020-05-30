=begin
 This is a machine generated stub using stdlib-doc for <b>class NoMethodError</b>
 Sources used:  ruby-2.7.0
 Created by IntelliJ Ruby Stubs Generator.
=end

# Raised when a method is called on a receiver which doesn't have it
# defined and also fails to respond with +method_missing+.
# 
#    "hello".to_ary
# 
# <em>raises the exception:</em>
# 
#    NoMethodError: undefined method `to_ary' for "hello":String
class NoMethodError < NameError
    # NoMethodError.new(msg=nil, name=nil, args=nil, private=false, receiver: nil)  -> no_method_error
    # 
    # Construct a NoMethodError exception for a method of the given name
    # called with the given arguments. The name may be accessed using
    # the <code>#name</code> method on the resulting object, and the
    # arguments using the <code>#args</code> method.
    # 
    # If <i>private</i> argument were passed, it designates method was
    # attempted to call in private context, and can be accessed with
    # <code>#private_call?</code> method.
    # 
    # <i>receiver</i> argument stores an object whose method was called.
    def initialize(msg=nil, name=nil, args=nil, private=false, receiver: nil)
        #This is a stub, used for indexing
    end
    # no_method_error.args  -> obj
    # 
    # Return the arguments passed in as the third parameter to
    # the constructor.
    def args()
        #This is a stub, used for indexing
    end
    # no_method_error.private_call?  -> true or false
    # 
    # Return true if the caused method was called as private.
    def private_call?()
        #This is a stub, used for indexing
    end
end
