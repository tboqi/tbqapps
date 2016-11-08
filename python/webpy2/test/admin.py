#-*- encoding=utf-8 -*-  
import web
import base
import md5
import time

urls = (
        "/main", "main",
        "/login", "login",
        "/logout", "logout",
        "/(.*)", "index")

app = web.application(urls, locals())
render = web.template.render('templates')

class main:
    def GET(self):
        return render.admin.main()
    
class index:
    def GET(self, path):
        return render.admin.index()

