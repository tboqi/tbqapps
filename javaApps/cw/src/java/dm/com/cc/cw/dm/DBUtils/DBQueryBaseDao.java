package com.cc.cw.dm.DBUtils;

import java.util.ArrayList;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

// Referenced classes of package com.cyberclassics.iad.dbutils:
//            DBBaseDao

public class DBQueryBaseDao extends DBBaseDao
{
    public DBQueryBaseDao()
    {
    }

    /**
     * 返回tablename的表中所有记录
     * 
     * */
    public ArrayList queryAll(ResultSetHandler rsh, String tablename)
    {
        ArrayList result = null;
        try {
            QueryRunner qr = new QueryRunner();
            String sql = (new StringBuilder("select * from ")).append(tablename).toString();
            result = (ArrayList)qr.query(getConnection(), sql, rsh);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return result.isEmpty() ? new ArrayList() : result;
    }
    
    /**
     * 返回tablename的表中,由params指定的所有字段数据
     * @param params为需要查询的字段的列表
     * */
    public ArrayList query(ResultSetHandler rsh, ArrayList<String> params, String tablename) {
        ArrayList result = null;
        try {
            QueryRunner qr = new QueryRunner();
            StringBuilder sb = new StringBuilder();
            sb.append("select ");
            for (int i = 0; i < params.size(); i++) {
            	sb.append(params.get(i));
            }
            sb.append(" from ");
            sb.append(tablename);
            String sql = sb.toString();
            result = (ArrayList)qr.query(getConnection(), sql, rsh);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return result.isEmpty() ? new ArrayList() : result;
    }

    /**
     * 执行sql查询,返回相关数据
     * 
     * */
    public ArrayList executeSqlQuery(ResultSetHandler rsh, String sql) {
        ArrayList result = null;
        try {
            QueryRunner qr = new QueryRunner();
            result = (ArrayList)qr.query(getConnection(), sql, rsh);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return result.isEmpty() ? new ArrayList() : result;
    }

    /**
     * 执行sql更新,包括insert,update和delete,返回相关数据
     * 
     * */
    public int executeSqlUpdate(String sql, String[] values) {
        try {
            QueryRunner qr = new QueryRunner();
            return qr.update(getConnection(), sql, values);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return 0;
     }  
}