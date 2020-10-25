require 'bcrypt'
require 'pg'

def find_user_by_id(id)
    sql = "SELECT * FROM users WHERE id = $1"
    run_sql(sql, [id])
end

def run_sql(sql, params = [])
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'travel_app'})
    result = db.exec_params(sql, params)
    db.close
    return result
end

def find_user_by_email(email)
    result = run_sql("SELECT * FROM users WHERE email = $1;", [email])
    if result.count == 0 
        return nil
    else 
        return result[0]
    end
end

def find_user_by_name(name)
    result = run_sql("SELECT * FROM users WHERE name = $1;", [name])
    if result.count == 0
        return nil
    else 
        return result[0]
    end
end

def create_user(name, email, password)
    password = BCrypt::Password.create(password)
    sql = "INSERT INTO users (name, email, password) VALUES ($1, $2, $3);"
    run_sql(sql, [name, email, password])
end