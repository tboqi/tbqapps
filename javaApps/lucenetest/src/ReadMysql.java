import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

public class ReadMysql {

 public static Connection getConnection() throws SQLException ,
  java.lang.ClassNotFoundException{
  String url = "jdbc:mysql://localhost:3306/khnblog";
  Class.forName("com.mysql.jdbc.Driver");
  String userName = "root";
  String password = "root";
  Connection con = DriverManager.getConnection(url,userName,password);
  return con;
 }

 public static void main(String[] args) {
  try{
   Connection con = getConnection();
   Statement sql = con.createStatement();
   sql.execute("drop table if exists student");
   sql.execute("create table student(id int not null auto_increment,name varchar(250) not null default 'name',math int not null default 60,primary key(id))ENGINE=Myisam CHARSET=GBK;");
   sql.execute("insert student values(1,'english good moring teacher english,tea,invoid,are,99,100 sun jackson','100')");
   sql.execute("insert student values(2,'chinesepyhiscial,wuli,dede',50)");
   sql.execute("insert student values(3,'what is are test desto,target blank','65')");
   String query = "select * from student";
   ResultSet result = sql.executeQuery(query);
   System.out.println("Student表数据如下：");
   System.out.println("---------------------------------");
   System.out.println("学号"+" "+"姓名"+" "+"数学成绩");
   System.out.println("---------------------------------");

   String number;
   String name;
   String math;
//   File indexDir=new File("d:\\luceneIndex");  
   //Analyzer luceneAnalyzer =new StandardAnalyzer();

//   IndexWriter writer = new IndexWrite("d:\\indexnew\\",new StandardAnalyzer(), true);

   File indexDir=new File("d:\\indexnew");
   Analyzer luceneAnalyzer =new StandardAnalyzer(Version.LUCENE_CURRENT);

  try{
   IndexWriter indexWriter =new IndexWriter( FSDirectory.open(indexDir),luceneAnalyzer,true,IndexWriter.MaxFieldLength.UNLIMITED);/*实例一个索引创建器*/

   while(result.next()){

/*========================================*/
    // 增加document到索引去

      // document对象，相当于数据库中一条记录

      Document document = new Document();

/*
public Field(String name,
             String value,
             Field.Store store,
             Field.Index index)Create a field by specifying its name, value and how it will be saved in the index. Term vectors will not be stored in the index.

Parameters:
name - The name of the field
value - The string to process
store - Whether value should be stored in the index
index - Whether the field should be indexed, and if so, if it should be tokenized before indexing

Throws:
NullPointerException - if name or value is null
IllegalArgumentException - if the field is neither stored nor indexed

*/

      document.add(new Field("id", result.getString("id"),  Field.Store.YES, Field.Index.ANALYZED));
      document.add(new Field("name",result.getString("name"), Field.Store.YES, Field.Index.ANALYZED));
      document.add(new Field("math",result.getString("math"), Field.Store.YES, Field.Index.NO));
      System.out.println(result.getString("id") + " " + result.getString("name") + " " + result.getString("math") );

      indexWriter.addDocument(document);/*加入索引器*/
/*========================================*/
   }
      indexWriter.optimize(); /*优化*/
      indexWriter.close(); /*关闭*/
  } catch (IOException e) {
   e.printStackTrace();
   System.out.println(e.getMessage());
  }
   sql.close();
   con.close();
  }catch(java.lang.ClassNotFoundException e){
   System.err.println("ClassNotFoundException:" + e.getMessage());
  }catch(SQLException ex){
   System.err.println("SQLException:" + ex.getMessage());
  }
 }
}