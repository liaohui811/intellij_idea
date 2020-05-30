=begin
 This is a machine generated stub using stdlib-doc for <b>class Fiber</b>
 Sources used:  ruby-2.7.0
 Created by IntelliJ Ruby Stubs Generator.
=end

# Fibers are primitives for implementing light weight cooperative
# concurrency in Ruby. Basically they are a means of creating code blocks
# that can be paused and resumed, much like threads. The main difference
# is that they are never preempted and that the scheduling must be done by
# the programmer and not the VM.
# 
# As opposed to other stackless light weight concurrency models, each fiber
# comes with a stack.  This enables the fiber to be paused from deeply
# nested function calls within the fiber block.  See the ruby(1)
# manpage to configure the size of the fiber stack(s).
# 
# When a fiber is created it will not run automatically. Rather it must
# be explicitly asked to run using the Fiber#resume method.
# The code running inside the fiber can give up control by calling
# Fiber.yield in which case it yields control back to caller (the
# caller of the Fiber#resume).
# 
# Upon yielding or termination the Fiber returns the value of the last
# executed expression
# 
# For instance:
# 
#   fiber = Fiber.new do
#     Fiber.yield 1
#     2
#   end
# 
#   puts fiber.resume
#   puts fiber.resume
#   puts fiber.resume
# 
# <em>produces</em>
# 
#   1
#   2
#   FiberError: dead fiber called
# 
# The Fiber#resume method accepts an arbitrary number of parameters,
# if it is the first call to #resume then they will be passed as
# block arguments. Otherwise they will be the return value of the
# call to Fiber.yield
# 
# Example:
# 
#   fiber = Fiber.new do |first|
#     second = Fiber.yield first + 2
#   end
# 
#   puts fiber.resume 10
#   puts fiber.resume 1_000_000
#   puts fiber.resume "The fiber will be dead before I can cause trouble"
# 
# <em>produces</em>
# 
#   12
#   1000000
#   FiberError: dead fiber called
class Fiber
    # Fiber.yield(args, ...) -> obj
    # 
    # Yields control back to the context that resumed the fiber, passing
    # along any arguments that were passed to it. The fiber will resume
    # processing at this point when #resume is called next.
    # Any arguments passed to the next #resume will be the value that
    # this Fiber.yield expression evaluates to.
    def self.yield(*smth)
        #This is a stub, used for indexing
    end
    # fiber.resume(args, ...) -> obj
    # 
    # Resumes the fiber from the point at which the last Fiber.yield was
    # called, or starts running it if it is the first call to
    # #resume. Arguments passed to resume will be the value of the
    # Fiber.yield expression or will be passed as block parameters to
    # the fiber's block if this is the first #resume.
    # 
    # Alternatively, when resume is called it evaluates to the arguments passed
    # to the next Fiber.yield statement inside the fiber's block
    # or to the block value if it runs to completion without any
    # Fiber.yield
    def resume(*smth)
        #This is a stub, used for indexing
    end
    # fiber.raise                                 -> obj
    # fiber.raise(string)                         -> obj
    # fiber.raise(exception [, string [, array]]) -> obj
    # 
    # Raises an exception in the fiber at the point at which the last
    # Fiber.yield was called, or at the start if neither +resume+
    # nor +raise+ were called before.
    # 
    # With no arguments, raises a +RuntimeError+. With a single +String+
    # argument, raises a +RuntimeError+ with the string as a message.  Otherwise,
    # the first parameter should be the name of an +Exception+ class (or an
    # object that returns an +Exception+ object when sent an +exception+
    # message). The optional second parameter sets the message associated with
    # the exception, and the third parameter is an array of callback information.
    # Exceptions are caught by the +rescue+ clause of <code>begin...end</code>
    # blocks.
    def raise(*several_variants)
        #This is a stub, used for indexing
    end
    # fiber.to_s   -> string
    # 
    # Returns fiber information string.
    def to_s()
        #This is a stub, used for indexing
    end
    alias inspect to_s
    # fiber.transfer(args, ...) -> obj
    # 
    # Transfer control to another fiber, resuming it from where it last
    # stopped or starting it if it was not resumed before. The calling
    # fiber will be suspended much like in a call to
    # Fiber.yield. You need to <code>require 'fiber'</code>
    # before using this method.
    # 
    # The fiber which receives the transfer call is treats it much like
    # a resume call. Arguments passed to transfer are treated like those
    # passed to resume.
    # 
    # You cannot call +resume+ on a fiber that has been transferred to.
    # If you call +transfer+ on a fiber, and later call +resume+ on the
    # the fiber, a +FiberError+ will be raised. Once you call +transfer+ on
    # a fiber, the only way to resume processing the fiber is to
    # call +transfer+ on it again.
    # 
    # Example:
    # 
    #   fiber1 = Fiber.new do
    #     puts "In Fiber 1"
    #     Fiber.yield
    #     puts "In Fiber 1 again"
    #   end
    # 
    #   fiber2 = Fiber.new do
    #     puts "In Fiber 2"
    #     fiber1.transfer
    #     puts "Never see this message"
    #   end
    # 
    #   fiber3 = Fiber.new do
    #     puts "In Fiber 3"
    #   end
    # 
    #   fiber2.resume
    #   fiber3.resume
    #   fiber1.resume rescue (p $!)
    #   fiber1.transfer
    # 
    # <em>produces</em>
    # 
    #   In Fiber 2
    #   In Fiber 1
    #   In Fiber 3
    #   #<FiberError: cannot resume transferred Fiber>
    #   In Fiber 1 again
    def transfer(*smth)
        #This is a stub, used for indexing
    end
    # fiber.alive? -> true or false
    # 
    # Returns true if the fiber can still be resumed (or transferred
    # to). After finishing execution of the fiber block this method will
    # always return false. You need to <code>require 'fiber'</code>
    # before using this method.
    def alive?()
        #This is a stub, used for indexing
    end
    # Fiber.current() -> fiber
    # 
    # Returns the current fiber. You need to <code>require 'fiber'</code>
    # before using this method. If you are not running in the context of
    # a fiber this method will return the root fiber.
    def self.current()
        #This is a stub, used for indexing
    end
    def inspect()
        #This is a stub, used for indexing
    end
end
