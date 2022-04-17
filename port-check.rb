require 'socket'
require 'timeout'

# Obtains information from user for target provided as command-line arguments 1 & 2
# PORT = ARGV[0] || 22
HOST = ARGV[0] || 'localhost'
openPorts = []

def scan250
    for p in 1...250 do
        # Attempts TCP connection and will timeout after 1 second
        begin
            results = Timeout.timeout(0.009) do
                socket = TCPSocket.new(HOST, p)
                $status = "open"
            end
        # Error handling for closed ports
        rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT, Timeout::Error
            $status = "closed"
        end
    
    
        # Outputs result
        if $status == "open"
            puts "Port #{p} is #{$status}"
        end
    end
end


def scan500
    for p in 251...500 do
        # Attempts TCP connection and will timeout after 1 second
        begin
            results = Timeout.timeout(0.009) do
                socket = TCPSocket.new(HOST, p)
                $status = "open"
            end
        # Error handling for closed ports
        rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT, Timeout::Error
            $status = "closed"
        end
    
    
        # Outputs result
        if $status == "open"
            puts "Port #{p} is #{$status}"
        end
    end
end

def scan750
    for p in 501...750 do
        # Attempts TCP connection and will timeout after 1 second
        begin
            results = Timeout.timeout(0.009) do
                socket = TCPSocket.new(HOST, p)
                $status = "open"
            end
        # Error handling for closed ports
        rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT, Timeout::Error
            $status = "closed"
        end
    
    
        # Outputs result
        if $status == "open"
            puts "Port #{p} is #{$status}"
        end
    end
end

def scan1000
    for p in 751...1000 do
        # Attempts TCP connection and will timeout after 1 second
        begin
            results = Timeout.timeout(0.009) do
                socket = TCPSocket.new(HOST, p)
                $status = "open"
            end
        # Error handling for closed ports
        rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT, Timeout::Error
            $status = "closed"
        end
    
    
        # Outputs result
        if $status == "open"
            puts "Port #{p} is #{$status}"
        end
    end
end

puts "Started at #{Time.now}"
t1 = Thread.new{scan250()}
t2 = Thread.new{scan500()}
t3 = Thread.new{scan750()}
t4 = Thread.new{scan1000()}

t1.join
t2.join
t3.join
t4.join

puts "Ended at #{Time.now}"
