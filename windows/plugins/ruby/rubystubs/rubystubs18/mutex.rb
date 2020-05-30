=begin
 This is a machine generated stub using stdlib-doc for <b>class Mutex</b>
 Sources used:  ruby-1.8.7-p374
 Created by IntelliJ Ruby Stubs Generator.
=end

# Mutex implements a simple semaphore that can be used to coordinate access to
# shared data from multiple concurrent threads.
# 
# Example:
# 
#   require 'thread'
#   semaphore = Mutex.new
# 
#   a = Thread.new {
#     semaphore.synchronize {
#       # access shared resource
#     }
#   }
# 
#   b = Thread.new {
#     semaphore.synchronize {
#       # access shared resource
#     }
#   }
class Mutex
    # for marshalling mutexes and condvars   
    def marshal_load(p1)
        #This is a stub, used for indexing
    end
    def marshal_dump()
        #This is a stub, used for indexing
    end
    # locked?
    # 
    # Returns +true+ if this lock is currently held by some thread.
    def locked?()
        #This is a stub, used for indexing
    end
    # try_lock
    # 
    # Attempts to obtain the lock and returns immediately. Returns +true+ if the
    # lock was granted.
    def try_lock()
        #This is a stub, used for indexing
    end
    # lock
    # 
    # Attempts to grab the lock and waits if it isn't available.
    def lock()
        #This is a stub, used for indexing
    end
    # Releases the lock. Returns +nil+ if ref wasn't locked.
    def unlock()
        #This is a stub, used for indexing
    end
    # exclusive_unlock { ... }
    # 
    # If the mutex is locked, unlocks the mutex, wakes one waiting thread, and
    # yields in a critical section.
    def exclusive_unlock()
        #This is a stub, used for indexing
    end
    # synchronize { ... }
    # 
    # Obtains a lock, runs the block, and releases the lock when the block
    # completes.  See the example under Mutex.
    def synchronize()
        #This is a stub, used for indexing
    end
end
