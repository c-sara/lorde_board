def run_sql(sql)
    db = PG.connect(dbname: 'lorde_forum')
    results = db.exec(sql)
    db.close
    return results
end