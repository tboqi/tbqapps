package com.cc.cw.ibatis.handle;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.extensions.ParameterSetter;
import com.ibatis.sqlmap.client.extensions.ResultGetter;
import com.ibatis.sqlmap.client.extensions.TypeHandlerCallback;

/**
 * 用来设置ibatis对enum类型的转换，如需映射enum类型，需要继承此抽象类
 * @author lsd037
 *
 * @param <E>
 */
@SuppressWarnings("unchecked")
public abstract class EnumTypeHandler<E extends Enum> implements TypeHandlerCallback
{
	private Class<E> enumClass_;
	
	public EnumTypeHandler(Class<E> enumClass){
		enumClass_ = enumClass;
	}

	@SuppressWarnings("unchecked")
	public void setParameter(ParameterSetter setter, Object parameter)throws SQLException{
		setter.setString(((E) parameter).name());
	}

	public Object getResult(ResultGetter getter) throws SQLException{
		return valueOf(getter.getString());
	}

	@SuppressWarnings("unchecked")
	public Object valueOf(String s)	{
		return Enum.valueOf(enumClass_, s);
	}
}
