require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, 'secret'
end

before do
  session[:lists] ||= []
end

get "/" do
  redirect "/lists"
end

# GET  /lists     -> view all lists
# GET  /new_list  -> new list form
# POST /lists     -> create new list
# GET  /lists/1   -> view a single list

# View list of lists
get "/lists" do
  @lists = session[:lists]
  erb :lists, layout: :layout
end

# Render the new list form
get "/lists/new" do
  erb :new_list, layout: :layout
end

# Return and error message if the name is invalid. Return nil if name is valid.
def error_for_list_name(name)
  if session[:lists].any? { |list| list[:name] == name }
    "List name must be unique."
  elsif !name.size.between?(1, 100)
    "List name must be between 1 and 100 characters."
  end
end

# Create a new list
post "/lists" do
  list_name = params[:list_name].strip

  if error = error_for_list_name(list_name)
    session[:error] = error
    erb :new_list, layout: :layout
  else
    session[:lists] << { name: list_name, todos: [] }
    session[:success] = "The list has been created."
    redirect "/lists"
  end
end
