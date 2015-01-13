
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.modules.test.spring.SpringTxTestCase;

import com.yuqi.shop.entity.security.Category;

public class CategoryDaoTest extends SpringTxTestCase  {
	@Autowired
	private CategoryDao entityDao;

	@Test
	public void crudEntity() {
		//new entity and save it. 
		Category entity = new Category(); 
		entityDao.save(entity);
		flush();

		//find entity.	
		Category entityFromDB = entityDao.findUniqueBy("id", entity.getId());
		assertReflectionEquals(entity, entityFromDB);
			
		//delete entity.
		entityDao.delete(entity.getId());
		flush();
		entity = entityDao.findUniqueBy("id", entity.getId());
		assertNull(entity);
	}
}

