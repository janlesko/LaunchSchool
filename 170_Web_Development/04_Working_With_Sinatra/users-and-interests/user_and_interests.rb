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

get "/user/:name" do
  user = params[:name].to_sym

  @email = @content.fetch(user)[:email]
  @interests = @content.fetch(user.to_sym)[:interests].join(", ")
  @other_names = @content.keys - [user]

  erb :user
end

helpers do
  def users_count
    @content.keys.count
  end

  def interests_count
    result = 0
    @content.each do |_, details|
      result += details[:interests].count
    end
    result
  end
end