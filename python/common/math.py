# -*- coding: UTF-8 -*-
import sys
# zui da gong yue shu
def bili(a, b):
    if a > b:
        big = a
        small = b
    else :
        big = a
        small = b

    if big % small == 0 :
        gys = small
    else:
        gys = int(small / 2)
        while not(small % gys == 0 and big % gys == 0) :
            gys = gys - 1

    print 'gysdsfs速度方式的上的=' + str(gys)
    a1 = a/gys
    b1 = b/gys
    print str(a1) + ":" + str(b1)

    i = 0

    while a1 * i <= a :
        i= i+1
        if(a1 * i < 1000):
            continue
        print str(a1 * i) + 'x' + str(b1 * i)

bili(1920,1080)