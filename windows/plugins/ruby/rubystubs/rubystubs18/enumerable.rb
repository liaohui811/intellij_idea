=begin
 This is a machine generated stub using stdlib-doc for <b>module Enumerable</b>
 Sources used:  ruby-1.8.7-p374
 Created by IntelliJ Ruby Stubs Generator.
=end

# The <code>Enumerable</code> mixin provides collection classes with
# several traversal and searching methods, and with the ability to
# sort. The class must provide a method <code>each</code>, which
# yields successive members of the collection. If
# <code>Enumerable#max</code>, <code>#min</code>, or
# <code>#sort</code> is used, the objects in the collection must also
# implement a meaningful <code><=></code> operator, as these methods
# rely on an ordering between members of the collection.
module Enumerable
    # enum.to_a      =>    array
    # 
    # Returns an array containing the items in <i>enum</i>.
    # 
    #    (1..7).to_a                       #=> [1, 2, 3, 4, 5, 6, 7]
    #    { 'a'=>1, 'b'=>2, 'c'=>3 }.to_a   #=> [["a", 1], ["b", 2], ["c", 3]]
    def to_a()
        #This is a stub, used for indexing
    end
    # enum.entries   =>    array
    # 
    # Returns an array containing the items in <i>enum</i>.
    # 
    #    (1..7).to_a                       #=> [1, 2, 3, 4, 5, 6, 7]
    #    { 'a'=>1, 'b'=>2, 'c'=>3 }.to_a   #=> [["a", 1], ["b", 2], ["c", 3]]
    def entries()
        #This is a stub, used for indexing
    end
    # enum.sort                     => array
    # enum.sort {| a, b | block }   => array
    # 
    # Returns an array containing the items in <i>enum</i> sorted,
    # either according to their own <code><=></code> method, or by using
    # the results of the supplied block. The block should return -1, 0, or
    # +1 depending on the comparison between <i>a</i> and <i>b</i>. As of
    # Ruby 1.8, the method <code>Enumerable#sort_by</code> implements a
    # built-in Schwartzian Transform, useful when key computation or
    # comparison is expensive..
    # 
    #    %w(rhea kea flea).sort         #=> ["flea", "kea", "rhea"]
    #    (1..10).sort {|a,b| b <=> a}   #=> [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
    def sort(*several_variants)
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        self
    end
    # enum.sort_by {| obj | block }    => array
    # 
    # Sorts <i>enum</i> using a set of keys generated by mapping the
    # values in <i>enum</i> through the given block.
    # 
    #    %w{ apple pear fig }.sort_by {|word| word.length}
    #                 #=> ["fig", "pear", "apple"]
    # 
    # The current implementation of <code>sort_by</code> generates an
    # array of tuples containing the original collection element and the
    # mapped value. This makes <code>sort_by</code> fairly expensive when
    # the keysets are simple
    # 
    #    require 'benchmark'
    #    include Benchmark
    # 
    #    a = (1..100000).map {rand(100000)}
    # 
    #    bm(10) do |b|
    #      b.report("Sort")    { a.sort }
    #      b.report("Sort by") { a.sort_by {|a| a} }
    #    end
    # 
    # <em>produces:</em>
    # 
    #    user     system      total        real
    #    Sort        0.180000   0.000000   0.180000 (  0.175469)
    #    Sort by     1.980000   0.040000   2.020000 (  2.013586)
    # 
    # However, consider the case where comparing the keys is a non-trivial
    # operation. The following code sorts some files on modification time
    # using the basic <code>sort</code> method.
    # 
    #    files = Dir["*"]
    #    sorted = files.sort {|a,b| File.new(a).mtime <=> File.new(b).mtime}
    #    sorted   #=> ["mon", "tues", "wed", "thurs"]
    # 
    # This sort is inefficient: it generates two new <code>File</code>
    # objects during every comparison. A slightly better technique is to
    # use the <code>Kernel#test</code> method to generate the modification
    # times directly.
    # 
    #    files = Dir["*"]
    #    sorted = files.sort { |a,b|
    #      test(?M, a) <=> test(?M, b)
    #    }
    #    sorted   #=> ["mon", "tues", "wed", "thurs"]
    # 
    # This still generates many unnecessary <code>Time</code> objects. A
    # more efficient technique is to cache the sort keys (modification
    # times in this case) before the sort. Perl users often call this
    # approach a Schwartzian Transform, after Randal Schwartz. We
    # construct a temporary array, where each element is an array
    # containing our sort key along with the filename. We sort this array,
    # and then extract the filename from the result.
    # 
    #    sorted = Dir["*"].collect { |f|
    #       [test(?M, f), f]
    #    }.sort.collect { |f| f[1] }
    #    sorted   #=> ["mon", "tues", "wed", "thurs"]
    # 
    # This is exactly what <code>sort_by</code> does internally.
    # 
    #    sorted = Dir["*"].sort_by {|f| test(?M, f)}
    #    sorted   #=> ["mon", "tues", "wed", "thurs"]
    def sort_by()
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        block_given? ? (yield to_enum.next; self) : to_enum
    end
    # enum.grep(pattern)                   => array
    # enum.grep(pattern) {| obj | block }  => array
    # 
    # Returns an array of every element in <i>enum</i> for which
    # <code>Pattern === element</code>. If the optional <em>block</em> is
    # supplied, each matching element is passed to it, and the block's
    # result is stored in the output array.
    # 
    #    (1..100).grep 38..44   #=> [38, 39, 40, 41, 42, 43, 44]
    #    c = IO.constants
    #    c.grep(/SEEK/)         #=> ["SEEK_END", "SEEK_SET", "SEEK_CUR"]
    #    res = c.grep(/SEEK/) {|v| IO.const_get(v) }
    #    res                    #=> [2, 0, 1]
    def grep(*several_variants)
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        block_given? ? (yield to_enum.next; self) : to_enum
    end
    # enum.count                   => int
    # enum.count(item)             => int
    # enum.count {| obj | block }  => int
    # 
    # Returns the number of items in <i>enum</i>, where #size is called
    # if it responds to it, otherwise the items are counted through
    # enumeration.  If an argument is given, counts the number of items
    # in <i>enum</i>, for which equals to <i>item</i>.  If a block is
    # given, counts the number of elements yielding a true value.
    # 
    #    ary = [1, 2, 4, 2]
    #    ary.count             # => 4
    #    ary.count(2)          # => 2
    #    ary.count{|x|x%2==0}  # => 3
    def count(*several_variants)
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        yield to_enum.next; 0
    end
    # enum.find(ifnone = nil)   {| obj | block }  => obj or nil
    # 
    # Passes each entry in <i>enum</i> to <em>block</em>. Returns the
    # first for which <em>block</em> is not <code>false</code>.  If no
    # object matches, calls <i>ifnone</i> and returns its result when it
    # is specified, or returns <code>nil</code>
    # 
    #    (1..10).detect  {|i| i % 5 == 0 and i % 7 == 0 }   #=> nil
    #    (1..100).detect {|i| i % 5 == 0 and i % 7 == 0 }   #=> 35
    def find(ifnone = nil)
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        block_given? ? (yield to_enum.next; to_enum.next) : Enumerator.new
    end
    # enum.detect(ifnone = nil) {| obj | block }  => obj or nil
    # 
    # Passes each entry in <i>enum</i> to <em>block</em>. Returns the
    # first for which <em>block</em> is not <code>false</code>.  If no
    # object matches, calls <i>ifnone</i> and returns its result when it
    # is specified, or returns <code>nil</code>
    # 
    #    (1..10).detect  {|i| i % 5 == 0 and i % 7 == 0 }   #=> nil
    #    (1..100).detect {|i| i % 5 == 0 and i % 7 == 0 }   #=> 35
    def detect(ifnone = nil)
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        block_given? ? (yield to_enum.next; to_enum.next) : Enumerator.new
    end
    # enum.find_index(value)            => int or nil
    # enum.find_index {| obj | block }  => int or nil
    # 
    # Compares each entry in <i>enum</i> with <em>value</em> or passes
    # to <em>block</em>.  Returns the index for the first for which the
    # evaluated value is non-false.  If no object matches, returns
    # <code>nil</code>
    # 
    #    (1..10).find_index  {|i| i % 5 == 0 and i % 7 == 0 }   #=> nil
    #    (1..100).find_index {|i| i % 5 == 0 and i % 7 == 0 }   #=> 34
    #    (1..100).find_index(50)                                #=> 49
    def find_index(*several_variants)
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        yield to_enum.next; 0
    end
    # enum.find_all {| obj | block }  => array
    # 
    # Returns an array containing all elements of <i>enum</i> for which
    # <em>block</em> is not <code>false</code> (see also
    # <code>Enumerable#reject</code>).
    # 
    #    (1..10).find_all {|i|  i % 3 == 0 }   #=> [3, 6, 9]
    def find_all()
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        yield to_enum.next; to_enum.next.to_a
    end
    # enum.select   {| obj | block }  => array
    # 
    # Returns an array containing all elements of <i>enum</i> for which
    # <em>block</em> is not <code>false</code> (see also
    # <code>Enumerable#reject</code>).
    # 
    #    (1..10).find_all {|i|  i % 3 == 0 }   #=> [3, 6, 9]
    def select()
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        block_given? ? (yield to_enum.next; self) : to_enum
    end
    # enum.reject {| obj | block }  => array
    # 
    # Returns an array for all elements of <i>enum</i> for which
    # <em>block</em> is false (see also <code>Enumerable#find_all</code>).
    # 
    #    (1..10).reject {|i|  i % 3 == 0 }   #=> [1, 2, 4, 5, 7, 8, 10]
    def reject()
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        block_given? ? (yield to_enum.next; self) : to_enum
    end
    # enum.collect {| obj | block }  => array
    # 
    # Returns a new array with the results of running <em>block</em> once
    # for every element in <i>enum</i>.
    # 
    #    (1..4).collect {|i| i*i }   #=> [1, 4, 9, 16]
    #    (1..4).collect { "cat"  }   #=> ["cat", "cat", "cat", "cat"]
    def collect()
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        block_given? ? (yield to_enum.next).to_enum.to_a : to_enum
    end
    # enum.map     {| obj | block }  => array
    # 
    # Returns a new array with the results of running <em>block</em> once
    # for every element in <i>enum</i>.
    # 
    #    (1..4).collect {|i| i*i }   #=> [1, 4, 9, 16]
    #    (1..4).collect { "cat"  }   #=> ["cat", "cat", "cat", "cat"]
    def map()
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        block_given? ? (yield to_enum.next).to_enum.to_a : to_enum
    end
    # enum.inject(initial, sym) => obj
    # enum.inject(sym)          => obj
    # enum.inject(initial) {| memo, obj | block }  => obj
    # enum.inject          {| memo, obj | block }  => obj
    # 
    # Combines all elements of <i>enum</i> by applying a binary
    # operation, specified by a block or a symbol that names a
    # method or operator.
    # 
    # If you specify a block, then for each element in <i>enum<i>
    # the block is passed an accumulator value (<i>memo</i>) and the element.
    # If you specify a symbol instead, then each element in the collection
    # will be passed to the named method of <i>memo</i>.
    # In either case, the result becomes the new value for <i>memo</i>.
    # At the end of the iteration, the final value of <i>memo</i> is the
    # return value fo the method.
    # 
    # If you do not explicitly specify an <i>initial</i> value for <i>memo</i>,
    # then uses the first element of collection is used as the initial value
    # of <i>memo</i>.
    # 
    # Examples:
    # 
    #    # Sum some numbers
    #    (5..10).reduce(:+)                            #=> 45
    #    # Same using a block and inject
    #    (5..10).inject {|sum, n| sum + n }            #=> 45
    #    # Multiply some numbers
    #    (5..10).reduce(1, :*)                         #=> 151200
    #    # Same using a block
    #    (5..10).inject(1) {|product, n| product * n } #=> 151200
    #    # find the longest word
    #    longest = %w{ cat sheep bear }.inject do |memo,word|
    #       memo.length > word.length ? memo : word
    #    end
    #    longest                                       #=> "sheep"
    def inject(*several_variants)
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        yield __unknown, to_enum.next
    end
    # enum.reduce(initial, sym) => obj
    # enum.reduce(sym)          => obj
    # enum.reduce(initial) {| memo, obj | block }  => obj
    # enum.reduce          {| memo, obj | block }  => obj
    # 
    # Combines all elements of <i>enum</i> by applying a binary
    # operation, specified by a block or a symbol that names a
    # method or operator.
    # 
    # If you specify a block, then for each element in <i>enum<i>
    # the block is passed an accumulator value (<i>memo</i>) and the element.
    # If you specify a symbol instead, then each element in the collection
    # will be passed to the named method of <i>memo</i>.
    # In either case, the result becomes the new value for <i>memo</i>.
    # At the end of the iteration, the final value of <i>memo</i> is the
    # return value fo the method.
    # 
    # If you do not explicitly specify an <i>initial</i> value for <i>memo</i>,
    # then uses the first element of collection is used as the initial value
    # of <i>memo</i>.
    # 
    # Examples:
    # 
    #    # Sum some numbers
    #    (5..10).reduce(:+)                            #=> 45
    #    # Same using a block and inject
    #    (5..10).inject {|sum, n| sum + n }            #=> 45
    #    # Multiply some numbers
    #    (5..10).reduce(1, :*)                         #=> 151200
    #    # Same using a block
    #    (5..10).inject(1) {|product, n| product * n } #=> 151200
    #    # find the longest word
    #    longest = %w{ cat sheep bear }.inject do |memo,word|
    #       memo.length > word.length ? memo : word
    #    end
    #    longest                                       #=> "sheep"
    def reduce(*several_variants)
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        yield __unknown, to_enum.next
    end
    # enum.partition {| obj | block }  => [ true_array, false_array ]
    # 
    # Returns two arrays, the first containing the elements of
    # <i>enum</i> for which the block evaluates to true, the second
    # containing the rest.
    # 
    #    (1..6).partition {|i| (i&1).zero?}   #=> [[2, 4, 6], [1, 3, 5]]
    def partition()
        #This is a stub, used for indexing
    end
    # enum.group_by {| obj | block }  => a_hash
    # 
    # Returns a hash, which keys are evaluated result from the
    # block, and values are arrays of elements in <i>enum</i>
    # corresponding to the key.
    # 
    #    (1..6).group_by {|i| i%3}   #=> {0=>[3, 6], 1=>[1, 4], 2=>[2, 5]}
    def group_by()
        #This is a stub, used for indexing
    end
    # enum.first      -> obj or nil
    # enum.first(n)   -> an_array
    # 
    # Returns the first element, or the first +n+ elements, of the enumerable.
    # If the enumerable is empty, the first form returns <code>nil</code>, and the
    # second form returns an empty array.
    def first(*several_variants)
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        _ ? to_enum.next : nil
    end
    # enum.all? [{|obj| block } ]   => true or false
    # 
    # Passes each element of the collection to the given block. The method
    # returns <code>true</code> if the block never returns
    # <code>false</code> or <code>nil</code>. If the block is not given,
    # Ruby adds an implicit block of <code>{|obj| obj}</code> (that is
    # <code>all?</code> will return <code>true</code> only if none of the
    # collection members are <code>false</code> or <code>nil</code>.)
    # 
    #    %w{ ant bear cat}.all? {|word| word.length >= 3}   #=> true
    #    %w{ ant bear cat}.all? {|word| word.length >= 4}   #=> false
    #    [ nil, true, 99 ].all?                             #=> false
    def all?()
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        yield to_enum.next; __unknown
    end
    # enum.any? [{|obj| block } ]   => true or false
    # 
    # Passes each element of the collection to the given block. The method
    # returns <code>true</code> if the block ever returns a value other
    # than <code>false</code> or <code>nil</code>. If the block is not
    # given, Ruby adds an implicit block of <code>{|obj| obj}</code> (that
    # is <code>any?</code> will return <code>true</code> if at least one
    # of the collection members is not <code>false</code> or
    # <code>nil</code>.
    # 
    #    %w{ ant bear cat}.any? {|word| word.length >= 3}   #=> true
    #    %w{ ant bear cat}.any? {|word| word.length >= 4}   #=> true
    #    [ nil, true, 99 ].any?                             #=> true
    def any?()
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        yield to_enum.next; __unknown
    end
    # enum.one? [{|obj| block }]   => true or false
    # 
    # Passes each element of the collection to the given block. The method
    # returns <code>true</code> if the block returns <code>true</code>
    # exactly once. If the block is not given, <code>one?</code> will return
    # <code>true</code> only if exactly one of the collection members is
    # true.
    # 
    #    %w{ant bear cat}.one? {|word| word.length == 4}   #=> true
    #    %w{ant bear cat}.one? {|word| word.length > 4}    #=> false
    #    %w{ant bear cat}.one? {|word| word.length < 4}    #=> false
    #    [ nil, true, 99 ].one?                            #=> false
    #    [ nil, true, false ].one?                         #=> true
    def one?()
        #This is a stub, used for indexing
    end
    # enum.none? [{|obj| block }]   => true or false
    # 
    # Passes each element of the collection to the given block. The method
    # returns <code>true</code> if the block never returns <code>true</code>
    # for all elements. If the block is not given, <code>none?</code> will return
    # <code>true</code> only if none of the collection members is true.
    # 
    #    %w{ant bear cat}.none? {|word| word.length == 5}  #=> true
    #    %w{ant bear cat}.none? {|word| word.length >= 4}  #=> false
    #    [].none?                                          #=> true
    #    [nil].none?                                       #=> true
    #    [nil,false].none?                                 #=> true
    def none?()
        #This is a stub, used for indexing
    end
    # enum.min                    => obj
    # enum.min {| a,b | block }   => obj
    # 
    # Returns the object in <i>enum</i> with the minimum value. The
    # first form assumes all objects implement <code>Comparable</code>;
    # the second uses the block to return <em>a <=> b</em>.
    # 
    #    a = %w(albatross dog horse)
    #    a.min                                  #=> "albatross"
    #    a.min {|a,b| a.length <=> b.length }   #=> "dog"
    def min(*several_variants)
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        _ ? to_enum.next : nil
    end
    # enum.max                   => obj
    # enum.max {|a,b| block }    => obj
    # 
    # Returns the object in _enum_ with the maximum value. The
    # first form assumes all objects implement <code>Comparable</code>;
    # the second uses the block to return <em>a <=> b</em>.
    # 
    #    a = %w(albatross dog horse)
    #    a.max                                  #=> "horse"
    #    a.max {|a,b| a.length <=> b.length }   #=> "albatross"
    def max(*several_variants)
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        _ ? to_enum.next : nil
    end
    # enum.minmax                   => [min,max]
    # enum.minmax {|a,b| block }    => [min,max]
    # 
    # Returns two elements array which contains the minimum and the
    # maximum value in the enumerable.  The first form assumes all
    # objects implement <code>Comparable</code>; the second uses the
    # block to return <em>a <=> b</em>.
    # 
    #    a = %w(albatross dog horse)
    #    a.minmax                                  #=> ["albatross", "horse"]
    #    a.minmax {|a,b| a.length <=> b.length }   #=> ["dog", "albatross"]
    def minmax(*several_variants)
        #This is a stub, used for indexing
    end
    # enum.min_by {| obj| block }   => obj
    # 
    # Returns the object in <i>enum</i> that gives the minimum
    # value from the given block.
    # 
    #    a = %w(albatross dog horse)
    #    a.min_by {|x| x.length }   #=> "dog"
    def min_by()
        #This is a stub, used for indexing
    end
    # enum.max_by {| obj| block }   => obj
    # 
    # Returns the object in <i>enum</i> that gives the maximum
    # value from the given block.
    # 
    #    a = %w(albatross dog horse)
    #    a.max_by {|x| x.length }   #=> "albatross"
    def max_by()
        #This is a stub, used for indexing
    end
    # enum.minmax_by {| obj| block }   => [min, max]
    # 
    # Returns two elements array array containing the objects in
    # <i>enum</i> that gives the minimum and maximum values respectively
    # from the given block.
    # 
    #    a = %w(albatross dog horse)
    #    a.minmax_by {|x| x.length }   #=> ["dog", "albatross"]
    def minmax_by()
        #This is a stub, used for indexing
    end
    # enum.member?(obj)      => true or false
    # 
    # Returns <code>true</code> if any member of <i>enum</i> equals
    # <i>obj</i>. Equality is tested using <code>==</code>.
    # 
    #    IO.constants.include? "SEEK_SET"          #=> true
    #    IO.constants.include? "SEEK_NO_FURTHER"   #=> false
    def member?(obj)
        #This is a stub, used for indexing
    end
    # enum.include?(obj)     => true or false
    # 
    # Returns <code>true</code> if any member of <i>enum</i> equals
    # <i>obj</i>. Equality is tested using <code>==</code>.
    # 
    #    IO.constants.include? "SEEK_SET"          #=> true
    #    IO.constants.include? "SEEK_NO_FURTHER"   #=> false
    def include?(obj)
        #This is a stub, used for indexing
    end
    # enum.each_with_index {|obj, i| block }  -> enum
    # 
    # Calls <em>block</em> with two arguments, the item and its index, for
    # each item in <i>enum</i>.
    # 
    #    hash = Hash.new
    #    %w(cat dog wombat).each_with_index {|item, index|
    #      hash[item] = index
    #    }
    #    hash   #=> {"cat"=>0, "wombat"=>2, "dog"=>1}
    def each_with_index()
        #This is a stub, used for indexing
    end
    # enum.each_with_index {|obj, i| block }  -> enum
    # 
    # Calls <em>block</em> with two arguments, the item and its index, for
    # each item in <i>enum</i>.
    # 
    #    hash = Hash.new
    #    %w(cat dog wombat).each_with_index {|item, index|
    #      hash[item] = index
    #    }
    #    hash   #=> {"cat"=>0, "wombat"=>2, "dog"=>1}
    def enum_with_index()
        #This is a stub, used for indexing
    end
    # enum.reverse_each {|item| block } 
    # 
    # Traverses <i>enum</i> in reverse order.
    def reverse_each()
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        block_given? ? (yield to_enum.next; self) : to_enum
    end
    # enum.zip(arg, ...)                   => array
    # enum.zip(arg, ...) {|arr| block }    => nil
    # 
    # Converts any arguments to arrays, then merges elements of
    # <i>enum</i> with corresponding elements from each argument. This
    # generates a sequence of <code>enum#size</code> <em>n</em>-element
    # arrays, where <em>n</em> is one more that the count of arguments. If
    # the size of any argument is less than <code>enum#size</code>,
    # <code>nil</code> values are supplied. If a block given, it is
    # invoked for each output array, otherwise an array of arrays is
    # returned.
    # 
    #    a = [ 4, 5, 6 ]
    #    b = [ 7, 8, 9 ]
    # 
    #    (1..3).zip(a, b)      #=> [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
    #    "cat\ndog".zip([1])   #=> [["cat\n", 1], ["dog", nil]]
    #    (1..3).zip            #=> [[1], [2], [3]]
    def zip(*several_variants)
        #This is a stub, used for indexing
    end
    # enum.take(n)               => array
    # 
    # Returns first n elements from <i>enum</i>.
    # 
    #    a = [1, 2, 3, 4, 5, 0]
    #    a.take(3)             # => [1, 2, 3]
    def take(n)
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        block_given? ? (yield to_enum.next; self) : to_enum
    end
    # enum.take_while {|arr| block }   => array
    # 
    # Passes elements to the block until the block returns nil or false,
    # then stops iterating and returns an array of all prior elements.
    # 
    #    a = [1, 2, 3, 4, 5, 0]
    #    a.take_while {|i| i < 3 }   # => [1, 2]
    def take_while()
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        block_given? ? (yield to_enum.next; self) : to_enum
    end
    # enum.drop(n)               => array
    # 
    # Drops first n elements from <i>enum</i>, and returns rest elements
    # in an array.
    # 
    #    a = [1, 2, 3, 4, 5, 0]
    #    a.drop(3)             # => [4, 5, 0]
    def drop(n)
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        self
    end
    # enum.drop_while {|arr| block }   => array
    # 
    # Drops elements up to, but not including, the first element for
    # which the block returns nil or false and returns an array
    # containing the remaining elements.
    # 
    #    a = [1, 2, 3, 4, 5, 0]
    #    a.drop_while {|i| i < 3 }   # => [3, 4, 5, 0]
    def drop_while()
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        block_given? ? (yield to_enum.next; self) : to_enum
    end
    # enum.cycle {|obj| block }
    # enum.cycle(n) {|obj| block }
    # 
    # Calls <i>block</i> for each element of <i>enum</i> repeatedly _n_
    # times or forever if none or nil is given.  If a non-positive
    # number is given or the collection is empty, does nothing.  Returns
    # nil if the loop has finished without getting interrupted.
    # 
    # Enumerable#cycle saves elements in an internal array so changes
    # to <i>enum</i> after the first pass have no effect.
    # 
    #    a = ["a", "b", "c"]
    #    a.cycle {|x| puts x }  # print, a, b, c, a, b, c,.. forever.
    #    a.cycle(2) {|x| puts x }  # print, a, b, c, a, b, c.
    def cycle(*several_variants)
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        block_given? ? (yield to_enum.next; self) : to_enum
    end
    # e.each_slice(n) {...}
    # e.each_slice(n)
    # 
    # Iterates the given block for each slice of <n> elements.  If no
    # block is given, returns an enumerator.
    # 
    # e.g.:
    #     (1..10).each_slice(3) {|a| p a}
    #     # outputs below
    #     [1, 2, 3]
    #     [4, 5, 6]
    #     [7, 8, 9]
    #     [10]
    def each_slice(*several_variants)
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        yield self; nil
    end
    # e.each_slice(n) {...}
    # e.each_slice(n)
    # 
    # Iterates the given block for each slice of <n> elements.  If no
    # block is given, returns an enumerator.
    # 
    # e.g.:
    #     (1..10).each_slice(3) {|a| p a}
    #     # outputs below
    #     [1, 2, 3]
    #     [4, 5, 6]
    #     [7, 8, 9]
    #     [10]
    def enum_slice(p1)
        #This is a stub, used for indexing
    end
    # each_cons(n) {...}
    # each_cons(n)
    # 
    # Iterates the given block for each array of consecutive <n>
    # elements.  If no block is given, returns an enumerator.a
    # 
    # e.g.:
    #     (1..10).each_cons(3) {|a| p a}
    #     # outputs below
    #     [1, 2, 3]
    #     [2, 3, 4]
    #     [3, 4, 5]
    #     [4, 5, 6]
    #     [5, 6, 7]
    #     [6, 7, 8]
    #     [7, 8, 9]
    #     [8, 9, 10]
    def each_cons(*several_variants)
        #This is a stub implementation, it may not coincide with the actual behavior of the method
        yield self; nil
    end
    # each_cons(n) {...}
    # each_cons(n)
    # 
    # Iterates the given block for each array of consecutive <n>
    # elements.  If no block is given, returns an enumerator.a
    # 
    # e.g.:
    #     (1..10).each_cons(3) {|a| p a}
    #     # outputs below
    #     [1, 2, 3]
    #     [2, 3, 4]
    #     [3, 4, 5]
    #     [4, 5, 6]
    #     [5, 6, 7]
    #     [6, 7, 8]
    #     [7, 8, 9]
    #     [8, 9, 10]
    def enum_cons(p1)
        #This is a stub, used for indexing
    end
    # A class which provides a method `each' to be used as an Enumerable
    # object.
    class Enumerator
        include Enumerable
        # Enumerable::Enumerator.new(obj, method = :each, *args)
        # 
        # Creates a new Enumerable::Enumerator object, which is to be
        # used as an Enumerable object using the given object's given
        # method with the given arguments.
        # 
        # Use of this method is discouraged.  Use Kernel#enum_for() instead.
        def initialize(obj, method = :each, *args)
            #This is a stub, used for indexing
        end
        # enum.each {...}
        # 
        # Iterates the given block using the object and the method specified
        # in the first place.  If no block is given, returns self.
        def each()
            #This is a stub, used for indexing
        end
        # e.with_index {|(*args), idx| ... }
        # e.with_index
        # 
        # Iterates the given block for each elements with an index, which
        # start from 0.  If no block is given, returns an enumerator.
        def each_with_index()
            #This is a stub, used for indexing
        end
        # e.with_index {|(*args), idx| ... }
        # e.with_index
        # 
        # Iterates the given block for each elements with an index, which
        # start from 0.  If no block is given, returns an enumerator.
        def with_index(*several_variants)
            #This is a stub, used for indexing
        end
        # e.next   => object
        # 
        # Returns the next object in the enumerator, and move the internal
        # position forward.  When the position reached at the end, internal
        # position is rewinded then StopIteration is raised.
        # 
        # Note that enumeration sequence by next method does not affect other
        # non-external enumeration methods, unless underlying iteration
        # methods itself has side-effect, e.g. IO#each_line.
        # 
        # Caution: Calling this method causes the "generator" library to be
        # loaded.
        def next()
            #This is a stub, used for indexing
        end
        # e.rewind   => e
        # 
        # Rewinds the enumeration sequence by the next method.
        def rewind()
            #This is a stub, used for indexing
        end
    end
end
