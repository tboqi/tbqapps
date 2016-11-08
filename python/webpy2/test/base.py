import web

db = web.database(dbn='mysql', db='webpy_test', user='root', host='127.0.0.1', passwd='111111')

store = web.session.DBStore(db, 'sessions')

