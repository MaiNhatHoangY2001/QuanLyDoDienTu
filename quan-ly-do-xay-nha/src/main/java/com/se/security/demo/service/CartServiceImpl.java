package com.se.security.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.security.demo.dao.CartDao;
import com.se.security.demo.entity.Cart;
import com.se.security.demo.entity.CartDetail;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDao orderDao;

	@Override
	@Transactional
	public Cart getOrderByIdCustomer(int idKH) {
		return orderDao.getOrderByIdCustomer(idKH);
	}

	@Override
	@Transactional
	public List<CartDetail> getOrderDetailByOrder(int idOrder) {
		return orderDao.getOrderDetailByOrder(idOrder);
	}
}
