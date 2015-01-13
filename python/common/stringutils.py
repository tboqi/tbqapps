import md5

def getMd5(str):
    m=md5.new()
    m.update(str)
    return m.hexdigest()
