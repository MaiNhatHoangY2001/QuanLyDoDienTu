package com.se.security.demo.controller;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.se.security.demo.entity.Cart;
import com.se.security.demo.entity.CartDetail;
import com.se.security.demo.entity.Customer;
import com.se.security.demo.entity.Product;
import com.se.security.demo.service.CartService;
import com.se.security.demo.service.CustomerService;
import com.se.security.demo.service.ProductService;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private ProductService productService;

	@GetMapping("/cart")
	public String listCart(Model model) {
		Cart cart = cartService.getOrderByIdCustomer(1);
		if (cart != null) {
			List<CartDetail> cartDetails = cartService.getOrderDetailByOrder(cart.getId());
			model.addAttribute("listDetail", cartDetails);
			model.addAttribute("cart", cart);
		}
		return "cart";
	}

	@RequestMapping("/saveOrderAndOpenCart")
	public String saveOrderAndOpenCart(@RequestParam int soLuong, @RequestParam String productId) {
		handleSaveOrder(soLuong, productId);
		return "redirect:/cart";
	}

	@RequestMapping("/saveOrder")
	@ResponseBody
	public void saveOrder(@RequestParam int soLuong, @RequestParam String productId) {
		handleSaveOrder(soLuong, productId);
	}

	public void handleSaveOrder(int soLuong, String productId) {
		Customer customer = customerService.getCustomer(1);
		Product product = productService.getProductById(Integer.parseInt(productId));
		Cart cart = cartService.getOrderByIdCustomer(1);
		
		// kiểm tra khách hàng đã có hóa đơn chưa thanh toán ko?
		// có
		if (cart != null) {
			// tạo chi tiết hóa đơn và thêm vào sql
			List<CartDetail> listCartDetail = cartService.getOrderDetailByOrder(cart.getId());
			CartDetail cartDetail = null;
			for (CartDetail temp : listCartDetail) {
				if (temp.getProduct().getId() == product.getId()) {
					cartDetail = temp;
				}
			}
			if (cartDetail == null) {
				cartDetail = new CartDetail(cart, product, soLuong, tinhGia(product.getPrice(), soLuong));
				cartService.saveCartDetail(cartDetail);
				updateThanhTien(cart);
				cartService.updateCart(cart);
			} else {
				cartDetail.setSoLuong(cartDetail.getSoLuong() + soLuong);
				cartDetail.setGia(tinhGia(product.getPrice(), soLuong));
				cartService.updateCartDetail(cartDetail);
				updateThanhTien(cart);
				cartService.updateCart(cart);
			}
		// không
		} else {
			// tạo hóa đơn và thêm và thêm vào sql
			// tạo chi tiết hóa đơn và thêm vào sql
			cart = new Cart(LocalDate.now(), null, customer, null);
			CartDetail cartDetail = new CartDetail(cart, product, soLuong, tinhGia(product.getPrice(), soLuong));
			
			int thanhTien = Integer.parseInt(cartDetail.getGia().split(" ")[0].replace(".", ""));
			List<CartDetail> listCartDetail = cartService.getOrderDetailByOrder(cart.getId());
			for (CartDetail cd : listCartDetail) {
				String[] item = cd.getGia().split(" ");
				thanhTien += Integer.parseInt(item[0].replace(".", ""));
			}
			DecimalFormat df = new DecimalFormat("#,###,### ₫");
			cart.setThanhTien(df.format(thanhTien).replace(",", "."));
			
			cart.setThanhToan("chưa thanh toán");
			cartService.saveCartDetail(cartDetail);
			cartService.saveCart(cart);
		}
	}

	private void updateThanhTien(Cart cart) {
		int thanhTien = 0;
		List<CartDetail> listCartDetail = cartService.getOrderDetailByOrder(cart.getId());
		for (CartDetail cd : listCartDetail) {
			String[] item = cd.getGia().split(" ");
			thanhTien += Integer.parseInt(item[0].replace(".", ""));
		}
		DecimalFormat df = new DecimalFormat("#,###,### ₫");
		cart.setThanhTien(df.format(thanhTien).replace(",", "."));
	}

	private String tinhGia(String gia, int soLuong) {
		String[] item = gia.split(" ");
		int total = Integer.parseInt(item[0].replace(".", "")) * soLuong;
		DecimalFormat df = new DecimalFormat("#,###,### ₫");
		return df.format(total).replace(",", ".");
	}
	
	
}
