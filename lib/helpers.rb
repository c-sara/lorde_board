def run_sql(sql)
  db = PG.connect(dbname: 'lorde_forum')
  results = db.exec(sql)
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

  return user #return has with keys
    # if user
    #   return user
    # else
    #   return {}
    # end

end