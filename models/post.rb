require 'pg'
require 'pry' if development?

def find_all_posts()
    
    sql = "SELECT * FROM posts ORDER by id;"

    return run_sql(sql)

end

def create_post(title, post_text, image_url, video_url, timestamp, user_id)

    sql = "INSERT INTO posts (title, post_text, image_url, video_url, created_at, user_id) VALUES($1, $2, $3, $4, $5, $6);"

    return run_sql(sql, [title, post_text, image_url, video_url, timestamp, user_id])
    
end

def find_post_by_id(id)

    sql = "SELECT * FROM posts where id = $1;"

    return run_sql(sql, [id])[0]

end

def delete_post(id)
   
    sql = "DELETE FROM posts WHERE id = $1;"
    
    return run_sql(sql, [id])

end

def update_post(title, post_text, image_url, video_url, id)
   
    sql = "UPDATE posts SET title = $1, post_text = $2, image_url = $3, video_url = $4 where id = $5;"

    return run_sql(sql, [title, post_text, image_url, video_url, id])

end

def edit_video_link(link)

    remove_first_half = link.slice!("https://youtu.be/")
  
    return link
    
  end