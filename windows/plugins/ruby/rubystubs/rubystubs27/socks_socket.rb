=begin
 This is a machine generated stub using stdlib-doc for <b>class SOCKSSocket</b>
 Sources used:  ruby-2.7.0
 Created by IntelliJ Ruby Stubs Generator.
=end

require 'tcp_socket'
# SOCKS is an Internet protocol that routes packets between a client and
# a server through a proxy server.  SOCKS5, if supported, additionally
# provides authentication so only authorized users may access a server.
class SOCKSSocket < TCPSocket
    # SOCKSSocket.new(host, port) => socket
    # 
    # Opens a SOCKS connection to +host+ via the SOCKS server.
    # 
    # The SOCKS server configuration varies by implementation
    # 
    # When using the Dante libsocks/libsocksd implementation it is configured as SOCKS_SERVER env var.
    # 
    # See: https://manpages.debian.org/testing/dante-client/socksify.1.en.html for full env variable support.
    def initialize(host, port)
        #This is a stub, used for indexing
    end
    # Closes the SOCKS connection.
    def close()
        #This is a stub, used for indexing
    end
end
