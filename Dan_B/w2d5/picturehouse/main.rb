require 'pry'
require 'sinatra'
require 'sinatra/contrib/all'
require 'sinatra/reloader' if development?
require 'pg'

before do
  @db = PG.connect(dbname: 'picturehouse_app', host: 'localhost')
end

after do
  @db.close
end

get '/' do
  sql = "SELECT * FROM movies"
  @all_movies = @db.exec(sql)

  erb :list
end

get '/new' do
  erb :new_vid
end

post '/create' do
  title = params[:title]
  category = params[:category]
  description = params[:description]
  url = params[:url]

  sql = "INSERT INTO movies (title, category, description, url, created_on) values (#{sql_string(title)}, #{sql_string(category)}, #{sql_string(description)}, #{sql_string(url)}, current_timestamp)"

  @db.exec(sql)

  redirect to('/')
end

get '/edit/:id' do
  id = params[:id].to_i
  sql = "SELECT * FROM movies WHERE id=#{id}"
  @movies = @db.exec(sql)

  erb :edit
end

post '/post/:id' do
  id = params[:id].to_i
  title = params[:title]
  category = params[:category]
  description = params[:description]
  url = params[:url]

  sql = "UPDATE movies SET title=#{sql_string(title)}, description=#{sql_string(description)}, category=#{sql_string(category)}, url=#{sql_string(url)}, updated_on=current_timestamp WHERE id=#{id}"
  @db.exec(sql)
  redirect to('/')
end

post '/delete/:id' do
  sql = "DELETE FROM movies WHERE id = #{params[:id].to_i}"
  @db.exec(sql)
  redirect to('/')
end

# def sql_string(value)
#   "'#{value.gsub("'", "''")}'"
# end
class String
  def t_format
    self[0,16]
  end
end