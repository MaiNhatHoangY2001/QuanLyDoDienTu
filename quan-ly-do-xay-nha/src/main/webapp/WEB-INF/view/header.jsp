<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>

    <!--bootstrap5-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!--font chữ-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@200&display=swap" rel="stylesheet">

    <!--slideshow-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/assets/owl.theme.default.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery.min.js@3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/owl.carousel.min.js"></script>

    <!--icon font awesome-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.1/css/all.min.css">

    <link rel="stylesheet" href="/quan-ly-do-xay-nha/resources/css/home.css">

    <script src="/quan-ly-do-xay-nha/resources/js/home.js"></script>
</head>

<body>
    <div class="container">
        <!--header-->
        <div class="header">
            <div id="navbar" class="row">
                <div>
                    <div class="img_logo">
                        <a href="/quan-ly-do-xay-nha/WEB-INF/view/home.jsp"><img style="width: 20%;" src="/quan-ly-do-xay-nha/resources/image/logo_size_1-removebg-preview.png" alt="logo"></a>
                    </div>

                    <p>Sản phẩm</p>

                    <div id="form_chucnang">
                        <!--thanh tìm kiếm-->
                        <input type="search" class="form-control" id="txtTim" placeholder="Tìm kiếm">
                        <button type="submit"><img src="/quan-ly-do-xay-nha/resources/image/icon_kinhlup.png" alt=""></button>

                        <!--user-->
                        <div id="user">
                            <!-- <i class="fa-solid fa-user fa-xl"></i> -->
                            <button id="btnUser"><img src="/quan-ly-do-xay-nha/resources/image/icon_user.png" alt="icon_user"></button>
                        </div>

                        <!--cart:giỏ hàng-->
                        <div id="cart">
                            <button id="btnCart"><img src="/quan-ly-do-xay-nha/resources/image/icon_giohang.png" alt="icon_cart"></button>
                            <span id="soluong" class="text-white">0</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>