require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require 'yaml'

before do
  @content = YAML.load_file("users.yaml")
end

get "/" do
  @user_names = @content.keys

  erb :home
end

get "user/:name" do
  user = params[:name]

  @email = @content.fetch(user.to_sym)[:email]
  @interests = @content.fetch(user.to_sym)[:interests]

  erb :user
end