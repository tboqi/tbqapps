
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.modules.test.spring.SpringTxTestCase;

import com.yuqi.base.entity.security.Role;

public class RoleDaoTest extends SpringTxTestCase  {
	@Autowired
	private RoleDao entityDao;

	@Test
	public void crudEntity() {
		//new entity and save it. 
		Role entity = new Role(); 
		entityDao.save(entity);
		flush();

		//find entity.	
		Role entityFromDB = entityDao.findUniqueBy("id", entity.getId());
		assertReflectionEquals(entity, entityFromDB);
			
		//delete entity.
		entityDao.delete(entity.getId());
		flush();
		entity = entityDao.findUniqueBy("id", entity.getId());
		assertNull(entity);
	}
}

