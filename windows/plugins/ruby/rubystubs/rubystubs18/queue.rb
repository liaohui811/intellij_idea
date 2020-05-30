=begin
 This is a machine generated stub using stdlib-doc for <b>class Queue</b>
 Sources used:  ruby-1.8.7-p374
 Created by IntelliJ Ruby Stubs Generator.
=end

# This class provides a way to synchronize communication between threads.
# 
# Example:
# 
#   require 'thread'
# 
#   queue = Queue.new
# 
#   producer = Thread.new do
#     5.times do |i|
#       sleep rand(i) # simulate expense
#       queue << i
#       puts "#{i} produced"
#     end
#   end
# 
#   consumer = Thread.new do
#     5.times do |i|
#       value = queue.pop
#       sleep rand(i/2) # simulate expense
#       puts "consumed #{value}"
#     end
#   end
# 
#   consumer.join
class Queue
    def marshal_load(p1)
        #This is a stub, used for indexing
    end
    def marshal_dump()
        #This is a stub, used for indexing
    end
    # clear
    # 
    # Removes all objects from the queue.
    def clear()
        #This is a stub, used for indexing
    end
    # empty?
    # 
    # Returns +true+ if the queue is empty.
    def empty?()
        #This is a stub, used for indexing
    end
    # length
    # 
    # Returns the length of the queue.
    def length()
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
end
