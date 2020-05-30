=begin
 This is a machine generated stub using stdlib-doc for <b>class SecurityError</b>
 Sources used:  ruby-2.3.8
 Created by IntelliJ Ruby Stubs Generator.
=end

# Raised when attempting a potential unsafe operation, typically when
# the $SAFE level is raised above 0.
# 
#    foo = "bar"
#    proc = Proc.new do
#      $SAFE = 3
#      foo.untaint
#    end
#    proc.call
# 
# <em>raises the exception:</em>
# 
#    SecurityError: Insecure: Insecure operation `untaint' at level 3
class SecurityError < Exception
end
