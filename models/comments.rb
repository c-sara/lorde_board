require 'pg'

def find_all_comments()

    sql = "SELECT * FROM comments ORDER by id;"

    return run_sql(sql)
    
end

def create_comment(user_id, post_id, comment)

    sql = "INSERT INTO comments (user_id, post_id, comment) VALUES(#{user_id}, #{post_id}, '#{comment}');"

    return run_sql(sql)
    
end

def find_comment_by_id(id)

    sql = "SELECT * FROM comments where id = #{id};"

    return run_sql(sql)[0]

end

def delete_comment(id)
   
    sql = "DELETE FROM comments WHERE id = #{id};"
    
    return run_sql(sql)

end

