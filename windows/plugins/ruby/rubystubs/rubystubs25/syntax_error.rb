=begin
 This is a machine generated stub using stdlib-doc for <b>class SyntaxError</b>
 Sources used:  ruby-2.5.7
 Created by IntelliJ Ruby Stubs Generator.
=end

# Raised when encountering Ruby code with an invalid syntax.
# 
#    eval("1+1=2")
# 
# <em>raises the exception:</em>
# 
#    SyntaxError: (eval):1: syntax error, unexpected '=', expecting $end
class SyntaxError < ScriptError
    # SyntaxError.new([msg])  -> syntax_error
    # 
    # Construct a SyntaxError exception.
    def initialize(*msg)
        #This is a stub, used for indexing
    end
end
