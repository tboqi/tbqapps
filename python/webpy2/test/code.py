import web
import user
import base
import admin

urls = (
        '/user', user.app,
        '/admin', admin.app,
        "/(.*)", "index")

app = web.application(urls, globals())
session = web.session.Session(app, base.store)
render = web.template.render('templates', base='layout', globals={'context': session})

def session_hook():
    web.ctx.session = session  
    web.ctx.render = render
  
app.add_processor(web.loadhook(session_hook))  

class index:
    def GET(self, path):
        return web.ctx.render.index()
    
if __name__ == "__main__":
    app.run()

