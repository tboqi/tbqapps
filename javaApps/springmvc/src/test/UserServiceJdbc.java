package test;

import java.util.HashMap;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class UserServiceJdbc extends JdbcDaoSupport implements UserService {

	@SuppressWarnings("unchecked")
	public void save() {
		String sql = "insert into user (name) values (:name)";
		NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(
				getDataSource());
		Map paraMap = new HashMap();
		paraMap.put("name", "aaa");
		// JdbcTemplate jt = getJdbcTemplate();
		template.update(sql, paraMap);
	}

	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"test/dataAccessContext.xml");
		UserService userService = (UserService)ctx.getBean("userService");
		userService.save();
	}
}
