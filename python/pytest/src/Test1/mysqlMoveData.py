# -*- coding: UTF-8 -*-

import mysql.connector
import json


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
# cursor = cnx.cursor(dictionary=True)

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

art_id_list = []
for row in cursor:
#     sql_new_art = "replace into articles (id,title,content, summary, create_time, read_times, update_time, ref, category_id, refurl) values (%s, %s, %s, %s, %s, %s, %s, 1, %s, %s)"
#     if row[7]:
#         update_time = row[7]
#     else:
#         update_time = 0
#         
#     if row[6] == None:
#         refurl = ''
#     else:
#         refurl = row[6]
#          
#     data = (row[0], row[1], row[3], row[2], row[4], row[5], update_time, row[8], refurl)
#     print "art id=", row[0]
#     cursor2.execute(sql_new_art, data);
    art_id_list.append(row[0])

print "#####################tab"
for art_id in art_id_list:
    print art_id
    sql = "SELECT art_tab.`article_id`,t.`id`,t.`tab` FROM `yuqi_tabs` t, `yuqi_article_tab` art_tab WHERE art_tab.`article_id`=%s AND art_tab.`tab_id`=t.`id`"
    cursor.execute(sql, (art_id,))
    
    tabs_detail = []
    for (art_id, tab_id, tab_name) in cursor:
        print "tab id:", tab_id, " art id:", art_id
        sql_insert = "replace into article_tabs (id,tab) values (%(tab_id)s, %(tab_name)s)"
        data = {'tab_id':tab_id, 'tab_name':tab_name}
        cursor2.execute(sql_insert, data)
        
        sql_insert = "replace into article_tab_link values (%(art_id)s, %(tab_id)s)"
        data = {'tab_id':tab_id, 'art_id':art_id}
        cursor2.execute(sql_insert, data)
        
        tabs_detail.append({'id':tab_id,'tab':tab_name})
        
    tabs_detail_json = json.dumps(tabs_detail)
    sql_update_art = "update articles set tabs_detail=%s where id=%s";
    cursor2.execute(sql_update_art, (tabs_detail_json,art_id))
    
cursor2.execute("SET foreign_key_checks = 1");
cnx2.commit()
cursor.close()
cnx.close()
cursor2.close()
cnx2.close()