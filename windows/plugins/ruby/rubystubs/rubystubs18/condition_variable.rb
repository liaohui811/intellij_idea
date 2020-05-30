=begin
 This is a machine generated stub using stdlib-doc for <b>class ConditionVariable</b>
 Sources used:  ruby-1.8.7-p374
 Created by IntelliJ Ruby Stubs Generator.
=end

# ConditionVariable objects augment class Mutex. Using condition variables,
# it is possible to suspend while in the middle of a critical section until a
# resource becomes available.
# 
# Example:
# 
#   require 'thread'
# 
#   mutex = Mutex.new
#   resource = ConditionVariable.new
# 
#   a = Thread.new {
#     mutex.synchronize {
#       # Thread 'a' now needs the resource
#       resource.wait(mutex)
#       # 'a' can now have the resource
#     }
#   }
# 
#   b = Thread.new {
#     mutex.synchronize {
#       # Thread 'b' has finished using the resource
#       resource.signal
#     }
#   }
class ConditionVariable
    # for marshalling mutexes and condvars   
    def marshal_load(p1)
        #This is a stub, used for indexing
    end
    def marshal_dump()
        #This is a stub, used for indexing
    end
    # wait
    # 
    # Releases the lock held in +mutex+ and waits; reacquires the lock on wakeup.
    def wait()
        #This is a stub, used for indexing
    end
    # broadcast
    # 
    # Wakes up all threads waiting for this condition.
    def broadcast()
        #This is a stub, used for indexing
    end
    # signal
    # 
    # Wakes up the first thread in line waiting for this condition.
    def signal()
        #This is a stub, used for indexing
    end
end