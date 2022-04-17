require 'socket'
require 'timeout'

# Obtains information from user for target provided as command-line arguments 1 & 2
PORT = ARGV[0] || 22
HOST = ARGV[1] || 'localhost'

# Attempts TCP connection and will timeout after 1 second
begin
    results = Timeout.timeout(1) do
        socket = TCPSocket.new(HOST, PORT)
        $status = "open"
    end
# Error handling for closed ports
rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT, Timeout::Error
    $status = "closed"
end

# Outputs result
puts "Port #{PORT} is #{$status}"