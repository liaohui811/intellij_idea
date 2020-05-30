=begin
 This is a machine generated stub using stdlib-doc for <b>module DL</b>
 Sources used:  ruby-1.9.3-p551
 Created by IntelliJ Ruby Stubs Generator.
=end

# A bridge to the dlopen() or dynamic library linker function.
# 
# == Example
# 
#   bash $> cat > sum.c <<EOF
#   double sum(double *arry, int len)
#   {
#           double ret = 0;
#           int i;
#           for(i = 0; i < len; i++){
#                   ret = ret + arry[i];
#           }
#           return ret;
#   }
# 
#   double split(double num)
#   {
#           double ret = 0;
#           ret = num / 2;
#           return ret;
#   }
#   EOF
#   bash $> gcc -o libsum.so -shared sum.c
#   bash $> cat > sum.rb <<EOF
#   require 'dl'
#   require 'dl/import'
# 
#   module LibSum
#           extend DL::Importer
#           dlload './libsum.so'
#           extern 'double sum(double*, int)'
#           extern 'double split(double)'
#   end
# 
#   a = [2.0, 3.0, 4.0]
# 
#   sum = LibSum.sum(a.pack("d*"), a.count)
#   p LibSum.split(sum)
#   EOF
#   bash $> ruby sum.rb
#   4.5
# 
# WIN! :-)
module DL
    # MAX_CALLBACK
    # 
    # Maximum number of callbacks
    MAX_CALLBACK = nil #value is unknown, used for indexing.
    # DLSTACK_SIZE
    # 
    # Dynamic linker stack size
    DLSTACK_SIZE = nil #value is unknown, used for indexing.
    # RTLD_GLOBAL
    # 
    # rtld DL::Handle flag.
    # 
    # The symbols defined by this library will be made available for symbol
    # resolution of subsequently loaded libraries.
    RTLD_GLOBAL = nil #value is unknown, used for indexing.
    # RTLD_LAZY
    # 
    # rtld DL::Handle flag.
    # 
    # Perform lazy binding.  Only resolve symbols as the code that references
    # them is executed.  If the  symbol is never referenced, then it is never
    # resolved.  (Lazy binding is only performed for function references;
    # references to variables are always immediately bound when the library
    # is loaded.)
    RTLD_LAZY = nil #value is unknown, used for indexing.
    # RTLD_NOW
    # 
    # rtld DL::Handle flag.
    # 
    # If this value is specified or the environment variable LD_BIND_NOW is
    # set to a nonempty string, all undefined symbols in the library are
    # resolved before dlopen() returns.  If this cannot be done an error is
    # returned.
    RTLD_NOW = nil #value is unknown, used for indexing.
    # TYPE_VOID
    # 
    # DL::CFunc type - void
    TYPE_VOID = nil #value is unknown, used for indexing.
    # TYPE_VOIDP
    # 
    # DL::CFunc type - void*
    TYPE_VOIDP = nil #value is unknown, used for indexing.
    # TYPE_CHAR
    # 
    # DL::CFunc type - char
    TYPE_CHAR = nil #value is unknown, used for indexing.
    # TYPE_SHORT
    # 
    # DL::CFunc type - short
    TYPE_SHORT = nil #value is unknown, used for indexing.
    # TYPE_INT
    # 
    # DL::CFunc type - int
    TYPE_INT = nil #value is unknown, used for indexing.
    # TYPE_LONG
    # 
    # DL::CFunc type - long
    TYPE_LONG = nil #value is unknown, used for indexing.
    # TYPE_LONG_LONG
    # 
    # DL::CFunc type - long long
    TYPE_LONG_LONG = nil #value is unknown, used for indexing.
    # TYPE_FLOAT
    # 
    # DL::CFunc type - float
    TYPE_FLOAT = nil #value is unknown, used for indexing.
    # TYPE_DOUBLE
    # 
    # DL::CFunc type - double
    TYPE_DOUBLE = nil #value is unknown, used for indexing.
    # ALIGN_VOIDP
    # 
    # The Offset of a struct void* and a void*
    ALIGN_VOIDP = nil #value is unknown, used for indexing.
    # ALIGN_CHAR
    # 
    # The Offset of a struct char and a char
    ALIGN_CHAR = nil #value is unknown, used for indexing.
    # ALIGN_SHORT
    # 
    # The Offset of a struct short and a short
    ALIGN_SHORT = nil #value is unknown, used for indexing.
    # ALIGN_INT
    # 
    # The Offset of a struct int and a int
    ALIGN_INT = nil #value is unknown, used for indexing.
    # ALIGN_LONG
    # 
    # The Offset of a struct long and a long
    ALIGN_LONG = nil #value is unknown, used for indexing.
    # ALIGN_LONG_LONG
    # 
    # The Offset of a struct long long and a long long
    ALIGN_LONG_LONG = nil #value is unknown, used for indexing.
    # ALIGN_FLOAT
    # 
    # The Offset of a struct float and a float
    ALIGN_FLOAT = nil #value is unknown, used for indexing.
    # ALIGN_DOUBLE
    # 
    # The Offset of a struct double and a double
    ALIGN_DOUBLE = nil #value is unknown, used for indexing.
    # SIZEOF_VOIDP
    # 
    # OS Dependent - sizeof(void*)
    SIZEOF_VOIDP = nil #value is unknown, used for indexing.
    # SIZEOF_CHAR
    # 
    # OS Dependent - sizeof(char)
    SIZEOF_CHAR = nil #value is unknown, used for indexing.
    # SIZEOF_SHORT
    # 
    # OS Dependent - sizeof(short)
    SIZEOF_SHORT = nil #value is unknown, used for indexing.
    # SIZEOF_INT
    # 
    # OS Dependent - sizeof(int)
    SIZEOF_INT = nil #value is unknown, used for indexing.
    # SIZEOF_LONG
    # 
    # OS Dependent - sizeof(long)
    SIZEOF_LONG = nil #value is unknown, used for indexing.
    # SIZEOF_LONG_LONG
    # 
    # OS Dependent - sizeof(long long)
    SIZEOF_LONG_LONG = nil #value is unknown, used for indexing.
    # SIZEOF_FLOAT
    # 
    # OS Dependent - sizeof(float)
    SIZEOF_FLOAT = nil #value is unknown, used for indexing.
    # SIZEOF_DOUBLE
    # 
    # OS Dependent - sizeof(double)
    SIZEOF_DOUBLE = nil #value is unknown, used for indexing.
    # RUBY_FREE
    # 
    # Address of the ruby_xfree() function
    RUBY_FREE = nil #value is unknown, used for indexing.
    # BUILD_RUBY_PLATFORM
    # 
    # Platform built against (i.e. "x86_64-linux", etc.)
    # 
    # See also RUBY_PLATFORM
    BUILD_RUBY_PLATFORM = nil #value is unknown, used for indexing.
    # BUILD_RUBY_VERSION
    # 
    # Ruby Version built. (i.e. "1.9.3")
    # 
    # See also RUBY_VERSION
    BUILD_RUBY_VERSION = nil #value is unknown, used for indexing.
    def self.dlwrap(p1)
        #This is a stub, used for indexing
    end
    def self.dlunwrap(p1)
        #This is a stub, used for indexing
    end
    def self.dlopen(*args)
        #This is a stub, used for indexing
    end
    # DL.malloc
    # 
    # Allocate +size+ bytes of memory and return the integer memory address
    # for the allocated memory.
    def self.malloc()
        #This is a stub, used for indexing
    end
    # DL.realloc(addr, size)
    # 
    # Change the size of the memory allocated at the memory location +addr+ to
    # +size+ bytes.  Returns the memory address of the reallocated memory, which
    # may be different than the address passed in.
    def self.realloc(addr, size)
        #This is a stub, used for indexing
    end
    # DL.free(addr)
    # 
    # Free the memory at address +addr+
    def self.free(addr)
        #This is a stub, used for indexing
    end
    # standard dynamic load exception
    class DLError < StandardError
    end
    # dynamic load incorrect type exception
    class DLTypeError < DLError
    end
    # The DL::Handle is the manner to access the dynamic library
    # 
    # == Example
    # 
    # === Setup
    # 
    #   libc_so = "/lib64/libc.so.6"
    #   => "/lib64/libc.so.6"
    #   @handle = DL::Handle.new(libc_so)
    #   => #<DL::Handle:0x00000000d69ef8>
    # 
    # === Setup, with flags
    # 
    #   libc_so = "/lib64/libc.so.6"
    #   => "/lib64/libc.so.6"
    #   @handle = DL::Handle.new(libc_so, DL::RTLD_LAZY | DL::RTLD_GLOBAL)
    #   => #<DL::Handle:0x00000000d69ef8>
    # 
    # === Addresses to symbols
    # 
    #   strcpy_addr = @handle['strcpy']
    #   => 140062278451968
    # 
    # or
    # 
    #   strcpy_addr = @handle.sym('strcpy')
    #   => 140062278451968
    class Handle
        # NEXT
        # 
        # A predefined pseudo-handle of RTLD_NEXT
        # 
        # Which will find the next occurrence of a function in the search order
        # after the current library.
        NEXT = nil #value is unknown, used for indexing.
        # DEFAULT
        # 
        # A predefined pseudo-handle of RTLD_DEFAULT
        # 
        # Which will find the first occurrence of the desired symbol using the
        # default library search order
        DEFAULT = nil #value is unknown, used for indexing.
        # sym(name)
        # 
        # Get the address as an Integer for the function named +name+.
        def self.sym(name)
            #This is a stub, used for indexing
        end
        # sym(name)
        # 
        # Get the address as an Integer for the function named +name+.
        def self.[](p1)
            #This is a stub, used for indexing
        end
        # initialize(lib = nil, flags = DL::RTLD_LAZY | DL::RTLD_GLOBAL)
        # 
        # Create a new handler that opens library named +lib+ with +flags+.  If no
        # library is specified, RTLD_DEFAULT is used.
        def initialize(lib = nil, flags = DL::RTLD_LAZY | DL::RTLD_GLOBAL)
            #This is a stub, used for indexing
        end
        # to_i
        # 
        # Returns the memory address for this handle.
        def to_i()
            #This is a stub, used for indexing
        end
        # close
        # 
        # Close this DL::Handle.  Calling close more than once will raise a
        # DL::DLError exception.
        def close()
            #This is a stub, used for indexing
        end
        # sym(name)
        # 
        # Get the address as an Integer for the function named +name+.
        def sym(name)
            #This is a stub, used for indexing
        end
        # sym(name)
        # 
        # Get the address as an Integer for the function named +name+.
        def [](p1)
            #This is a stub, used for indexing
        end
        # disable_close
        # 
        # Disable a call to dlclose() when this DL::Handle is garbage collected.
        def disable_close()
            #This is a stub, used for indexing
        end
        # enable_close
        # 
        # Enable a call to dlclose() when this DL::Handle is garbage collected.
        def enable_close()
            #This is a stub, used for indexing
        end
        # close_enabled?
        # 
        # Returns +true+ if dlclose() will be called when this DL::Handle is
        # garbage collected.
        def close_enabled?()
            #This is a stub, used for indexing
        end
    end
end
