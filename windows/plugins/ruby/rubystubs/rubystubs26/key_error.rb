=begin
 This is a machine generated stub using stdlib-doc for <b>class KeyError</b>
 Sources used:  ruby-2.6.5
 Created by IntelliJ Ruby Stubs Generator.
=end

# Raised when the specified key is not found. It is a subclass of
# IndexError.
# 
#    h = {"foo" => :bar}
#    h.fetch("foo") #=> :bar
#    h.fetch("baz") #=> KeyError: key not found: "baz"
class KeyError < IndexError
    # KeyError.new(message=nil, receiver: nil, key: nil) -> key_error
    # 
    # Construct a new +KeyError+ exception with the given message,
    # receiver and key.
    def initialize(message=nil, receiver: nil, key: nil)
        #This is a stub, used for indexing
    end
    # key_error.receiver  -> object
    # 
    # Return the receiver associated with this KeyError exception.
    def receiver()
        #This is a stub, used for indexing
    end
    # key_error.key  -> object
    # 
    # Return the key caused this KeyError exception.
    def key()
        #This is a stub, used for indexing
    end
end
