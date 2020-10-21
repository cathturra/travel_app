     
require 'sinatra'
require 'sinatra/reloader' if development?


# also_reload File.expand_path(__dir__, 'models/*') if development?

get '/' do
  erb :index
end

# def run_sql
#   db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'travel_app'})
#   result = db.exec_params(sql, params)
#   db.close
#   return result
# end









