=begin
 This is a machine generated stub using stdlib-doc for <b>class TCPSocket</b>
 Sources used:  ruby-2.7.0
 Created by IntelliJ Ruby Stubs Generator.
=end

require 'ip_socket'
# TCPSocket represents a TCP/IP client socket.
# 
# A simple client may look like:
# 
#   require 'socket'
# 
#   s = TCPSocket.new 'localhost', 2000
# 
#   while line = s.gets # Read lines from socket
#     puts line         # and print them
#   end
# 
#   s.close             # close socket when done
class TCPSocket < IPSocket
    # TCPSocket.gethostbyname(hostname) => [official_hostname, alias_hostnames, address_family, *address_list]
    # 
    # Use Addrinfo.getaddrinfo instead.
    # This method is deprecated for the following reasons:
    # 
    # - The 3rd element of the result is the address family of the first address.
    #   The address families of the rest of the addresses are not returned.
    # - gethostbyname() may take a long time and it may block other threads.
    #   (GVL cannot be released since gethostbyname() is not thread safe.)
    # - This method uses gethostbyname() function already removed from POSIX.
    # 
    # This method lookups host information by _hostname_.
    # 
    #   TCPSocket.gethostbyname("localhost")
    #   #=> ["localhost", ["hal"], 2, "127.0.0.1"]
    def self.gethostbyname(hostname)
        #This is a stub, used for indexing
    end
    # TCPSocket.new(remote_host, remote_port, local_host=nil, local_port=nil)
    # 
    # Opens a TCP connection to +remote_host+ on +remote_port+.  If +local_host+
    # and +local_port+ are specified, then those parameters are used on the local
    # end to establish the connection.
    def initialize(remote_host, remote_port, local_host=nil, local_port=nil)
        #This is a stub, used for indexing
    end
end
