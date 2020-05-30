=begin
 This is a machine generated stub using stdlib-doc for <b>class SecurityError</b>
 Sources used:  ruby-2.0.0-p648
 Created by IntelliJ Ruby Stubs Generator.
=end

# Raised when attempting a potential unsafe operation, typically when
# the $SAFE level is raised above 0.
# 
#    foo = "bar"
#    proc = Proc.new do
#      $SAFE = 4
#      foo.gsub! "a", "*"
#    end
#    proc.call
# 
# <em>raises the exception:</em>
# 
#    SecurityError: Insecure: can't modify string
class SecurityError < Exception
end
