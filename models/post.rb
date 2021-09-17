require 'pg'
require 'pry' if development?

def find_all_posts()
    
    sql = "SELECT * FROM posts ORDER by id;"

    return run_sql(sql)

end

def edit_video_link(link)

    remove_first_half = link.slice!("https://youtu.be/")

    return link
    
end

def create_post(title, post_text, image_url, video_url, timestamp, user_id)

    sql = "INSERT INTO posts (title, post_text, image_url, video_url, created_at, user_id) VALUES('#{title.gsub("'","''")}', '#{post_text.gsub("'","''")}', '#{image_url}', '#{video_url}', '#{timestamp}',#{user_id});"

    return run_sql(sql)
    
end

def find_post_by_id(id)

    sql = "SELECT * FROM posts where id = #{id};"

    return run_sql(sql)[0]

end

def delete_post(id)
   
    sql = "DELETE FROM posts WHERE id = #{id};"
    
    return run_sql(sql)

end

def update_post(id, title, post_text, image_url, video_url)
   
    sql = "UPDATE posts SET title = '#{title.gsub("'","''")}', post_text = '#{post_text.gsub("'","''")}', image_url = '#{image_url}', video_url = '#{video_url}' where id = #{id};"

    return run_sql(sql)

end