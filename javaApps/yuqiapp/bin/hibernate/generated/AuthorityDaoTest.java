
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.modules.test.spring.SpringTxTestCase;

import com.yuqi.base.entity.security.Authority;

public class AuthorityDaoTest extends SpringTxTestCase  {
	@Autowired
	private AuthorityDao entityDao;

	@Test
	public void crudEntity() {
		//new entity and save it. 
		Authority entity = new Authority(); 
		entityDao.save(entity);
		flush();

		//find entity.	
		Authority entityFromDB = entityDao.findUniqueBy("id", entity.getId());
		assertReflectionEquals(entity, entityFromDB);
			
		//delete entity.
		entityDao.delete(entity.getId());
		flush();
		entity = entityDao.findUniqueBy("id", entity.getId());
		assertNull(entity);
	}
}

