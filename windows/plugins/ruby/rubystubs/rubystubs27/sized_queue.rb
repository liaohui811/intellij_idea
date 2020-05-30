=begin
 This is a machine generated stub using stdlib-doc for <b>class SizedQueue</b>
 Sources used:  ruby-2.7.0
 Created by IntelliJ Ruby Stubs Generator.
=end

# This class represents queues of specified size capacity.  The push operation
# may be blocked if the capacity is full.
# 
# See Queue for an example of how a SizedQueue works.
class SizedQueue
    # new(max)
    # 
    # Creates a fixed-length queue with a maximum size of +max+.
    def initialize(max)
        #This is a stub, used for indexing
    end
    # close
    # 
    # Similar to Queue#close.
    # 
    # The difference is behavior with waiting enqueuing threads.
    # 
    # If there are waiting enqueuing threads, they are interrupted by
    # raising ClosedQueueError('queue closed').
    def close()
        #This is a stub, used for indexing
    end
    # Returns the maximum size of the queue.
    def max()
        #This is a stub, used for indexing
    end
    # max=(number)
    # 
    # Sets the maximum size of the queue to the given +number+.
    def max=(number)
        #This is a stub, used for indexing
    end
    # push(object, non_block=false)
    # enq(object, non_block=false)
    # <<(object)
    # 
    # Pushes +object+ to the queue.
    # 
    # If there is no space left in the queue, waits until space becomes
    # available, unless +non_block+ is true.  If +non_block+ is true, the
    # thread isn't suspended, and +ThreadError+ is raised.
    def push(object, non_block=false)
        #This is a stub, used for indexing
    end
    alias enq push
    alias << push
    # pop(non_block=false)
    # deq(non_block=false)
    # shift(non_block=false)
    # 
    # Retrieves data from the queue.
    # 
    # If the queue is empty, the calling thread is suspended until data is pushed
    # onto the queue. If +non_block+ is true, the thread isn't suspended, and
    # +ThreadError+ is raised.
    def pop(non_block=false)
        #This is a stub, used for indexing
    end
    alias deq pop
    alias shift pop
    # empty?
    # 
    # Returns +true+ if the queue is empty.
    def empty?()
        #This is a stub, used for indexing
    end
    # Removes all objects from the queue.
    def clear()
        #This is a stub, used for indexing
    end
    # length
    # size
    # 
    # Returns the length of the queue.
    def length()
        #This is a stub, used for indexing
    end
    alias size length
    # Returns the number of threads waiting on the queue.
    def num_waiting()
        #This is a stub, used for indexing
    end
    def enq(*args)
        #This is a stub, used for indexing
    end
    def <<(*args)
        #This is a stub, used for indexing
    end
    def deq(*args)
        #This is a stub, used for indexing
    end
    def shift(*args)
        #This is a stub, used for indexing
    end
    def size()
        #This is a stub, used for indexing
    end
end
