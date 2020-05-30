=begin
 This is a machine generated stub using stdlib-doc for <b>class KeyError</b>
 Sources used:  ruby-2.5.7
 Created by IntelliJ Ruby Stubs Generator.
=end

# Raised when the specified key is not found. It is a subclass of
# IndexError.
# 
#    h = {"foo" => :bar}
#    h.fetch("foo") #=> :bar
#    h.fetch("baz") #=> KeyError: key not found: "baz"
class KeyError < IndexError
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
