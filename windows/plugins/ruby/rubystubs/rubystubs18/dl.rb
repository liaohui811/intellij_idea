=begin
 This is a machine generated stub using stdlib-doc for <b>module DL</b>
 Sources used:  ruby-1.8.7-p374
 Created by IntelliJ Ruby Stubs Generator.
=end

module DL
    FuncTable = nil #value is unknown, used for indexing.
    RTLD_GLOBAL = nil #value is unknown, used for indexing.
    RTLD_LAZY = nil #value is unknown, used for indexing.
    RTLD_NOW = nil #value is unknown, used for indexing.
    ALIGN_INT = nil #value is unknown, used for indexing.
    ALIGN_LONG = nil #value is unknown, used for indexing.
    ALIGN_FLOAT = nil #value is unknown, used for indexing.
    ALIGN_SHORT = nil #value is unknown, used for indexing.
    ALIGN_DOUBLE = nil #value is unknown, used for indexing.
    ALIGN_VOIDP = nil #value is unknown, used for indexing.
    MAX_ARG = nil #value is unknown, used for indexing.
    DLSTACK = nil #value is unknown, used for indexing.
    FREE = nil #value is unknown, used for indexing.
    def self.dlopen(*args)
        #This is a stub, used for indexing
    end
    def self.callback(p1, p2 = v2)
        #This is a stub, used for indexing
    end
    def self.define_callback(p1, p2 = v2)
        #This is a stub, used for indexing
    end
    def self.remove_callback(p1)
        #This is a stub, used for indexing
    end
    def self.malloc(p1)
        #This is a stub, used for indexing
    end
    def self.strdup(p1)
        #This is a stub, used for indexing
    end
    def self.sizeof(p1)
        #This is a stub, used for indexing
    end
    class DLError < StandardError
    end
    class DLTypeError < DLError
    end
    class Handle
        def initialize(p1, p2 = v2)
            #This is a stub, used for indexing
        end
        def to_i()
            #This is a stub, used for indexing
        end
        def to_ptr()
            #This is a stub, used for indexing
        end
        def close()
            #This is a stub, used for indexing
        end
        def sym(p1, p2 = v2)
            #This is a stub, used for indexing
        end
        def [](p1, p2 = v2)
            #This is a stub, used for indexing
        end
        def disable_close()
            #This is a stub, used for indexing
        end
        def enable_close()
            #This is a stub, used for indexing
        end
    end
    module MemorySpace
        MemoryTable = nil #value is unknown, used for indexing.
        def self.each()
            #This is a stub, used for indexing
        end
    end
    class PtrData
        def self.malloc(p1, p2 = v2)
            #This is a stub, used for indexing
        end
        def initialize(p1, p2 = v2, p3 = v3)
            #This is a stub, used for indexing
        end
        def free=(p1)
            #This is a stub, used for indexing
        end
        def free()
            #This is a stub, used for indexing
        end
        def to_i()
            #This is a stub, used for indexing
        end
        def ptr()
            #This is a stub, used for indexing
        end
        def +@()
            #This is a stub, used for indexing
        end
        def ref()
            #This is a stub, used for indexing
        end
        def -@()
            #This is a stub, used for indexing
        end
        def null?()
            #This is a stub, used for indexing
        end
        def to_a(p1, p2 = v2)
            #This is a stub, used for indexing
        end
        def to_s(p1 = v1)
            #This is a stub, used for indexing
        end
        def to_str(p1 = v1)
            #This is a stub, used for indexing
        end
        def inspect()
            #This is a stub, used for indexing
        end
        def <=>(p1)
            #This is a stub, used for indexing
        end
        def ==(p1)
            #This is a stub, used for indexing
        end
        def eql?(p1)
            #This is a stub, used for indexing
        end
        def +(p1)
            #This is a stub, used for indexing
        end
        def -(p1)
            #This is a stub, used for indexing
        end
        def define_data_type(p1, p2 = v2, *args)
            #This is a stub, used for indexing
        end
        def struct!(*args)
            #This is a stub, used for indexing
        end
        def union!(*args)
            #This is a stub, used for indexing
        end
        def data_type()
            #This is a stub, used for indexing
        end
        def [](p1, p2 = v2)
            #This is a stub, used for indexing
        end
        def []=(p1, p2, p3 = v3)
            #This is a stub, used for indexing
        end
        def size(p1 = v1)
            #This is a stub, used for indexing
        end
        def size=(p1 = v1)
            #This is a stub, used for indexing
        end
    end
    class Symbol
        def self.char2type(p1)
            #This is a stub, used for indexing
        end
        def initialize(p1, p2 = v2, p3 = v3)
            #This is a stub, used for indexing
        end
        # defined(DLSTACK_GUARD)   
        def call(*args)
            #This is a stub, used for indexing
        end
        # defined(DLSTACK_GUARD)   
        def [](*args)
            #This is a stub, used for indexing
        end
        def name()
            #This is a stub, used for indexing
        end
        def proto()
            #This is a stub, used for indexing
        end
        def cproto()
            #This is a stub, used for indexing
        end
        def inspect()
            #This is a stub, used for indexing
        end
        def to_s()
            #This is a stub, used for indexing
        end
        def to_ptr()
            #This is a stub, used for indexing
        end
        def to_i()
            #This is a stub, used for indexing
        end
    end
end
