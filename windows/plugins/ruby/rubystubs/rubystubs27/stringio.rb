=begin
 This is a machine generated stub using stdlib-doc for <b>class StringIO</b>
 Sources used:  ruby-2.7.0
 Created by IntelliJ Ruby Stubs Generator.
=end

require 'generic_readable'
require 'generic_writable'
# Pseudo I/O on String object, with interface corresponding to IO.
# 
# Commonly used to simulate <code>$stdio</code> or <code>$stderr</code>
# 
# === Examples
# 
#   require 'stringio'
# 
#   # Writing stream emulation
#   io = StringIO.new
#   io.puts "Hello World"
#   io.string #=> "Hello World\n"
# 
#   # Reading stream emulation
#   io = StringIO.new "first\nsecond\nlast\n"
#   io.getc #=> "f"
#   io.gets #=> "irst\n"
#   io.read #=> "second\nlast\n"
class StringIO < Data
    include Enumerable
    include IO::generic_readable
    include IO::generic_writable
    VERSION = nil #value is unknown, used for indexing.
    # StringIO.open(string=""[, mode]) {|strio| ...}
    # 
    # Equivalent to StringIO.new except that when it is called with a block, it
    # yields with the new instance and closes it, and returns the result which
    # returned from the block.
    def self.open(string="", *mode)
        #This is a stub, used for indexing
    end
    # StringIO.new(string=""[, mode])
    # 
    # Creates new StringIO instance from with _string_ and _mode_.
    def initialize(*args)
        #This is a stub, used for indexing
    end
    # strio.reopen(other_StrIO)     -> strio
    # strio.reopen(string, mode)    -> strio
    # 
    # Reinitializes the stream with the given <i>other_StrIO</i> or _string_
    # and _mode_ (see StringIO#new).
    def reopen(*several_variants)
        #This is a stub, used for indexing
    end
    # strio.string     -> string
    # 
    # Returns underlying String object, the subject of IO.
    def string()
        #This is a stub, used for indexing
    end
    # strio.string = string  -> string
    # 
    # Changes underlying String object, the subject of IO.
    def string= string
        #This is a stub, used for indexing
    end
    # strio.lineno    -> integer
    # 
    # Returns the current line number. The stream must be
    # opened for reading. +lineno+ counts the number of times  +gets+ is
    # called, rather than the number of newlines  encountered. The two
    # values will differ if +gets+ is  called with a separator other than
    # newline.  See also the  <code>$.</code> variable.
    def lineno()
        #This is a stub, used for indexing
    end
    # strio.lineno = integer    -> integer
    # 
    # Manually sets the current line number to the given value.
    # <code>$.</code> is updated only on the next read.
    def lineno= integer
        #This is a stub, used for indexing
    end
    # strio.binmode    -> stringio
    # 
    # Puts stream into binary mode. See IO#binmode.
    def binmode()
        #This is a stub, used for indexing
    end
    # strio.close  -> nil
    # 
    # Closes a StringIO. The stream is unavailable for any further data
    # operations; an +IOError+ is raised if such an attempt is made.
    def close()
        #This is a stub, used for indexing
    end
    # strio.close_read    -> nil
    # 
    # Closes the read end of a StringIO.  Will raise an +IOError+ if the
    # receiver is not readable.
    def close_read()
        #This is a stub, used for indexing
    end
    # strio.close_write    -> nil
    # 
    # Closes the write end of a StringIO.  Will raise an  +IOError+ if the
    # receiver is not writeable.
    def close_write()
        #This is a stub, used for indexing
    end
    # strio.closed?    -> true or false
    # 
    # Returns +true+ if the stream is completely closed, +false+ otherwise.
    def closed?()
        #This is a stub, used for indexing
    end
    # strio.closed_read?    -> true or false
    # 
    # Returns +true+ if the stream is not readable, +false+ otherwise.
    def closed_read?()
        #This is a stub, used for indexing
    end
    # strio.closed_write?    -> true or false
    # 
    # Returns +true+ if the stream is not writable, +false+ otherwise.
    def closed_write?()
        #This is a stub, used for indexing
    end
    # strio.eof     -> true or false
    # strio.eof?    -> true or false
    # 
    # Returns true if the stream is at the end of the data (underlying string).
    # The stream must be opened for reading or an +IOError+ will be raised.
    def eof()
        #This is a stub, used for indexing
    end
    # strio.eof?    -> true or false
    # 
    # Returns true if the stream is at the end of the data (underlying string).
    # The stream must be opened for reading or an +IOError+ will be raised.
    def eof?()
        #This is a stub, used for indexing
    end
    # Raises NotImplementedError.
    def fcntl(*args)
        #This is a stub, used for indexing
    end
    # Returns an object itself.  Just for compatibility to IO.
    def flush()
        #This is a stub, used for indexing
    end
    # Returns 0.  Just for compatibility to IO.
    def fsync()
        #This is a stub, used for indexing
    end
    # strio.pos     -> integer
    # strio.tell    -> integer
    # 
    # Returns the current offset (in bytes).
    def pos()
        #This is a stub, used for indexing
    end
    # strio.pos = integer    -> integer
    # 
    # Seeks to the given position (in bytes).
    def pos= integer
        #This is a stub, used for indexing
    end
    # strio.rewind    -> 0
    # 
    # Positions the stream to the beginning of input, resetting
    # +lineno+ to zero.
    def rewind()
        #This is a stub, used for indexing
    end
    # strio.seek(amount, whence=SEEK_SET) -> 0
    # 
    # Seeks to a given offset _amount_ in the stream according to
    # the value of _whence_ (see IO#seek).
    def seek(amount, whence=SEEK_SET)
        #This is a stub, used for indexing
    end
    # strio.sync    -> true
    # 
    # Returns +true+ always.
    def sync()
        #This is a stub, used for indexing
    end
    # Returns the argument unchanged.  Just for compatibility to IO.
    def sync=(p1)
        #This is a stub, used for indexing
    end
    # strio.pos     -> integer
    # strio.tell    -> integer
    # 
    # Returns the current offset (in bytes).
    def tell()
        #This is a stub, used for indexing
    end
    # strio.each(sep=$/, chomp: false) {|line| block }         -> strio
    # strio.each(limit, chomp: false) {|line| block }          -> strio
    # strio.each(sep, limit, chomp: false) {|line| block }     -> strio
    # strio.each(...)                                          -> anEnumerator
    # strio.each_line(sep=$/, chomp: false) {|line| block }     -> strio
    # strio.each_line(limit, chomp: false) {|line| block }      -> strio
    # strio.each_line(sep, limit, chomp: false) {|line| block } -> strio
    # strio.each_line(...)                                      -> anEnumerator
    # 
    # See IO#each.
    def each(*several_variants)
        #This is a stub, used for indexing
    end
    # strio.each_line(sep=$/, chomp: false) {|line| block }     -> strio
    # strio.each_line(limit, chomp: false) {|line| block }      -> strio
    # strio.each_line(sep, limit, chomp: false) {|line| block } -> strio
    # strio.each_line(...)                                      -> anEnumerator
    # 
    # See IO#each.
    def each_line(*several_variants)
        #This is a stub, used for indexing
    end
    # This is a deprecated alias for #each_line.
    def lines(*args)
        #This is a stub, used for indexing
    end
    # strio.each_byte {|byte| block }  -> strio
    # strio.each_byte                  -> anEnumerator
    # 
    # See IO#each_byte.
    def each_byte(*several_variants)
        #This is a stub, used for indexing
    end
    # This is a deprecated alias for #each_byte.
    def bytes()
        #This is a stub, used for indexing
    end
    # strio.each_char {|char| block }  -> strio
    # strio.each_char                  -> anEnumerator
    # 
    # See IO#each_char.
    def each_char(*several_variants)
        #This is a stub, used for indexing
    end
    # This is a deprecated alias for #each_char.
    def chars()
        #This is a stub, used for indexing
    end
    # strio.each_codepoint {|c| block }  -> strio
    # strio.each_codepoint               -> anEnumerator
    # 
    # See IO#each_codepoint.
    def each_codepoint(*several_variants)
        #This is a stub, used for indexing
    end
    # This is a deprecated alias for #each_codepoint.
    def codepoints()
        #This is a stub, used for indexing
    end
    # strio.getc   -> string or nil
    # 
    # See IO#getc.
    def getc()
        #This is a stub, used for indexing
    end
    # strio.ungetc(string)   -> nil
    # 
    # Pushes back one character (passed as a parameter)
    # such that a subsequent buffered read will return it.  There is no
    # limitation for multiple pushbacks including pushing back behind the
    # beginning of the buffer string.
    def ungetc(string)
        #This is a stub, used for indexing
    end
    # strio.ungetbyte(fixnum)   -> nil
    # 
    # See IO#ungetbyte
    def ungetbyte(fixnum)
        #This is a stub, used for indexing
    end
    # strio.getbyte   -> fixnum or nil
    # 
    # See IO#getbyte.
    def getbyte()
        #This is a stub, used for indexing
    end
    # strio.gets(sep=$/, chomp: false)     -> string or nil
    # strio.gets(limit, chomp: false)      -> string or nil
    # strio.gets(sep, limit, chomp: false) -> string or nil
    # 
    # See IO#gets.
    def gets(*several_variants)
        #This is a stub, used for indexing
    end
    # strio.readlines(sep=$/, chomp: false)     ->   array
    # strio.readlines(limit, chomp: false)      ->   array
    # strio.readlines(sep, limit, chomp: false) ->   array
    # 
    # See IO#readlines.
    def readlines(*several_variants)
        #This is a stub, used for indexing
    end
    # strio.read([length [, outbuf]])    -> string, outbuf, or nil
    # 
    # See IO#read.
    def read(*args)
        #This is a stub, used for indexing
    end
    # strio.write(string, ...) -> integer
    # strio.syswrite(string)   -> integer
    # 
    # Appends the given string to the underlying buffer string.
    # The stream must be opened for writing.  If the argument is not a
    # string, it will be converted to a string using <code>to_s</code>.
    # Returns the number of bytes written.  See IO#write.
    def write(string, *smth)
        #This is a stub, used for indexing
    end
    # strio.putc(obj)    -> obj
    # 
    # See IO#putc.
    def putc(obj)
        #This is a stub, used for indexing
    end
    # Returns +false+.  Just for compatibility to IO.
    def isatty()
        #This is a stub, used for indexing
    end
    # Returns +false+.  Just for compatibility to IO.
    def tty?()
        #This is a stub, used for indexing
    end
    # Returns +nil+.  Just for compatibility to IO.
    def pid()
        #This is a stub, used for indexing
    end
    # Returns +nil+.  Just for compatibility to IO.
    def fileno()
        #This is a stub, used for indexing
    end
    # strio.size   -> integer
    # 
    # Returns the size of the buffer string.
    def size()
        #This is a stub, used for indexing
    end
    # strio.length -> integer
    # 
    # Returns the size of the buffer string.
    def length()
        #This is a stub, used for indexing
    end
    # strio.truncate(integer)    -> 0
    # 
    # Truncates the buffer string to at most _integer_ bytes. The stream
    # must be opened for writing.
    def truncate(integer)
        #This is a stub, used for indexing
    end
    # strio.external_encoding   => encoding
    # 
    # Returns the Encoding object that represents the encoding of the file.
    # If the stream is write mode and no encoding is specified, returns
    # +nil+.
    def external_encoding()
        #This is a stub, used for indexing
    end
    # strio.internal_encoding   => encoding
    # 
    # Returns the Encoding of the internal string if conversion is
    # specified.  Otherwise returns +nil+.
    def internal_encoding()
        #This is a stub, used for indexing
    end
    # strio.set_encoding(ext_enc, [int_enc[, opt]])  => strio
    # 
    # Specify the encoding of the StringIO as <i>ext_enc</i>.
    # Use the default external encoding if <i>ext_enc</i> is nil.
    # 2nd argument <i>int_enc</i> and optional hash <i>opt</i> argument
    # are ignored; they are for API compatibility to IO.
    def set_encoding(p1, p2 = v2, p3 = {})
        #This is a stub, used for indexing
    end
    def set_encoding_by_bom()
        #This is a stub, used for indexing
    end
end
