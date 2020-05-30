=begin
 This is a machine generated stub using stdlib-doc for <b>class FloatDomainError</b>
 Sources used:  ruby-2.7.0
 Created by IntelliJ Ruby Stubs Generator.
=end

# Raised when attempting to convert special float values (in particular
# +Infinity+ or +NaN+) to numerical classes which don't support them.
# 
#    Float::INFINITY.to_r   #=> FloatDomainError: Infinity
class FloatDomainError < RangeError
end
