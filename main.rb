require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'bcrypt'

require_relative 'models/users'
require_relative 'models/travel_posts'
require_relative 'models/travel_suggestions'
require_relative 'logged_in'

enable :sessions

get '/' do 
  erb :index
end

post '/' do 
  erb :index
end

get '/login' do 
  erb :'/sessions/login'
end

post '/login' do 

  user = find_user_by_email(params[:email])

  if user && BCrypt::Password.new(user["password"]) == params[:password]
    session[:user_id] = user['id']
    redirect '/travel_posts'
  else 
    erb :'/sessions/login'
  end

end

get '/travel_posts' do
  travel_posts = all_posts()
  erb(:'/travel_posts', locals: {travel_posts: travel_posts})
end

# post '/travel_posts' do
  
#   create_post(params[:location], params[:description])
#   redirect '/travel_posts'
# end

get '/travel_suggestions' do

  culture = all_culture()
  events = all_events()
  accomodation = all_accomodation()
  travel_suggestions = all_suggestions()
  erb(:'/travel_suggestions', locals: {travel_suggestions: travel_suggestions, culture: culture, events: events, accomodation: accomodation})
end

get '/culture/:id' do
  culture = culture_by_id(params[:id])

  erb(:'/culture', locals: {culture: culture})
end

get '/create' do 

  erb :create
end

get '/events/:id' do
  events = events_by_id(params[:id])
  erb(:'/events', locals: {events: events})
end

get '/accomodation/:id' do
  accomodation = accomodation_by_id(params[:id])
  erb(:'/accomodation', locals: {accomodation: accomodation})
end

get '/sign-up' do 
  erb :'/sessions/sign-up'
end

post '/sign-up' do 


  create_user(params[:name], params[:email], params[:password])
  name = find_user_by_name(params[:name])
  email = find_user_by_email(params[:email])
 
  password = BCrypt::Password.create(params[:password])

  sql = "INSERT INTO users (email, password) VALUES (#{name}, #{email}', '#{password}');"
  redirect '/login'

  erb :'/sessions/sign-up'
end

delete '/logout' do 

  session[:user_id] = nil

  redirect '/'

end












