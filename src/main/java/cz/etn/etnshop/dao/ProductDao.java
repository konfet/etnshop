package cz.etn.etnshop.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

public interface ProductDao {

	@Transactional(readOnly = false)
	void createProduct(Product product);

	@Transactional(readOnly = true)
	List<Product> getProducts();

	@Transactional(readOnly = false)
	void deleteProduct(int productId);

	@Transactional(readOnly = false)
	void updateProduct(Product product);

	// msk search and get Product By ID
	// ------------------------------------------------------------

	@Transactional(readOnly = false)
	Product getProductById(Integer prodId);

	@Transactional(readOnly = false)
	List<Product> search(String query);

	// MSK TEST
	@Transactional(readOnly = false)
	List<Product> mskSearchTest(String num);

}
