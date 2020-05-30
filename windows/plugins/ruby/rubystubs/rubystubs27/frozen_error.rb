=begin
 This is a machine generated stub using stdlib-doc for <b>class FrozenError</b>
 Sources used:  ruby-2.7.0
 Created by IntelliJ Ruby Stubs Generator.
=end

# Raised when there is an attempt to modify a frozen object.
# 
#    [1, 2, 3].freeze << 4
# 
# <em>raises the exception:</em>
# 
#    FrozenError: can't modify frozen Array
class FrozenError < RuntimeError
    # FrozenError.new(msg=nil, receiver: nil)  -> frozen_error
    # 
    # Construct a new FrozenError exception. If given the <i>receiver</i>
    # parameter may subsequently be examined using the FrozenError#receiver
    # method.
    # 
    #    a = [].freeze
    #    raise FrozenError.new("can't modify frozen array", receiver: a)
    def initialize(msg=nil, receiver: nil)
        #This is a stub, used for indexing
    end
    # frozen_error.receiver  -> object
    # 
    # Return the receiver associated with this FrozenError exception.
    def receiver()
        #This is a stub, used for indexing
    end
end
