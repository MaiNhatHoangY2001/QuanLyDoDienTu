package com.se.security.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.se.security.demo.entity.Product;
import com.se.security.demo.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	@GetMapping("/listProduct")
	public String listProducts(Model theModel, Integer offset, Integer maxResults) {
		List<Product> list = productService.getProductsByPage(offset, maxResults);
		theModel.addAttribute("count", productService.count());
		theModel.addAttribute("offset", offset);
		theModel.addAttribute("products", list);

		return "list-product";
	}

}
