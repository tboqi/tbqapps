#-*- encoding=utf-8 -*-  
import mysql.connector

#单例
class Singleton(object):  
    def __new__(cls, *args, **kw):  
        if not hasattr(cls, '_instance'):  
            orig = super(Singleton, cls)  
            cls._instance = orig.__new__(cls, *args, **kw)  
        return cls._instance  
  
class MyClass(Singleton):  
    a = 1  
    
    def __init__(self):
        self.conn = mysql.connector.connect(user='root', password='',
                              host='127.0.0.1',
                              database='test')
  
one = MyClass()  
two = MyClass()  
  
two.a = 3  
print one.a  
#3  
#one和two完全相同,可以用id(), ==, is检测  
print id(one)  
#29097904  
print id(two)  
#29097904  
print one == two  
#True  
print one is two  
#True  
