require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require 'yaml'

before do
  @content = YAML.load_file("users.yaml")
end

get "/" do
  @user_names =

  erb :layout
end