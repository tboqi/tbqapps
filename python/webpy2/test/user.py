#-*- encoding=utf-8 -*-  
import web
import base
import md5
import time

urls = (
        "/regist", "regist",
        "/login", "login",
        "/logout", "logout",
        "/(.*)", "index")

app = web.application(urls, locals())
#render = web.ctx.render
#session = web.ctx.session

class regist:
    def GET(self):
        return web.ctx.render.user.regist()
    
    def POST(self):
        i = web.input()
        username = i.username
        password = i.password
        password2 = i.password2
        if (password != password2) :
            return "2次输入的密码不一致"
        
        m1 = md5.new()
        m1.update(password)
        md5pass = m1.hexdigest()
        n = base.db.insert('admin_user', account=username, password=md5pass, create_time=time.time())
        print n
        if (n > 0):
            web.ctx.session.user_id=n
            print web.ctx.session.user_id
        raise web.seeother('/')
    
class index:
    def GET(self, path):
        #print web.ctx.session.user_id
        return web.ctx.render.user.index()

class login:
    def GET(self):
        return web.ctx.render.user.login()
    
    def POST(self):
        i = web.input()
        username = i.username
        password = i.password
        
        m1 = md5.new()
        m1.update(password)
        md5pass = m1.hexdigest()
        rs = base.db.query("select `password`,id from admin_user where account= $username " , {'username':username})
        datarow = rs[0]
        if (md5pass == datarow.password):
            web.ctx.session.user_id = datarow.id
            raise web.seeother('../index')
        else:
            return "login faild"
        
class logout:
    def GET(self):
        web.ctx.session.user_id=0
        web.ctx.session.kill()
        print web.ctx.session
        raise web.seeother('/login')
