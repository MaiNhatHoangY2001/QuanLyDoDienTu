package com.se.security.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.se.security.demo.dao.ProductDAO;
import com.se.security.demo.entity.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;

	@Override
	@Transactional
	public List<Product> getProducts() {
		return productDAO.getProducts();
	}

	@Override
	@Transactional
	public List<Product> getProductsByPage(Integer offset, Integer maxResults){
		return productDAO.getProductsByPage(offset, maxResults);
	}

	@Override
	@Transactional
	public Long count() {
		return productDAO.count();
	}

	@Override
	@Transactional
	public List<String> search(String keyword) {
		return productDAO.search(keyword);
	}

}
