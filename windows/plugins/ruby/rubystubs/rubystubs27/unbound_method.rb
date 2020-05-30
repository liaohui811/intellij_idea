=begin
 This is a machine generated stub using stdlib-doc for <b>class UnboundMethod</b>
 Sources used:  ruby-2.7.0
 Created by IntelliJ Ruby Stubs Generator.
=end

# Ruby supports two forms of objectified methods. Class Method is
# used to represent methods that are associated with a particular
# object: these method objects are bound to that object. Bound
# method objects for an object can be created using Object#method.
# 
# Ruby also supports unbound methods; methods objects that are not
# associated with a particular object. These can be created either
# by calling Module#instance_method or by calling #unbind on a bound
# method object. The result of both of these is an UnboundMethod
# object.
# 
# Unbound methods can only be called after they are bound to an
# object. That object must be a kind_of? the method's original
# class.
# 
#    class Square
#      def area
#        @side * @side
#      end
#      def initialize(side)
#        @side = side
#      end
#    end
# 
#    area_un = Square.instance_method(:area)
# 
#    s = Square.new(12)
#    area = area_un.bind(s)
#    area.call   #=> 144
# 
# Unbound methods are a reference to the method at the time it was
# objectified: subsequent changes to the underlying class will not
# affect the unbound method.
# 
#    class Test
#      def test
#        :original
#      end
#    end
#    um = Test.instance_method(:test)
#    class Test
#      def test
#        :modified
#      end
#    end
#    t = Test.new
#    t.test            #=> :modified
#    um.bind(t).call   #=> :original
class UnboundMethod
    # meth == other_meth  -> true or false
    # 
    # Two method objects are equal if they are bound to the same
    # object and refer to the same method definition and their owners are the
    # same class or module.
    def == other_meth
        #This is a stub, used for indexing
    end
    # meth.eql?(other_meth)  -> true or false
    # 
    # Two method objects are equal if they are bound to the same
    # object and refer to the same method definition and their owners are the
    # same class or module.
    def eql?(other_meth)
        #This is a stub, used for indexing
    end
    # meth.hash   -> integer
    # 
    # Returns a hash value corresponding to the method object.
    # 
    # See also Object#hash.
    def hash()
        #This is a stub, used for indexing
    end
    # method.clone -> new_method
    # 
    # Returns a clone of this method.
    # 
    #   class A
    #     def foo
    #       return "bar"
    #     end
    #   end
    # 
    #   m = A.new.method(:foo)
    #   m.call # => "bar"
    #   n = m.clone.call # => "bar"
    def clone()
        #This is a stub, used for indexing
    end
    # meth.arity    -> integer
    # 
    # Returns an indication of the number of arguments accepted by a
    # method. Returns a nonnegative integer for methods that take a fixed
    # number of arguments. For Ruby methods that take a variable number of
    # arguments, returns -n-1, where n is the number of required arguments.
    # Keyword arguments will be considered as a single additional argument,
    # that argument being mandatory if any keyword argument is mandatory.
    # For methods written in C, returns -1 if the call takes a
    # variable number of arguments.
    # 
    #    class C
    #      def one;    end
    #      def two(a); end
    #      def three(*a);  end
    #      def four(a, b); end
    #      def five(a, b, *c);    end
    #      def six(a, b, *c, &d); end
    #      def seven(a, b, x:0); end
    #      def eight(x:, y:); end
    #      def nine(x:, y:, **z); end
    #      def ten(*a, x:, y:); end
    #    end
    #    c = C.new
    #    c.method(:one).arity     #=> 0
    #    c.method(:two).arity     #=> 1
    #    c.method(:three).arity   #=> -1
    #    c.method(:four).arity    #=> 2
    #    c.method(:five).arity    #=> -3
    #    c.method(:six).arity     #=> -3
    #    c.method(:seven).arity   #=> -3
    #    c.method(:eight).arity   #=> 1
    #    c.method(:nine).arity    #=> 1
    #    c.method(:ten).arity     #=> -2
    # 
    #    "cat".method(:size).arity      #=> 0
    #    "cat".method(:replace).arity   #=> 1
    #    "cat".method(:squeeze).arity   #=> -1
    #    "cat".method(:count).arity     #=> -1
    def arity()
        #This is a stub, used for indexing
    end
    # meth.inspect   ->  string
    # 
    # Returns a human-readable description of the underlying method.
    # 
    #   "cat".method(:count).inspect   #=> "#<Method: String#count(*)>"
    #   (1..3).method(:map).inspect    #=> "#<Method: Range(Enumerable)#map()>"
    # 
    # In the latter case, the method description includes the "owner" of the
    # original method (+Enumerable+ module, which is included into +Range+).
    # 
    # +inspect+ also provides, when possible, method argument names (call
    # sequence) and source location.
    # 
    #   require 'net/http'
    #   Net::HTTP.method(:get).inspect
    #   #=> "#<Method: Net::HTTP.get(uri_or_host, path=..., port=...) <skip>/lib/ruby/2.7.0/net/http.rb:457>"
    # 
    # <code>...</code> in argument definition means argument is optional (has
    # some default value).
    # 
    # For methods defined in C (language core and extensions), location and
    # argument names can't be extracted, and only generic information is provided
    # in form of <code>*</code> (any number of arguments) or <code>_</code> (some
    # positional argument).
    # 
    #   "cat".method(:count).inspect   #=> "#<Method: String#count(*)>"
    #   "cat".method(:+).inspect       #=> "#<Method: String#+(_)>""
    def inspect()
        #This is a stub, used for indexing
    end
    # meth.to_s      ->  string
    # 
    # Returns a human-readable description of the underlying method.
    # 
    #   "cat".method(:count).inspect   #=> "#<Method: String#count(*)>"
    #   (1..3).method(:map).inspect    #=> "#<Method: Range(Enumerable)#map()>"
    # 
    # In the latter case, the method description includes the "owner" of the
    # original method (+Enumerable+ module, which is included into +Range+).
    # 
    # +inspect+ also provides, when possible, method argument names (call
    # sequence) and source location.
    # 
    #   require 'net/http'
    #   Net::HTTP.method(:get).inspect
    #   #=> "#<Method: Net::HTTP.get(uri_or_host, path=..., port=...) <skip>/lib/ruby/2.7.0/net/http.rb:457>"
    # 
    # <code>...</code> in argument definition means argument is optional (has
    # some default value).
    # 
    # For methods defined in C (language core and extensions), location and
    # argument names can't be extracted, and only generic information is provided
    # in form of <code>*</code> (any number of arguments) or <code>_</code> (some
    # positional argument).
    # 
    #   "cat".method(:count).inspect   #=> "#<Method: String#count(*)>"
    #   "cat".method(:+).inspect       #=> "#<Method: String#+(_)>""
    def to_s()
        #This is a stub, used for indexing
    end
    # meth.name    -> symbol
    # 
    # Returns the name of the method.
    def name()
        #This is a stub, used for indexing
    end
    # meth.original_name    -> symbol
    # 
    # Returns the original name of the method.
    # 
    #   class C
    #     def foo; end
    #     alias bar foo
    #   end
    #   C.instance_method(:bar).original_name # => :foo
    def original_name()
        #This is a stub, used for indexing
    end
    # meth.owner    -> class_or_module
    # 
    # Returns the class or module that defines the method.
    # See also Method#receiver.
    # 
    #   (1..3).method(:map).owner #=> Enumerable
    def owner()
        #This is a stub, used for indexing
    end
    # umeth.bind(obj) -> method
    # 
    # Bind <i>umeth</i> to <i>obj</i>. If Klass was the class from which
    # <i>umeth</i> was obtained, <code>obj.kind_of?(Klass)</code> must
    # be true.
    # 
    #    class A
    #      def test
    #        puts "In test, class = #{self.class}"
    #      end
    #    end
    #    class B < A
    #    end
    #    class C < B
    #    end
    # 
    #    um = B.instance_method(:test)
    #    bm = um.bind(C.new)
    #    bm.call
    #    bm = um.bind(B.new)
    #    bm.call
    #    bm = um.bind(A.new)
    #    bm.call
    # 
    # <em>produces:</em>
    # 
    #    In test, class = C
    #    In test, class = B
    #    prog.rb:16:in `bind': bind argument must be an instance of B (TypeError)
    #     from prog.rb:16
    def bind(obj)
        #This is a stub, used for indexing
    end
    # umeth.bind_call(recv, args, ...) -> obj
    # 
    # Bind <i>umeth</i> to <i>recv</i> and then invokes the method with the
    # specified arguments.
    # This is semantically equivalent to <code>umeth.bind(recv).call(args, ...)</code>.
    def bind_call(recv, *smth)
        #This is a stub, used for indexing
    end
    # meth.source_location  -> [String, Integer]
    # 
    # Returns the Ruby source filename and line number containing this method
    # or nil if this method was not defined in Ruby (i.e. native).
    def source_location()
        #This is a stub, used for indexing
    end
    # meth.parameters  -> array
    # 
    # Returns the parameter information of this method.
    # 
    #    def foo(bar); end
    #    method(:foo).parameters #=> [[:req, :bar]]
    # 
    #    def foo(bar, baz, bat, &blk); end
    #    method(:foo).parameters #=> [[:req, :bar], [:req, :baz], [:req, :bat], [:block, :blk]]
    # 
    #    def foo(bar, *args); end
    #    method(:foo).parameters #=> [[:req, :bar], [:rest, :args]]
    # 
    #    def foo(bar, baz, *args, &blk); end
    #    method(:foo).parameters #=> [[:req, :bar], [:req, :baz], [:rest, :args], [:block, :blk]]
    def parameters()
        #This is a stub, used for indexing
    end
    # meth.super_method  -> method
    # 
    # Returns a Method of superclass which would be called when super is used
    # or nil if there is no method on superclass.
    def super_method()
        #This is a stub, used for indexing
    end
end