def run_sql(sql, user_inputs = [])
  db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'lorde_forum'})
  results = db.exec_params(sql, user_inputs)
  db.close
  return results
end

def logged_in?

  if session[:user_id]
    return true
  else
    return false
  end
  
end

def current_user

  session[:user_id]

  user = find_user_by_id(session[:user_id])

  return user 

end

