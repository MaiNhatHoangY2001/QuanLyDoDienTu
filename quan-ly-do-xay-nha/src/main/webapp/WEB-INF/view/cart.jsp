<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Giỏ hàng</title>

<!--bootstrap5-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<!--font chữ-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@200&display=swap"
	rel="stylesheet">

<!--slideshow-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/assets/owl.theme.default.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery.min.js@3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/owl.carousel.min.js"></script>

<!--icon font awesome-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.1/css/all.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/list_products.css">

<script src="${pageContext.request.contextPath}/resources/js/home.js"></script>
</head>
<body>
	<div class="container">
		<!--header-->
		<div id="frm-header">
			<jsp:include page="header.jsp" />
		</div>

		<!-- breadcum -->
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="./home_before_signup_signin.html">Trang chủ</a></li>
				<li id="breadcrumb-item-active" class="breadcrumb-item active"
					aria-current="page">Giỏ hàng</li>
			</ol>
		</nav>

		<!-- giỏ hàng -->
		<div id="content_cart" class="gh bg-white" style="width: 101%;">
			<h1 class="text-center" style="padding-top: 6px;">
				<b>GIỎ HÀNG</b>
			</h1>
			<div class="row">
				<div class="col col-md-12">
					<table class="table table-bordered">
						<thead>
							<tr style="text-align: center;">
								<th>STT</th>
								<th style="width: 350px;">Ảnh sản phẩm</th>
								<th>Tên sản phẩm</th>
								<th style="width: 132px;">Số lượng</th>
								<th>Đơn giá</th>
								<th>Thành tiền</th>
								<th>Hành động</th>
							</tr>
						</thead>
						<tbody id="datarow">

							<c:forEach var="detail" items="${listDetail}" varStatus="loop">
								<tr style="text-align: center;">
									<td>${loop.index + 1}</td>
									<td><img
										src="${pageContext.request.contextPath}/resources/${detail.product.link}"
										class="hinhdaidien"></td>
									<td>${detail.product.title}</td>
									<td>${detail.soLuong}</td>
									<td>${detail.product.price}</td>
									<td>${detail.gia}</td>
									<td>
										<!-- Nút xóa, bấm vào sẽ xóa thông tin dựa vào khóa chính `sp_ma` -->
										<a id="delete_1" data-sp-ma="2"
										class="btn btn-danger btn-delete-sanpham" href="${pageContext.request.contextPath}/delete/productId=${detail.product.id}/orderId=${detail.cart.id}"> <i
											class="fa fa-trash" aria-hidden="true"></i> <b>Xóa</b>
									</a>
									</td>
								</tr>
							</c:forEach>


							<!-- <tr style="text-align: center;">
								<td>2</td>
								<td><img src="../IMG/img-truyentranh/VN.jpg"
									class="hinhdaidien"></td>
								<td>t2</td>
								<td>1</td>
								<td>50.000 <u>đ</u></td>
								<td>50.000 <u>đ</u></td>
								<td>
									Nút xóa, bấm vào sẽ xóa thông tin dựa vào khóa chính `sp_ma`
									<a id="delete_2" data-sp-ma="6"
									class="btn btn-danger btn-delete-sanpham"> <i
										class="fa fa-trash" aria-hidden="true"></i> <b>Xóa</b>
								</a>
								</td>
							</tr>
							<tr style="text-align: center;">
								<td>3</td>
								<td><img src="../IMG/img-sale/MK.png" class="hinhdaidien">
								</td>
								<td>t3</td>
								<td>4</td>
								<td>150.000 <u>đ</u></td>
								<td>600.000 <u>đ</u></td>
								<td>
									Nút xóa, bấm vào sẽ xóa thông tin dựa vào khóa chính `sp_ma`
									<a id="delete_3" data-sp-ma="4"
									class="btn btn-danger btn-delete-sanpham"> <i
										class="fa fa-trash" aria-hidden="true"></i> <b>Xóa</b>
								</a>
								</td>
							</tr> -->
						<thead>
							<tr>
								<th></th>
								<th></th>
								<th></th>

								<th></th>
								<th>Tổng tiền:</th>
								<th></th>
							</tr>
						</thead>
						<tr style="text-align: center;">
							<td></td>
							<td></td>
							<td></td>

							<td></td>
							<td>${cart.thanhTien}</td>
							<td><a id="modal" data-toggle="modal"
								data-target="#modalChiTiet22" class="btn btn-info "> <b>Thanh
										Toán</b></a></td>
							<!-- 	<div id="modalChiTiet22" class="modal fade">
								<div class="modal-dialog"
									style="border: 5px double greenyellow; width: 2000px;">
									<div class="modal-content">
										<div class="nav-item text-center"
											style="background-color: black;">
											<h4
												style="text-align: center; color: greenyellow; padding-top: 2px;">
												Cảm ơn bạn đã mua hàng!
												</h1>
										</div>
									</div>
								</div>
							</div> -->
						</tr>
						</tbody>
					</table>
					<!-- <h4 style="text-align: center;">(Mẫu giỏ hàng)</h4>
                    <hr style="border: 10px solid black;">
                    <table class="table table-bordered">
                        <thead>
                            <tr style="text-align: center;">
                                <th>STT</th>
                                <th style="width: 350px;">Ảnh bìa sách</th>
                                <th>Tên sản phẩm</th>
                                <th style="width: 132px;">Số lượng</th>
                                <th>Đơn giá</th>
                                <th>Thành tiền</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody id="addDataRow">

                        </tbody>
                    </table> -->
				</div>
				<a href="${pageContext.request.contextPath}/home"
					class="btn btn-warning btn-md"><i class="fa fa-arrow-left"
					aria-hidden="true"></i>&nbsp;Quay về trang chủ</a>
			</div>

			<!--footer-->
			<div id="frm-footer">
				<jsp:include page="footer.jsp" />
			</div>
			<!--nút trở về đầu trang-->
			<div id="backTop">
				<i class="fa-solid fa-arrow-up-long fa-xl" title="Trở về đầu trang"></i>
			</div>
		</div>
	</div>



	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>


	<script type="text/javascript">
	
	$('.btn-delete-sanpham').on('click', function(e){
	    e.preventDefault();
	    var url = this.getAttribute('href');
	    $.ajax({
	      url: url,
	      type: 'GET',
	      dataType: "html",
	      success: function(response) {
	    	  console.log(response)
	      }
	    });
	});
	
	$(document).ready(function() {
		//nút trở về đầu trang
		$(window).scroll(function() {
			if ($(this).scrollTop()) {
				$('#backTop').fadeIn();
			} else {
				$('#backTop').fadeOut();
			}
		});
		$("#backTop").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 100); //100 là 0.1s
		}); 
	})
		<!-- auto complete -->
		$(function() {

			$("#txtTim").autocomplete({
				source : "${pageContext.request.contextPath}/search"
			});
		})
	</script>
</body>
</html>