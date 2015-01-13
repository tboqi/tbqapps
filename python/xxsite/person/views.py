# -*- coding: UTF-8 -*-
from django.shortcuts import render
from django.template import loader, Context
from django.http import HttpResponse, HttpResponseRedirect
from person.models import Person
from common import stringutils

def login(request):
    if request.method == 'POST':
        try:
            person = Person.objects.get(name=request.POST['name'])
            if stringutils.getMd5(request.POST['pwd']) == person.pwd:
                request.session["loginuserid"] = person.id
                msg = '登录成功'
                return HttpResponseRedirect('/person/')
            else:
                msg = '密码错误'
        except Exception, e:
            msg = '没有注册'
        
        return HttpResponse(msg)

    return render(request, 'person/login.html')

def index(request):
    loginuserid = request.session["loginuserid"]
    if loginuserid <= 0:
        return HttpResponseRedirect('/person/login')
    try:
        person = Person.objects.get(id=loginuserid)
    except Exception, e:
        return HttpResponseRedirect('/person/login')

    t = loader.get_template("person/index.html")
    c = Context({'person':person})
    return HttpResponse(t.render(c))

def logout(request):
    request.session["loginuserid"]= 0
    return HttpResponseRedirect('/person/login')

def regist(request):
    if request.method == 'POST':
        msg = ''
        try:
            personCheck = Person.objects.get(name=request.POST['name'])
            msg = '用户名已存在'
        except Exception, e:
            pass

        if request.POST['pwd'] != request.POST['pwd2']:
            msg = '两次输入的密码不相同'

        if msg != '':
            return HttpResponse(msg)
        else:
            person = Person(name=request.POST['name'], pwd=stringutils.getMd5(request.POST['pwd']), email=request.POST['email'])
            person.save()
            request.session["loginuserid"] = person.id
            return HttpResponseRedirect('/person/')

    return render(request, 'person/regist.html')