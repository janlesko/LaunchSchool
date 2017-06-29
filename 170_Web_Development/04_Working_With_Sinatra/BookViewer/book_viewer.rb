require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

before do
  @contents = File.readlines("data/toc.txt")
end

get "/" do
  @title = "The adventures of Sherlock Holmes"

  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]
  @title = "Chapter #{number}: #{chapter_name}"

  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

get "/search" do
  @search_for = params[:query]

  erb :search
end

helpers do
  def in_paragraphs(chapter)
    chapter.split("\n\n").map do |par| 
      "<p>#{par}</p>"
    end.join
  end
end

not_found do
  redirect "/"
end