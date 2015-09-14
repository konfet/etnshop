package cz.etn.etnshop.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cz.etn.etnshop.dao.Product;

public interface ProductService {

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

	// msk test

	@Transactional(readOnly = false)
	List<Product> mskSearchTest(String num);

}
