
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.modules.test.spring.SpringTxTestCase;

import com.yuqi.base.entity.security.Resource;

public class ResourceDaoTest extends SpringTxTestCase  {
	@Autowired
	private ResourceDao entityDao;

	@Test
	public void crudEntity() {
		//new entity and save it. 
		Resource entity = new Resource(); 
		entityDao.save(entity);
		flush();

		//find entity.	
		Resource entityFromDB = entityDao.findUniqueBy("id", entity.getId());
		assertReflectionEquals(entity, entityFromDB);
			
		//delete entity.
		entityDao.delete(entity.getId());
		flush();
		entity = entityDao.findUniqueBy("id", entity.getId());
		assertNull(entity);
	}
}

