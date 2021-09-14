require 'pg'
require 'pry'

def find_all_posts()
    
    sql = "SELECT * FROM posts ORDER by id;"

    return run_sql(sql)

end

def edit_video_link()

    sql = "SELECT video_url FROM posts;"

    hash = run_sql(sql)

    link = hash[0]["video_url"]

    cleaned_link = link.slice!("https://youtu.be/")

    binding.pry
    
end