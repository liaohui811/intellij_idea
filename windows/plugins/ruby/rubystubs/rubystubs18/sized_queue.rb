=begin
 This is a machine generated stub using stdlib-doc for <b>class SizedQueue</b>
 Sources used:  ruby-1.8.7-p374
 Created by IntelliJ Ruby Stubs Generator.
=end

# This class represents queues of specified size capacity.  The push operation
# may be blocked if the capacity is full.
# 
# See Queue for an example of how a SizedQueue works.
class SizedQueue < Queue
    # max=(size)
    # 
    # Sets the maximum size of the queue.
    def initialize(p1)
        #This is a stub, used for indexing
    end
    # num_waiting
    # 
    # Returns the number of threads waiting on the queue.
    def num_waiting()
        #This is a stub, used for indexing
    end
    #   call_seq: pop(non_block=false)
    # 
    # Retrieves data from the queue.  If the queue is empty, the calling thread is
    # suspended until data is pushed onto the queue.  If +non_block+ is true, the
    # thread isn't suspended, and an exception is raised.
    def pop(*args)
        #This is a stub, used for indexing
    end
    # push(obj)
    # 
    # Pushes +obj+ to the queue.
    def push(obj)
        #This is a stub, used for indexing
    end
    # max
    # 
    # Returns the maximum size of the queue.
    def max()
        #This is a stub, used for indexing
    end
    # max=(size)
    # 
    # Sets the maximum size of the queue.
    def max=(size)
        #This is a stub, used for indexing
    end
end
