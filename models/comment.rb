require 'pg'

def find_all_comments(post_id)

    sql = "SELECT * FROM comments WHERE post_id = $1 ORDER by id;"

    return run_sql(sql, [post_id])
    
end

def create_comment(user_id, post_id, comment)

    sql = "INSERT INTO comments (user_id, post_id, comment) VALUES($1, $2, $3);"

    return run_sql(sql, [user_id, post_id, comment])
    
end

def find_comment_by_id(id)

    sql = "SELECT * FROM comments where id = $1;"

    return run_sql(sql, [id])[0]

end

def update_comment(comment, id)
   
    sql = "UPDATE comments SET comment = $1 where id = $2;"

    return run_sql(sql, [comment, id])

end

def delete_comment(id)
   
    sql = "DELETE FROM comments WHERE id = $1;"
    
    return run_sql(sql, [id])

end

