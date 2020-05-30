=begin
 This is a machine generated stub using stdlib-doc for <b>class Ripper</b>
 Sources used:  ruby-2.5.7
 Created by IntelliJ Ruby Stubs Generator.
=end

class Ripper
    # version of Ripper   
    Version = nil #value is unknown, used for indexing.
    # ignore newline, +/- is a sign.   
    EXPR_BEG = nil #value is unknown, used for indexing.
    # newline significant, +/- is an operator.   
    EXPR_END = nil #value is unknown, used for indexing.
    # ditto, and unbound braces.   
    EXPR_ENDARG = nil #value is unknown, used for indexing.
    # ditto, and unbound braces.   
    EXPR_ENDFN = nil #value is unknown, used for indexing.
    # newline significant, +/- is an operator.   
    EXPR_ARG = nil #value is unknown, used for indexing.
    # newline significant, +/- is an operator.   
    EXPR_CMDARG = nil #value is unknown, used for indexing.
    # newline significant, +/- is an operator.   
    EXPR_MID = nil #value is unknown, used for indexing.
    # ignore newline, no reserved words.   
    EXPR_FNAME = nil #value is unknown, used for indexing.
    # ', no reserved words.   
    EXPR_DOT = nil #value is unknown, used for indexing.
    # immediate after `class', no here document.   
    EXPR_CLASS = nil #value is unknown, used for indexing.
    # flag bit, label is allowed.   
    EXPR_LABEL = nil #value is unknown, used for indexing.
    # flag bit, just after a label.   
    EXPR_LABELED = nil #value is unknown, used for indexing.
    # symbol literal as FNAME.   
    EXPR_FITEM = nil #value is unknown, used for indexing.
    # equals to +EXPR_BEG+   
    EXPR_VALUE = nil #value is unknown, used for indexing.
    # equals to <tt>(EXPR_BEG | EXPR_MID | EXPR_CLASS)</tt>   
    EXPR_BEG_ANY = nil #value is unknown, used for indexing.
    # equals to <tt>(EXPR_ARG | EXPR_CMDARG)</tt>   
    EXPR_ARG_ANY = nil #value is unknown, used for indexing.
    # equals to <tt>(EXPR_END | EXPR_ENDARG | EXPR_ENDFN)</tt>   
    EXPR_END_ANY = nil #value is unknown, used for indexing.
    # Ripper.new(src, filename="(ripper)", lineno=1) -> ripper
    # 
    # Create a new Ripper object.
    # _src_ must be a String, an IO, or an Object which has #gets method.
    # 
    # This method does not starts parsing.
    # See also Ripper#parse and Ripper.parse.
    def initialize(p1, p2 = v2, p3 = v3)
        #This is a stub, used for indexing
    end
    # ripper.parse
    # 
    # Start parsing and returns the value of the root action.
    def parse()
        #This is a stub, used for indexing
    end
    # ripper.column   -> Integer
    # 
    # Return column number of current parsing line.
    # This number starts from 0.
    def column()
        #This is a stub, used for indexing
    end
    # ripper.filename   -> String
    # 
    # Return current parsing filename.
    def filename()
        #This is a stub, used for indexing
    end
    # ripper.lineno   -> Integer
    # 
    # Return line number of current parsing line.
    # This number starts from 1.
    def lineno()
        #This is a stub, used for indexing
    end
    # ripper.state   -> Integer
    # 
    # Return scanner state of current token.
    def state()
        #This is a stub, used for indexing
    end
    # ripper.end_seen?   -> Boolean
    # 
    # Return true if parsed source ended by +\_\_END\_\_+.
    def end_seen?()
        #This is a stub, used for indexing
    end
    # ripper.encoding   -> encoding
    # 
    # Return encoding of the source.
    def encoding()
        #This is a stub, used for indexing
    end
    # ripper.yydebug   -> true or false
    # 
    # Get yydebug.
    def yydebug()
        #This is a stub, used for indexing
    end
    # ripper.yydebug = flag
    # 
    # Set yydebug.
    def yydebug= flag
        #This is a stub, used for indexing
    end
    # ripper.error?   -> Boolean
    # 
    # Return true if parsed source has errors.
    def error?()
        #This is a stub, used for indexing
    end
    def self.dedent_string(p1, p2)
        #This is a stub, used for indexing
    end
    def self.lex_state_name(p1)
        #This is a stub, used for indexing
    end

    private

    def dedent_string(p1, p2)
        #This is a stub, used for indexing
    end
end
