require 'socket'
require 'timeout'
require 'net/ping'

# Obtains information from user for target provided as command-line arguments 1 & 2
# PORT = ARGV[0] || 22
HOST = ARGV[0] || 'localhost'

def scan(startPort, endPort)
    until startPort == endPort do
        # Attempts TCP connection and will timeout after 1 second
        begin
            results = Timeout.timeout(0.008) do
                socket = TCPSocket.new(HOST, startPort)
                $status = "open"
            end
        # Error handling for closed ports
        rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT, Timeout::Error
            $status = "closed"
        end
    
    
        # Outputs result
        if $status == "open"
            puts "Port #{startPort} is #{$status}"
        end

        startPort += 1
    end
end

def main
    startTime = Time.now

    t1 = Thread.new{scan(1, 100)}
    t2 = Thread.new{scan(101, 200)}
    t3 = Thread.new{scan(201, 300)}
    t4 = Thread.new{scan(301, 400)}
    t5 = Thread.new{scan(401, 500)}
    t6 = Thread.new{scan(501, 600)}
    t7 = Thread.new{scan(601, 700)}
    t8 = Thread.new{scan(701, 800)}
    t9 = Thread.new{scan(801, 900)}
    t10 = Thread.new{scan(901, 1000)}

    t1.join
    t2.join
    t3.join
    t4.join
    t5.join
    t6.join
    t7.join
    t8.join
    t9.join
    t10.join

    puts "Duration: #{Time.now - startTime}s"
end

main