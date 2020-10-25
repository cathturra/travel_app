require 'pg'

def run_sql(sql, params = [])
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'travel_app'})
    result = db.exec_params(sql, params)
    db.close
    return result
  end

def all_suggestions()
    run_sql("SELECT * FROM travel_suggestions;")
end

def all_culture()
    run_sql("SELECT * FROM culture;")
end

def all_events()
    run_sql("SELECT * FROM events;")
end

def all_accomodation()
    run_sql("SELECT * FROM accomodation;")
end

def culture_by_id(id)
    sql = "SELECT * FROM culture WHERE id = $1;"
    run_sql(sql, [id])[0]
end

def events_by_id(id)
    sql = "SELECT * FROM events WHERE id = $1;"
    run_sql(sql, [id])[0]
end

def accomodation_by_id(id)
    sql = "SELECT * FROM accomodation WHERE id = $1;"
    run_sql(sql, [id])[0]
end