=begin
 This is a machine generated stub using stdlib-doc for <b>module GC</b>
 Sources used:  ruby-2.7.0
 Created by IntelliJ Ruby Stubs Generator.
=end

module GC
    # internal constants   
    INTERNAL_CONSTANTS = nil #value is unknown, used for indexing.
    # GC build options   
    OPTS = nil #value is unknown, used for indexing.
    # GC.verify_internal_consistency                  -> nil
    # 
    # Verify internal consistency.
    # 
    # This method is implementation specific.
    # Now this method checks generational consistency
    # if RGenGC is supported.
    def self.verify_internal_consistency()
        #This is a stub, used for indexing
    end
    # GC.verify_compaction_references                  -> nil
    # 
    # Verify compaction reference consistency.
    # 
    # This method is implementation specific.  During compaction, objects that
    # were moved are replaced with T_MOVED objects.  No object should have a
    # reference to a T_MOVED object after compaction.
    # 
    # This function doubles the heap to ensure room to move all objects,
    # compacts the heap to make sure everything moves, updates all references,
    # then performs a full GC.  If any object contains a reference to a T_MOVED
    # object, that object should be pushed on the mark stack, and will
    # make a SEGV.
    def self.verify_compaction_references()
        #This is a stub, used for indexing
    end
    def self.verify_transient_heap_internal_consistency()
        #This is a stub, used for indexing
    end
    # GC.malloc_allocated_size -> Integer
    # 
    # Returns the size of memory allocated by malloc().
    # 
    # Only available if ruby was built with +CALC_EXACT_MALLOC_SIZE+.
    def self.malloc_allocated_size()
        #This is a stub, used for indexing
    end
    # GC.malloc_allocations -> Integer
    # 
    # Returns the number of malloc() allocations.
    # 
    # Only available if ruby was built with +CALC_EXACT_MALLOC_SIZE+.
    def self.malloc_allocations()
        #This is a stub, used for indexing
    end
    # GC.add_stress_to_class(class[, ...])
    # 
    # Raises NoMemoryError when allocating an instance of the given classes.
    def self.add_stress_to_class(*args)
        #This is a stub, used for indexing
    end
    # GC.remove_stress_to_class(class[, ...])
    # 
    # No longer raises NoMemoryError when allocating an instance of the
    # given classes.
    def self.remove_stress_to_class(*args)
        #This is a stub, used for indexing
    end
    # The GC profiler provides access to information on GC runs including time,
    # length and object space size.
    # 
    # Example:
    # 
    #   GC::Profiler.enable
    # 
    #   require 'rdoc/rdoc'
    # 
    #   GC::Profiler.report
    # 
    #   GC::Profiler.disable
    # 
    # See also GC.count, GC.malloc_allocated_size and GC.malloc_allocations
    module Profiler
        # GC::Profiler.enabled?     -> true or false
        # 
        # The current status of GC profile mode.
        def self.enabled?()
            #This is a stub, used for indexing
        end
        # GC::Profiler.enable       -> nil
        # 
        # Starts the GC profiler.
        def self.enable()
            #This is a stub, used for indexing
        end
        # GC::Profiler.raw_data    -> [Hash, ...]
        # 
        # Returns an Array of individual raw profile data Hashes ordered
        # from earliest to latest by +:GC_INVOKE_TIME+.
        # 
        # For example:
        # 
        #   [
        #     {
        #        :GC_TIME=>1.3000000000000858e-05,
        #        :GC_INVOKE_TIME=>0.010634999999999999,
        #        :HEAP_USE_SIZE=>289640,
        #        :HEAP_TOTAL_SIZE=>588960,
        #        :HEAP_TOTAL_OBJECTS=>14724,
        #        :GC_IS_MARKED=>false
        #     },
        #     # ...
        #   ]
        # 
        # The keys mean:
        # 
        # +:GC_TIME+::
        #     Time elapsed in seconds for this GC run
        # +:GC_INVOKE_TIME+::
        #     Time elapsed in seconds from startup to when the GC was invoked
        # +:HEAP_USE_SIZE+::
        #     Total bytes of heap used
        # +:HEAP_TOTAL_SIZE+::
        #     Total size of heap in bytes
        # +:HEAP_TOTAL_OBJECTS+::
        #     Total number of objects
        # +:GC_IS_MARKED+::
        #     Returns +true+ if the GC is in mark phase
        # 
        # If ruby was built with +GC_PROFILE_MORE_DETAIL+, you will also have access
        # to the following hash keys:
        # 
        # +:GC_MARK_TIME+::
        # +:GC_SWEEP_TIME+::
        # +:ALLOCATE_INCREASE+::
        # +:ALLOCATE_LIMIT+::
        # +:HEAP_USE_PAGES+::
        # +:HEAP_LIVE_OBJECTS+::
        # +:HEAP_FREE_OBJECTS+::
        # +:HAVE_FINALIZE+::
        def self.raw_data()
            #This is a stub, used for indexing
        end
        # GC::Profiler.disable      -> nil
        # 
        # Stops the GC profiler.
        def self.disable()
            #This is a stub, used for indexing
        end
        # GC::Profiler.clear          -> nil
        # 
        # Clears the GC profiler data.
        def self.clear()
            #This is a stub, used for indexing
        end
        # GC::Profiler.result  -> String
        # 
        # Returns a profile data report such as:
        # 
        #   GC 1 invokes.
        #   Index    Invoke Time(sec)       Use Size(byte)     Total Size(byte)         Total Object                    GC time(ms)
        #       1               0.012               159240               212940                10647         0.00000000000001530000
        def self.result()
            #This is a stub, used for indexing
        end
        # GC::Profiler.report
        # GC::Profiler.report(io)
        # 
        # Writes the GC::Profiler.result to <tt>$stdout</tt> or the given IO object.
        def self.report(*several_variants)
            #This is a stub, used for indexing
        end
        # GC::Profiler.total_time  -> float
        # 
        # The total time used for garbage collection in seconds
        def self.total_time()
            #This is a stub, used for indexing
        end
    end
end
