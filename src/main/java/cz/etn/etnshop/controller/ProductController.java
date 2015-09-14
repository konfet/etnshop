package cz.etn.etnshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cz.etn.etnshop.dao.Product;
import cz.etn.etnshop.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;
	private String msgStr;

	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("product/list");
		// msk this kind of param injection is better because of "virgin"
		// address string in the browser
		modelAndView.addObject("message", msgStr);
		msgStr = "";
		modelAndView.addObject("products", productService.getProducts());
		return modelAndView;
	}

	@RequestMapping("/add")
	public ModelAndView add() {
		ModelAndView modelAndView = new ModelAndView("product/add");
		return modelAndView;
	}

	@RequestMapping("/edit/{id}")
	public ModelAndView edit(@PathVariable String id) {

		int productId = Integer.parseInt(id);
		Product prod = productService.getProductById(productId);

		ModelAndView modelAndView = new ModelAndView("product/edit");
		modelAndView.addObject("product", prod);
		return modelAndView;

	}

	// msk delete product
	@RequestMapping("/delete/{id}")
	public ModelAndView delete(@PathVariable String id) {

		int productId = Integer.parseInt(id);
		productService.deleteProduct(productId);
		String msg = "Product was successfuly deleted";
		ModelAndView modelAndView = new ModelAndView("redirect:../list");
		msgStr = msg;
		return modelAndView;

	}

	// msk create new product
	@ResponseBody
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView create(@RequestParam String productName, @RequestParam String serial) {
		Product p = new Product();
		p.setName(productName);
		p.setSerial(serial);
		productService.createProduct(p);
		String msg = "Product was successfuly created";
		ModelAndView modelAndView = new ModelAndView("redirect:list");
		msgStr = msg;
		return modelAndView;
	}

	// msk edit existing product
	@ResponseBody
	@RequestMapping(value = "/save/{id}", method = RequestMethod.POST)
	public ModelAndView post(@PathVariable String id, @RequestParam String productName, @RequestParam String serial) {
		Product prod = new Product();
		prod.setName(productName);
		prod.setSerial(serial);
		String msg = "";
		prod.setId(Integer.parseInt(id));
		productService.updateProduct(prod);
		msg = "All changes were applied.";

		ModelAndView modelAndView = new ModelAndView("redirect:../list");
		msgStr = msg;
		return modelAndView;
	}

	// msk search
	@ResponseBody
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView search(@RequestParam String query) {
		if (query == null || query == "") {
			ModelAndView modelAndView = new ModelAndView("redirect:list");
			msgStr = "Wrong query!";
			return modelAndView;
		}

		ModelAndView modelAndView = new ModelAndView("product/list");
		String message = null;
		int counter = 0;
		if (query != null) {
			List<Product> res = productService.search(query);
			counter = res.size();
			if (counter > 0) {
				modelAndView.addObject("products", productService.search(query));
				message = counter + " products founded with '" + query + "':";
			} else {
				message = "No products were founded.";
			}
		}
		modelAndView.addObject("message", message);
		modelAndView.addObject("counter", counter);
		return modelAndView;
	}

	// msk tests

	@RequestMapping("/msktestt")
	public ModelAndView msktest() {
		ModelAndView modelAndView = new ModelAndView("product/msktestt");
		List<Product> prods = productService.getProducts();
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping(value = "/msksearchh", method = RequestMethod.POST)
	public ModelAndView msktest2(@RequestParam String num) {
		ModelAndView modelAndView = new ModelAndView("product/msktestt");
		System.out.println("msksearchh");
		System.out.println("mun = " + num);
		String msg = "this is a very test message for " + num + " lines!!!";
		modelAndView.addObject("message", msg);
		List<Product> prods = productService.mskSearchTest(num);
		System.out.println("Count:" + prods.size());
		modelAndView.addObject("products", prods);

		return modelAndView;
	}

}
