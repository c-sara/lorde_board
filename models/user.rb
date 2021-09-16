require 'pg'

def create_user(username, email, password_digest, avatar_url)

    sql = "INSERT INTO users (username, email, password_digest, avatar_url) VALUES ('#{username}', '#{email}', '#{password_digest}', '#{avatar_url}') returning *;"

    new_user = run_sql(sql)

    return new_user[0]

end

def encrypt_password(password)

    password_digest = BCrypt::Password.create(password)
    
end

def find_user_by_email(email)

    sql = "SELECT * FROM users WHERE email = '#{email}';"

    result = run_sql(sql)

    if result.count > 0
        return result[0]
    else
        return false
    end
    
end

def find_user_by_id(id)
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'lorde_forum'})

    p id

    sql = "SELECT * FROM users WHERE id = #{id};"

    result = db.exec(sql)

    db.close

    if result.count > 0
        return result[0]
    else
        return false
    end
end

