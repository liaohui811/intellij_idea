=begin
 This is a machine generated stub using stdlib-doc for <b>class FrozenError</b>
 Sources used:  ruby-2.6.5
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
end
