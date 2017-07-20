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
  not_found unless number.between?(1, 12)
  chapter_name = @contents[number - 1]
  @title = "Chapter #{number}: #{chapter_name}"

  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

def extract_paragraph(chapter, query)
  chapter.split("\n\n").select { |par| par.match(query) }
end

def each_chapter(&block)
  @contents.each_with_index do |name, index|
    number = index + 1
    chapter = File.read("data/chp#{number}.txt")
    yield number, name, chapter
  end
end

def chapters_matching(query)
  results = []

  return results if !query || query.empty?

  each_chapter do |number, name, chapter|
    if chapter.include?(query)
      paragraphs = extract_paragraph(chapter, query)
      results << {number: number, name: name, paragraphs: paragraphs}
    end
  end

  results
end

get "/search" do
  @results = chapters_matching(params[:query])
  erb :search
end

helpers do
  def in_paragraphs(chapter)
    chapter.split("\n\n").map.with_index do |par, index| 
      "<p id=p#{index + 1}>#{par}</p>"
    end.join
  end
end

not_found do
  redirect "/"
end