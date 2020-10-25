require 'pg'

def run_sql(sql, params = [])
  db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'travel_app'})
  result = db.exec_params(sql, params)
  db.close
  return result
end

def travel_post_by_id(id)
    sql = "SELECT * FROM travel_posts WHERE id = $1;"
    run_sql(sql, [id])[0]
end

def all_posts()
    run_sql("SELECT * FROM travel_posts ORDER BY name;")
end

def create_post(location, description)
   sql = "INSERT INTO travel_posts (location, description) VALUES ($1, $2);"

   run_sql(sql, [location, description])
end