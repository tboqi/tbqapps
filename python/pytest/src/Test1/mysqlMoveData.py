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

config2 = {
  'user': 'root',
  'password': '',
  'host': '127.0.0.1',
  'database': 'chentublog',
  'charset': 'utf8',
}
cnx2 = mysql.connector.connect(**config2)
cursor2 = cnx2.cursor()

query = "SELECT a.id,a.`title`,a.`summary`,a.`content`,a.create_time, a.read_times, a.`refurl`, a.update_time, ac.category_id, a.refurl FROM `yuqi_articles` a, `yuqi_article_category` ac WHERE ac.`article_id`=a.`id`";
cursor.execute(query);

cursor2.execute("SET foreign_key_checks = 0;");

# for row in cursor:
#     sql_new_art = "replace into articles (id,title,content, summary, create_time, read_times, update_time, ref, category_id, refurl) values (%s, %s, %s, %s, %s, %s, %s, 1, %s, %s)"
#     if row[6]:
#         update_time = row[6]
#     else:
#         update_time = 0
#         
#     data = (row[0], row[1], row[3], row[2], row[4], row[5], update_time, row[7], row[8])
#     cursor2.execute(sql_new_art, data);

cursor2.execute("SET foreign_key_checks = 1");
cnx2.commit()
cursor.close()
cnx.close()