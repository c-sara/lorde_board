require 'pg'

def create_user(username, email, password_digest, avatar_url)

    sql = "INSERT INTO users (username, email, password_digest, avatar_url) VALUES ($1, $2, $3, $4) returning *;"

    new_user = run_sql(sql, [username, email, password_digest, avatar_url])

    return new_user[0]

end

def encrypt_password(password)

    password_digest = BCrypt::Password.create(password)
    
end

def find_user_by_email(email)

    sql = "SELECT * FROM users WHERE email = $1;"

    result = run_sql(sql, [email])

    if result.count > 0
        return result[0]
    else
        return false
    end
    
end

def find_user_by_id(id)

    sql = "SELECT * FROM users WHERE id = $1;"

    result = run_sql(sql, [id])

    if result.count > 0
        return result[0]
    else
        return false
    end
end

