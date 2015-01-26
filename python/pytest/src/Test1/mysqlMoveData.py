# -*- coding: UTF-8 -*-

import mysql.connector


config = {
  'user': 'root',
  'password': '',
  'host': '127.0.0.1',
  'database': 'c321871_khnblog',
  'charset': 'utf8',
#   'raise_on_warnings': True,
}
cnx = mysql.connector.connect(**config)
cursor = cnx.cursor()

query = "select id,title from yuqi_articles where id>%s order by id asc limit 10";
cursor.execute(query, (1,));
for (id,title) in cursor:
    print("{}, {} \n".format(id,title));

cursor.close()
cnx.close()