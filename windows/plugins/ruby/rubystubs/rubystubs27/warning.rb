=begin
 This is a machine generated stub using stdlib-doc for <b>module Warning</b>
 Sources used:  ruby-2.7.0
 Created by IntelliJ Ruby Stubs Generator.
=end

# The Warning module contains a single method named #warn, and the
# module extends itself, making Warning.warn available.
# Warning.warn is called for all warnings issued by Ruby.
# By default, warnings are printed to $stderr.
# 
# By overriding Warning.warn, you can change how warnings are
# handled by Ruby, either filtering some warnings, and/or outputting
# warnings somewhere other than $stderr.  When Warning.warn is
# overridden, super can be called to get the default behavior of
# printing the warning to $stderr.
module Warning
    # call-seq
    #    Warning[category]  -> true or false
    # 
    # Returns the flag to show the warning messages for +category+.
    # Supported categories are:
    # 
    # +:deprecated+ :: deprecation warnings
    # * assignment of non-nil value to <code>$,</code> and <code>$;</code>
    # * keyword arguments
    # * proc/lambda without block
    # etc.
    # 
    # +:experimental+ :: experimental features
    # * Pattern matching
    def self.[](p1)
        #This is a stub, used for indexing
    end
    # call-seq
    #    Warning[category] = flag -> flag
    # 
    # Sets the warning flags for +category+.
    # See Warning.[] for the categories.
    def self.[]=(p1, p2)
        #This is a stub, used for indexing
    end
    # warn(msg)  -> nil
    # 
    # Writes warning message +msg+ to $stderr. This method is called by
    # Ruby for all emitted warnings.
    def warn(msg)
        #This is a stub, used for indexing
    end
end
