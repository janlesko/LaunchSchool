require "socket"

server = TCPServer.new("localhost", 3003)

def decomposer(string)
  http_method, path_and_parameters, http_version = string.split
  path, parameters = path_and_parameters.split("?")
  rolls_and_sides = (parameters || "").split("&").each_with_object({}) do |param, hash|
    action, number = param.split("=")
    hash[action] = number
  end
  [http_method, path, rolls_and_sides]
end

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/

  http_method, path, rolls_and_sides = decomposer(request_line)

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html"
  client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts rolls_and_sides
  client.puts "</pre>"

  client.puts "<h1>Counter</h1>"

  number = rolls_and_sides["number"].to_i
  client.puts "<p>The current number is #{number}.</p>"

  client.puts "<a href='?number=#{number + 1}'>Add one</a>"
  client.puts "<a href='?number=#{number - 1}'>Subtract one</a>"
  client.puts "</body>"
  client.puts "</html>"

  client.close
end
