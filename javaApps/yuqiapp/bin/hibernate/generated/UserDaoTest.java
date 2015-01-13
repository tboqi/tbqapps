
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.modules.test.spring.SpringTxTestCase;

import com.yuqi.base.entity.security.User;

public class UserDaoTest extends SpringTxTestCase  {
	@Autowired
	private UserDao entityDao;

	@Test
	public void crudEntity() {
		//new entity and save it. 
		User entity = new User(); 
		entityDao.save(entity);
		flush();

		//find entity.	
		User entityFromDB = entityDao.findUniqueBy("id", entity.getId());
		assertReflectionEquals(entity, entityFromDB);
			
		//delete entity.
		entityDao.delete(entity.getId());
		flush();
		entity = entityDao.findUniqueBy("id", entity.getId());
		assertNull(entity);
	}
}

