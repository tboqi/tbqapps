from django.conf.urls import patterns, include, url

urlpatterns = patterns('person.views', 
    url(r'^$', 'index'),
    url(r'^login/$', 'login'),
    url(r'^logout/$', 'logout'),
    url(r'^regist/$', 'regist'),
)