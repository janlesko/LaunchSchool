require "socket"

server = TCPServer.new("localhost", 3003)

def decomposer(string)
  http_method, path_and_parameters, http_version = string.split
  path, parameters = path_and_parameters.split("?")
  rolls_and_sides = parameters.split("&").each_with_object({}) do |param, hash|
    action, number = param.split("=")
    hash[action] = number.to_i
  end
  [http_method, path, rolls_and_sides]
end

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/

  puts request_line
  client.puts request_line

  http_method, path, rolls_and_sides = decomposer(request_line)

  rolls_and_sides["rolls"].times { client.puts rand(rolls_and_sides["sides"]) + 1}
  client.close
end