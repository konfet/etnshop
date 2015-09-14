package cz.etn.etnshop.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository("productDao")
public class ProductDaoImpl extends AbstractDao implements ProductDao {

	@Override
	public void createProduct(Product product) {
		persist(product);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getProducts() {
		Criteria criteria = getSession().createCriteria(Product.class);
		// msk add sort by ID
		criteria.addOrder(Order.asc("id"));
		return (List<Product>) criteria.list();
	}

	@Override
	public void deleteProduct(int productId) {
		Query query = getSession().createSQLQuery("delete from Product where id = :id");
		query.setInteger("id", productId);
		query.executeUpdate();
	}

	@Override
	public void updateProduct(Product product) {
		getSession().update(product);

	}

	// ----------------------------------------------
	@Override
	// msk select product object
	public Product getProductById(Integer prodId) {

		Criteria criteria = getSession().createCriteria(Product.class).add(Restrictions.eq("id", prodId));
		Product prod = (Product) criteria.uniqueResult();
		return prod;
	}

	@Override
	// msk search
	public List<Product> search(String queryStr) {

		String sql = "SELECT * FROM product where MATCH (`name`,`serial`) AGAINST ('" + queryStr + "*'  IN BOOLEAN MODE) > 0 order by id";
		System.out.println("msk query to search is: " + sql);
		SQLQuery q = getSession().createSQLQuery(sql);
		q.addEntity(Product.class);
		List<Product> res = q.list();
		return res;
	}

	@Override
	// msk test

	public List<Product> mskSearchTest(String num) {

		/*
		 * SQLQuery q = session.createSQLQuery("select * from ENTITY");
		 * List<Object[]> entities = q.list(); for (Object[] entity : entities)
		 * { for (Object entityCol : entity) { System.out.print(" " +
		 * entityCol); } System.out.println(""); } }
		 */

		// String sql = "from Product order by id asc Limit :num";
		// String sql = "from Product order by id asc Limit " + num;
		String sql = "select * from Product limit " + num;

		SQLQuery q = getSession().createSQLQuery(sql);
		q.addEntity(Product.class);

		List<Product> res = q.list();
		System.out.println("круто!");
		return res;
	}

}
