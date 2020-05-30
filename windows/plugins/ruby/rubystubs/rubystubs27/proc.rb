=begin
 This is a machine generated stub using stdlib-doc for <b>class Proc</b>
 Sources used:  ruby-2.7.0
 Created by IntelliJ Ruby Stubs Generator.
=end

# A +Proc+ object is an encapsulation of a block of code, which can be stored
# in a local variable, passed to a method or another Proc, and can be called.
# Proc is an essential concept in Ruby and a core of its functional
# programming features.
# 
#      square = Proc.new {|x| x**2 }
# 
#      square.call(3)  #=> 9
#      # shorthands:
#      square.(3)      #=> 9
#      square[3]       #=> 9
# 
# Proc objects are _closures_, meaning they remember and can use the entire
# context in which they were created.
# 
#     def gen_times(factor)
#       Proc.new {|n| n*factor } # remembers the value of factor at the moment of creation
#     end
# 
#     times3 = gen_times(3)
#     times5 = gen_times(5)
# 
#     times3.call(12)               #=> 36
#     times5.call(5)                #=> 25
#     times3.call(times5.call(4))   #=> 60
# 
# == Creation
# 
# There are several methods to create a Proc
# 
# * Use the Proc class constructor:
# 
#      proc1 = Proc.new {|x| x**2 }
# 
# * Use the Kernel#proc method as a shorthand of Proc.new:
# 
#      proc2 = proc {|x| x**2 }
# 
# * Receiving a block of code into proc argument (note the <code>&</code>):
# 
#      def make_proc(&block)
#        block
#      end
# 
#      proc3 = make_proc {|x| x**2 }
# 
# * Construct a proc with lambda semantics using the Kernel#lambda method
#   (see below for explanations about lambdas):
# 
#      lambda1 = lambda {|x| x**2 }
# 
# * Use the Lambda literal syntax (also constructs a proc with lambda semantics):
# 
#      lambda2 = ->(x) { x**2 }
# 
# == Lambda and non-lambda semantics
# 
# Procs are coming in two flavors: lambda and non-lambda (regular procs).
# Differences are:
# 
# * In lambdas, +return+ and +break+ means exit from this lambda;
# * In non-lambda procs, +return+ means exit from embracing method
#   (and will throw +LocalJumpError+ if invoked outside the method);
# * In non-lambda procs, +break+ means exit from the method which the block given for.
#   (and will throw +LocalJumpError+ if invoked after the method returns);
# * In lambdas, arguments are treated in the same way as in methods: strict,
#   with +ArgumentError+ for mismatching argument number,
#   and no additional argument processing;
# * Regular procs accept arguments more generously: missing arguments
#   are filled with +nil+, single Array arguments are deconstructed if the
#   proc has multiple arguments, and there is no error raised on extra
#   arguments.
# 
# Examples:
# 
#      # +return+ in non-lambda proc, +b+, exits +m2+.
#      # (The block +{ return }+ is given for +m1+ and embraced by +m2+.)
#      $a = []; def m1(&b) b.call; $a << :m1 end; def m2() m1 { return }; $a << :m2 end; m2; p $a
#      #=> []
# 
#      # +break+ in non-lambda proc, +b+, exits +m1+.
#      # (The block +{ break }+ is given for +m1+ and embraced by +m2+.)
#      $a = []; def m1(&b) b.call; $a << :m1 end; def m2() m1 { break }; $a << :m2 end; m2; p $a
#      #=> [:m2]
# 
#      # +next+ in non-lambda proc, +b+, exits the block.
#      # (The block +{ next }+ is given for +m1+ and embraced by +m2+.)
#      $a = []; def m1(&b) b.call; $a << :m1 end; def m2() m1 { next }; $a << :m2 end; m2; p $a
#      #=> [:m1, :m2]
# 
#      # Using +proc+ method changes the behavior as follows because
#      # The block is given for +proc+ method and embraced by +m2+.
#      $a = []; def m1(&b) b.call; $a << :m1 end; def m2() m1(&proc { return }); $a << :m2 end; m2; p $a
#      #=> []
#      $a = []; def m1(&b) b.call; $a << :m1 end; def m2() m1(&proc { break }); $a << :m2 end; m2; p $a
#      # break from proc-closure (LocalJumpError)
#      $a = []; def m1(&b) b.call; $a << :m1 end; def m2() m1(&proc { next }); $a << :m2 end; m2; p $a
#      #=> [:m1, :m2]
# 
#      # +return+, +break+ and +next+ in the stubby lambda exits the block.
#      # (+lambda+ method behaves same.)
#      # (The block is given for stubby lambda syntax and embraced by +m2+.)
#      $a = []; def m1(&b) b.call; $a << :m1 end; def m2() m1(&-> { return }); $a << :m2 end; m2; p $a
#      #=> [:m1, :m2]
#      $a = []; def m1(&b) b.call; $a << :m1 end; def m2() m1(&-> { break }); $a << :m2 end; m2; p $a
#      #=> [:m1, :m2]
#      $a = []; def m1(&b) b.call; $a << :m1 end; def m2() m1(&-> { next }); $a << :m2 end; m2; p $a
#      #=> [:m1, :m2]
# 
#      p = proc {|x, y| "x=#{x}, y=#{y}" }
#      p.call(1, 2)      #=> "x=1, y=2"
#      p.call([1, 2])    #=> "x=1, y=2", array deconstructed
#      p.call(1, 2, 8)   #=> "x=1, y=2", extra argument discarded
#      p.call(1)         #=> "x=1, y=", nil substituted instead of error
# 
#      l = lambda {|x, y| "x=#{x}, y=#{y}" }
#      l.call(1, 2)      #=> "x=1, y=2"
#      l.call([1, 2])    # ArgumentError: wrong number of arguments (given 1, expected 2)
#      l.call(1, 2, 8)   # ArgumentError: wrong number of arguments (given 3, expected 2)
#      l.call(1)         # ArgumentError: wrong number of arguments (given 1, expected 2)
# 
#      def test_return
#        -> { return 3 }.call      # just returns from lambda into method body
#        proc { return 4 }.call    # returns from method
#        return 5
#      end
# 
#      test_return # => 4, return from proc
# 
# Lambdas are useful as self-sufficient functions, in particular useful as
# arguments to higher-order functions, behaving exactly like Ruby methods.
# 
# Procs are useful for implementing iterators:
# 
#      def test
#        [[1, 2], [3, 4], [5, 6]].map {|a, b| return a if a + b > 10 }
#                                  #  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#      end
# 
# Inside +map+, the block of code is treated as a regular (non-lambda) proc,
# which means that the internal arrays will be deconstructed to pairs of
# arguments, and +return+ will exit from the method +test+. That would
# not be possible with a stricter lambda.
# 
# You can tell a lambda from a regular proc by using the #lambda? instance method.
# 
# Lambda semantics is typically preserved during the proc lifetime, including
# <code>&</code>-deconstruction to a block of code:
# 
#      p = proc {|x, y| x }
#      l = lambda {|x, y| x }
#      [[1, 2], [3, 4]].map(&p) #=> [1, 2]
#      [[1, 2], [3, 4]].map(&l) # ArgumentError: wrong number of arguments (given 1, expected 2)
# 
# The only exception is dynamic method definition: even if defined by
# passing a non-lambda proc, methods still have normal semantics of argument
# checking.
# 
#   class C
#     define_method(:e, &proc {})
#   end
#   C.new.e(1,2)       #=> ArgumentError
#   C.new.method(:e).to_proc.lambda?   #=> true
# 
# This exception ensures that methods never have unusual argument passing
# conventions, and makes it easy to have wrappers defining methods that
# behave as usual.
# 
#   class C
#     def self.def2(name, &body)
#       define_method(name, &body)
#     end
# 
#     def2(:f) {}
#   end
#   C.new.f(1,2)       #=> ArgumentError
# 
# The wrapper <code>def2</code> receives _body_ as a non-lambda proc,
# yet defines a method which has normal semantics.
# 
# == Conversion of other objects to procs
# 
# Any object that implements the +to_proc+ method can be converted into
# a proc by the <code>&</code> operator, and therefore con be
# consumed by iterators.
# 
#      class Greeter
#        def initialize(greeting)
#          @greeting = greeting
#        end
# 
#        def to_proc
#          proc {|name| "#{@greeting}, #{name}!" }
#        end
#      end
# 
#      hi = Greeter.new("Hi")
#      hey = Greeter.new("Hey")
#      ["Bob", "Jane"].map(&hi)    #=> ["Hi, Bob!", "Hi, Jane!"]
#      ["Bob", "Jane"].map(&hey)   #=> ["Hey, Bob!", "Hey, Jane!"]
# 
# Of the Ruby core classes, this method is implemented by Symbol,
# Method, and Hash.
# 
#      :to_s.to_proc.call(1)           #=> "1"
#      [1, 2].map(&:to_s)              #=> ["1", "2"]
# 
#      method(:puts).to_proc.call(1)   # prints 1
#      [1, 2].each(&method(:puts))     # prints 1, 2
# 
#      {test: 1}.to_proc.call(:test)       #=> 1
#      %i[test many keys].map(&{test: 1})  #=> [1, nil, nil]
# 
# == Orphaned Proc
# 
# +return+ and +break+ in a block exit a method.
# If a Proc object is generated from the block and the Proc object
# survives until the method is returned, +return+ and +break+ cannot work.
# In such case, +return+ and +break+ raises LocalJumpError.
# A Proc object in such situation is called as orphaned Proc object.
# 
# Note that the method to exit is different for +return+ and +break+.
# There is a situation that orphaned for +break+ but not orphaned for +return+.
# 
#     def m1(&b) b.call end; def m2(); m1 { return } end; m2 # ok
#     def m1(&b) b.call end; def m2(); m1 { break } end; m2 # ok
# 
#     def m1(&b) b end; def m2(); m1 { return }.call end; m2 # ok
#     def m1(&b) b end; def m2(); m1 { break }.call end; m2 # LocalJumpError
# 
#     def m1(&b) b end; def m2(); m1 { return } end; m2.call # LocalJumpError
#     def m1(&b) b end; def m2(); m1 { break } end; m2.call # LocalJumpError
# 
# Since +return+ and +break+ exits the block itself in lambdas,
# lambdas cannot be orphaned.
# 
# == Numbered parameters
# 
# Numbered parameters are implicitly defined block parameters intended to
# simplify writing short blocks:
# 
#     # Explicit parameter:
#     %w[test me please].each { |str| puts str.upcase } # prints TEST, ME, PLEASE
#     (1..5).map { |i| i**2 } # => [1, 4, 9, 16, 25]
# 
#     # Implicit parameter:
#     %w[test me please].each { puts _1.upcase } # prints TEST, ME, PLEASE
#     (1..5).map { _1**2 } # => [1, 4, 9, 16, 25]
# 
# Parameter names from +_1+ to +_9+ are supported:
# 
#     [10, 20, 30].zip([40, 50, 60], [70, 80, 90]).map { _1 + _2 + _3 }
#     # => [120, 150, 180]
# 
# Though, it is advised to resort to them wisely, probably limiting
# yourself to +_1+ and +_2+, and to one-line blocks.
# 
# Numbered parameters can't be used together with explicitly named
# ones:
# 
#     [10, 20, 30].map { |x| _1**2 }
#     # SyntaxError (ordinary parameter is defined)
# 
# To avoid conflicts, naming local variables or method
# arguments +_1+, +_2+ and so on, causes a warning.
# 
#     _1 = 'test'
#     # warning: `_1' is reserved as numbered parameter
# 
# Using implicit numbered parameters affects block's arity:
# 
#     p = proc { _1 + _2 }
#     l = lambda { _1 + _2 }
#     p.parameters     # => [[:opt, :_1], [:opt, :_2]]
#     p.arity          # => 2
#     l.parameters     # => [[:req, :_1], [:req, :_2]]
#     l.arity          # => 2
# 
# Blocks with numbered parameters can't be nested:
# 
#     %w[test me].each { _1.each_char { p _1 } }
#     # SyntaxError (numbered parameter is already used in outer block here)
#     # %w[test me].each { _1.each_char { p _1 } }
#     #                    ^~
# 
# Numbered parameters were introduced in Ruby 2.7.
class Proc
    # Proc.new {|...| block } -> a_proc
    # Proc.new                -> a_proc
    # 
    # Creates a new Proc object, bound to the current context. Proc::new
    # may be called without a block only within a method with an
    # attached block, in which case that block is converted to the Proc
    # object.
    # 
    #    def proc_from
    #      Proc.new
    #    end
    #    proc = proc_from { "hello" }
    #    proc.call   #=> "hello"
    def self.new(*several_variants)
        #This is a stub, used for indexing
    end
    # prc.call(params,...)   -> obj
    # 
    # Invokes the block, setting the block's parameters to the values in
    # <i>params</i> using something close to method calling semantics.
    # Returns the value of the last expression evaluated in the block.
    # 
    #    a_proc = Proc.new {|scalar, *values| values.map {|value| value*scalar } }
    #    a_proc.call(9, 1, 2, 3)    #=> [9, 18, 27]
    #    a_proc[9, 1, 2, 3]         #=> [9, 18, 27]
    #    a_proc.(9, 1, 2, 3)        #=> [9, 18, 27]
    #    a_proc.yield(9, 1, 2, 3)   #=> [9, 18, 27]
    # 
    # Note that <code>prc.()</code> invokes <code>prc.call()</code> with
    # the parameters given.  It's syntactic sugar to hide "call".
    # 
    # For procs created using #lambda or <code>->()</code> an error is
    # generated if the wrong number of parameters are passed to the
    # proc.  For procs created using Proc.new or Kernel.proc, extra
    # parameters are silently discarded and missing parameters are set
    # to +nil+.
    # 
    #    a_proc = proc {|a,b| [a,b] }
    #    a_proc.call(1)   #=> [1, nil]
    # 
    #    a_proc = lambda {|a,b| [a,b] }
    #    a_proc.call(1)   # ArgumentError: wrong number of arguments (given 1, expected 2)
    # 
    # See also Proc#lambda?.
    def call(*params)
        #This is a stub, used for indexing
    end
    # prc[params,...]        -> obj
    # 
    # Invokes the block, setting the block's parameters to the values in
    # <i>params</i> using something close to method calling semantics.
    # Returns the value of the last expression evaluated in the block.
    # 
    #    a_proc = Proc.new {|scalar, *values| values.map {|value| value*scalar } }
    #    a_proc.call(9, 1, 2, 3)    #=> [9, 18, 27]
    #    a_proc[9, 1, 2, 3]         #=> [9, 18, 27]
    #    a_proc.(9, 1, 2, 3)        #=> [9, 18, 27]
    #    a_proc.yield(9, 1, 2, 3)   #=> [9, 18, 27]
    # 
    # Note that <code>prc.()</code> invokes <code>prc.call()</code> with
    # the parameters given.  It's syntactic sugar to hide "call".
    # 
    # For procs created using #lambda or <code>->()</code> an error is
    # generated if the wrong number of parameters are passed to the
    # proc.  For procs created using Proc.new or Kernel.proc, extra
    # parameters are silently discarded and missing parameters are set
    # to +nil+.
    # 
    #    a_proc = proc {|a,b| [a,b] }
    #    a_proc.call(1)   #=> [1, nil]
    # 
    #    a_proc = lambda {|a,b| [a,b] }
    #    a_proc.call(1)   # ArgumentError: wrong number of arguments (given 1, expected 2)
    # 
    # See also Proc#lambda?.
    def [](*params)
        #This is a stub, used for indexing
    end
    # proc === obj   -> result_of_proc
    # 
    # Invokes the block with +obj+ as the proc's parameter like Proc#call.
    # This allows a proc object to be the target of a +when+ clause
    # in a case statement.
    def === obj
        #This is a stub, used for indexing
    end
    # prc.yield(params,...)  -> obj
    # 
    # Invokes the block, setting the block's parameters to the values in
    # <i>params</i> using something close to method calling semantics.
    # Returns the value of the last expression evaluated in the block.
    # 
    #    a_proc = Proc.new {|scalar, *values| values.map {|value| value*scalar } }
    #    a_proc.call(9, 1, 2, 3)    #=> [9, 18, 27]
    #    a_proc[9, 1, 2, 3]         #=> [9, 18, 27]
    #    a_proc.(9, 1, 2, 3)        #=> [9, 18, 27]
    #    a_proc.yield(9, 1, 2, 3)   #=> [9, 18, 27]
    # 
    # Note that <code>prc.()</code> invokes <code>prc.call()</code> with
    # the parameters given.  It's syntactic sugar to hide "call".
    # 
    # For procs created using #lambda or <code>->()</code> an error is
    # generated if the wrong number of parameters are passed to the
    # proc.  For procs created using Proc.new or Kernel.proc, extra
    # parameters are silently discarded and missing parameters are set
    # to +nil+.
    # 
    #    a_proc = proc {|a,b| [a,b] }
    #    a_proc.call(1)   #=> [1, nil]
    # 
    #    a_proc = lambda {|a,b| [a,b] }
    #    a_proc.call(1)   # ArgumentError: wrong number of arguments (given 1, expected 2)
    # 
    # See also Proc#lambda?.
    def yield(params,*smth)
        #This is a stub, used for indexing
    end
    # prc.to_proc -> proc
    # 
    # Part of the protocol for converting objects to Proc objects.
    # Instances of class Proc simply return themselves.
    def to_proc()
        #This is a stub, used for indexing
    end
    # prc.arity -> integer
    # 
    # Returns the number of mandatory arguments. If the block
    # is declared to take no arguments, returns 0. If the block is known
    # to take exactly n arguments, returns n.
    # If the block has optional arguments, returns -n-1, where n is the
    # number of mandatory arguments, with the exception for blocks that
    # are not lambdas and have only a finite number of optional arguments;
    # in this latter case, returns n.
    # Keyword arguments will be considered as a single additional argument,
    # that argument being mandatory if any keyword argument is mandatory.
    # A #proc with no argument declarations is the same as a block
    # declaring <code>||</code> as its arguments.
    # 
    #    proc {}.arity                  #=>  0
    #    proc { || }.arity              #=>  0
    #    proc { |a| }.arity             #=>  1
    #    proc { |a, b| }.arity          #=>  2
    #    proc { |a, b, c| }.arity       #=>  3
    #    proc { |*a| }.arity            #=> -1
    #    proc { |a, *b| }.arity         #=> -2
    #    proc { |a, *b, c| }.arity      #=> -3
    #    proc { |x:, y:, z:0| }.arity   #=>  1
    #    proc { |*a, x:, y:0| }.arity   #=> -2
    # 
    #    proc   { |a=0| }.arity         #=>  0
    #    lambda { |a=0| }.arity         #=> -1
    #    proc   { |a=0, b| }.arity      #=>  1
    #    lambda { |a=0, b| }.arity      #=> -2
    #    proc   { |a=0, b=0| }.arity    #=>  0
    #    lambda { |a=0, b=0| }.arity    #=> -1
    #    proc   { |a, b=0| }.arity      #=>  1
    #    lambda { |a, b=0| }.arity      #=> -2
    #    proc   { |(a, b), c=0| }.arity #=>  1
    #    lambda { |(a, b), c=0| }.arity #=> -2
    #    proc   { |a, x:0, y:0| }.arity #=>  1
    #    lambda { |a, x:0, y:0| }.arity #=> -2
    def arity()
        #This is a stub, used for indexing
    end
    # prc.hash   ->  integer
    # 
    # Returns a hash value corresponding to proc body.
    # 
    # See also Object#hash.
    def hash()
        #This is a stub, used for indexing
    end
    # prc.to_s   -> string
    # 
    # Returns the unique identifier for this proc, along with
    # an indication of where the proc was defined.
    def to_s()
        #This is a stub, used for indexing
    end
    alias inspect to_s
    # prc.lambda? -> true or false
    # 
    # Returns +true+ if a Proc object is lambda.
    # +false+ if non-lambda.
    # 
    # The lambda-ness affects argument handling and the behavior of +return+ and +break+.
    # 
    # A Proc object generated by +proc+ ignores extra arguments.
    # 
    #   proc {|a,b| [a,b] }.call(1,2,3)    #=> [1,2]
    # 
    # It provides +nil+ for missing arguments.
    # 
    #   proc {|a,b| [a,b] }.call(1)        #=> [1,nil]
    # 
    # It expands a single array argument.
    # 
    #   proc {|a,b| [a,b] }.call([1,2])    #=> [1,2]
    # 
    # A Proc object generated by +lambda+ doesn't have such tricks.
    # 
    #   lambda {|a,b| [a,b] }.call(1,2,3)  #=> ArgumentError
    #   lambda {|a,b| [a,b] }.call(1)      #=> ArgumentError
    #   lambda {|a,b| [a,b] }.call([1,2])  #=> ArgumentError
    # 
    # Proc#lambda? is a predicate for the tricks.
    # It returns +true+ if no tricks apply.
    # 
    #   lambda {}.lambda?            #=> true
    #   proc {}.lambda?              #=> false
    # 
    # Proc.new is the same as +proc+.
    # 
    #   Proc.new {}.lambda?          #=> false
    # 
    # +lambda+, +proc+ and Proc.new preserve the tricks of
    # a Proc object given by <code>&</code> argument.
    # 
    #   lambda(&lambda {}).lambda?   #=> true
    #   proc(&lambda {}).lambda?     #=> true
    #   Proc.new(&lambda {}).lambda? #=> true
    # 
    #   lambda(&proc {}).lambda?     #=> false
    #   proc(&proc {}).lambda?       #=> false
    #   Proc.new(&proc {}).lambda?   #=> false
    # 
    # A Proc object generated by <code>&</code> argument has the tricks
    # 
    #   def n(&b) b.lambda? end
    #   n {}                         #=> false
    # 
    # The <code>&</code> argument preserves the tricks if a Proc object
    # is given by <code>&</code> argument.
    # 
    #   n(&lambda {})                #=> true
    #   n(&proc {})                  #=> false
    #   n(&Proc.new {})              #=> false
    # 
    # A Proc object converted from a method has no tricks.
    # 
    #   def m() end
    #   method(:m).to_proc.lambda?   #=> true
    # 
    #   n(&method(:m))               #=> true
    #   n(&method(:m).to_proc)       #=> true
    # 
    # +define_method+ is treated the same as method definition.
    # The defined method has no tricks.
    # 
    #   class C
    #     define_method(:d) {}
    #   end
    #   C.new.d(1,2)       #=> ArgumentError
    #   C.new.method(:d).to_proc.lambda?   #=> true
    # 
    # +define_method+ always defines a method without the tricks,
    # even if a non-lambda Proc object is given.
    # This is the only exception for which the tricks are not preserved.
    # 
    #   class C
    #     define_method(:e, &proc {})
    #   end
    #   C.new.e(1,2)       #=> ArgumentError
    #   C.new.method(:e).to_proc.lambda?   #=> true
    # 
    # This exception ensures that methods never have tricks
    # and makes it easy to have wrappers to define methods that behave as usual.
    # 
    #   class C
    #     def self.def2(name, &body)
    #       define_method(name, &body)
    #     end
    # 
    #     def2(:f) {}
    #   end
    #   C.new.f(1,2)       #=> ArgumentError
    # 
    # The wrapper <i>def2</i> defines a method which has no tricks.
    def lambda?()
        #This is a stub, used for indexing
    end
    # prc.binding    -> binding
    # 
    # Returns the binding associated with <i>prc</i>.
    # 
    #    def fred(param)
    #      proc {}
    #    end
    # 
    #    b = fred(99)
    #    eval("param", b.binding)   #=> 99
    def binding()
        #This is a stub, used for indexing
    end
    # prc.curry         -> a_proc
    # prc.curry(arity)  -> a_proc
    # 
    # Returns a curried proc. If the optional <i>arity</i> argument is given,
    # it determines the number of arguments.
    # A curried proc receives some arguments. If a sufficient number of
    # arguments are supplied, it passes the supplied arguments to the original
    # proc and returns the result. Otherwise, returns another curried proc that
    # takes the rest of arguments.
    # 
    #    b = proc {|x, y, z| (x||0) + (y||0) + (z||0) }
    #    p b.curry[1][2][3]           #=> 6
    #    p b.curry[1, 2][3, 4]        #=> 6
    #    p b.curry(5)[1][2][3][4][5]  #=> 6
    #    p b.curry(5)[1, 2][3, 4][5]  #=> 6
    #    p b.curry(1)[1]              #=> 1
    # 
    #    b = proc {|x, y, z, *w| (x||0) + (y||0) + (z||0) + w.inject(0, &:+) }
    #    p b.curry[1][2][3]           #=> 6
    #    p b.curry[1, 2][3, 4]        #=> 10
    #    p b.curry(5)[1][2][3][4][5]  #=> 15
    #    p b.curry(5)[1, 2][3, 4][5]  #=> 15
    #    p b.curry(1)[1]              #=> 1
    # 
    #    b = lambda {|x, y, z| (x||0) + (y||0) + (z||0) }
    #    p b.curry[1][2][3]           #=> 6
    #    p b.curry[1, 2][3, 4]        #=> wrong number of arguments (given 4, expected 3)
    #    p b.curry(5)                 #=> wrong number of arguments (given 5, expected 3)
    #    p b.curry(1)                 #=> wrong number of arguments (given 1, expected 3)
    # 
    #    b = lambda {|x, y, z, *w| (x||0) + (y||0) + (z||0) + w.inject(0, &:+) }
    #    p b.curry[1][2][3]           #=> 6
    #    p b.curry[1, 2][3, 4]        #=> 10
    #    p b.curry(5)[1][2][3][4][5]  #=> 15
    #    p b.curry(5)[1, 2][3, 4][5]  #=> 15
    #    p b.curry(1)                 #=> wrong number of arguments (given 1, expected 3)
    # 
    #    b = proc { :foo }
    #    p b.curry[]                  #=> :foo
    def curry(*several_variants)
        #This is a stub, used for indexing
    end
    # prc << g -> a_proc
    # 
    # Returns a proc that is the composition of this proc and the given <i>g</i>.
    # The returned proc takes a variable number of arguments, calls <i>g</i> with them
    # then calls this proc with the result.
    # 
    #    f = proc {|x| x * x }
    #    g = proc {|x| x + x }
    #    p (f << g).call(2) #=> 16
    # 
    # See Proc#>> for detailed explanations.
    def << g
        #This is a stub, used for indexing
    end
    # prc >> g -> a_proc
    # 
    # Returns a proc that is the composition of this proc and the given <i>g</i>.
    # The returned proc takes a variable number of arguments, calls this proc with them
    # then calls <i>g</i> with the result.
    # 
    #    f = proc {|x| x * x }
    #    g = proc {|x| x + x }
    #    p (f >> g).call(2) #=> 8
    # 
    # <i>g</i> could be other Proc, or Method, or any other object responding to
    # +call+ method:
    # 
    #    class Parser
    #      def self.call(text)
    #         # ...some complicated parsing logic...
    #      end
    #    end
    # 
    #    pipeline = File.method(:read) >> Parser >> proc { |data| puts "data size: #{data.count}" }
    #    pipeline.call('data.json')
    # 
    # See also Method#>> and Method#<<.
    def >> g
        #This is a stub, used for indexing
    end
    # prc.source_location  -> [String, Integer]
    # 
    # Returns the Ruby source filename and line number containing this proc
    # or +nil+ if this proc was not defined in Ruby (i.e. native).
    def source_location()
        #This is a stub, used for indexing
    end
    # prc.parameters  -> array
    # 
    # Returns the parameter information of this proc.
    # 
    #    prc = lambda{|x, y=42, *other|}
    #    prc.parameters  #=> [[:req, :x], [:opt, :y], [:rest, :other]]
    def parameters()
        #This is a stub, used for indexing
    end
    # proc.ruby2_keywords -> proc
    # 
    # Marks the proc as passing keywords through a normal argument splat.
    # This should only be called on procs that accept an argument splat
    # (<tt>*args</tt>) but not explicit keywords or a keyword splat.  It
    # marks the proc such that if the proc is called with keyword arguments,
    # the final hash argument is marked with a special flag such that if it
    # is the final element of a normal argument splat to another method call,
    # and that method call does not include explicit keywords or a keyword
    # splat, the final element is interpreted as keywords.  In other words,
    # keywords will be passed through the proc to other methods.
    # 
    # This should only be used for procs that delegate keywords to another
    # method, and only for backwards compatibility with Ruby versions before
    # 2.7.
    # 
    # This method will probably be removed at some point, as it exists only
    # for backwards compatibility. As it does not exist in Ruby versions
    # before 2.7, check that the proc responds to this method before calling
    # it. Also, be aware that if this method is removed, the behavior of the
    # proc will change so that it does not pass through keywords.
    # 
    #   module Mod
    #     foo = ->(meth, *args, &block) do
    #       send(:"do_#{meth}", *args, &block)
    #     end
    #     foo.ruby2_keywords if foo.respond_to?(:ruby2_keywords)
    #   end
    def ruby2_keywords()
        #This is a stub, used for indexing
    end
    def inspect()
        #This is a stub, used for indexing
    end
end
