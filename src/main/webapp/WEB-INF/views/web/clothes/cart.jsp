<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="<c:url value='/template/web/cart/Css/header.css' />" />
	<link rel="stylesheet" href="<c:url value='/template/web/cart/Css/footer.css' />" />
	<link rel="stylesheet" href="<c:url value='/template/web/cart/Css/body.css' />" />
	<link rel="stylesheet" href="<c:url value='/template/web/cart/Css/reset.css' />" />
    <link rel="stylesheet" href="<c:url value='/template/web/cart/Library/Toastr Js/toastr.min.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='/template/web/cart/Library/bootrap/css/bootstrap.min.css' />" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;1,200&display=swap"
        rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="<c:url value='/template/web/cart/fontawesome-free-5.13.0-web/css/all.min.css' />" />
    <title>Detail Product</title>
</head>
<body>
	<div class="container">
        <div class="container__wrap-content-cart" id="container__wrap-content-cart">
            <h2 class="container__title">Your cart items</h2>
            <table class="table" id="table">
                <thead class="thead-light">
                    <tr>
                        <th class="table__style-col" scope="col">IMAGE</th>
                        <th class="table__style-col" scope="col">PRODUCT NAME</th>
                        <th class="table__style-col" scope="col">UNIT PRICE</th>
                        <th class="table__style-col" scope="col">QTY</th>
                        <th class="table__style-col" scope="col">SUBTOTAL</th>
                        <th class="table__style-col" scope="col">ACTION</th>
                    </tr>
                </thead>
                <tbody id="view-items-cart"></tbody>
            </table>

            <div class="container__wrap-link">
                <a href="#">Continue Shopping</a>
                <button id="container__wrap-link__btn-clear">
                    Clear Shopping Cart
                </button>
            </div>

            <div class="container__view-total-cart">
                <div class="container__view-total-cart__wrap-content">
                    <h2>Cart Total</h2>
                    <div class="container__view-total-cart__wrap-content__wrap-content-small">
                        <span>Total products</span>
                        <span id="total-products"></span>
                    </div>
                    <div class="container__view-total-cart__wrap-content__wrap-content-small">
                        <span class="container__view-total-cart__wrap-content__wrap-content-small__total">Grand
                            Total</span>
                        <span id="total-item" class="container__view-total-cart__wrap-content__wrap-content-small__total"></span>
                    </div>
                    <a href="#">Proceed to Checkout</a>
                </div>
            </div>
        </div>
    </div>
    
     <div class="back-to-top"><i class="fas fa-angle-double-up"></i></div>
    
    	<script type="module" src="<c:url value='/template/web/cart/Js/index.js' />"></script>
    	<script src="<c:url value='/template/web/cart/Js/main1.js' />"></script>
    	 <script src="<c:url value='/template/web/cart/Library/Jquery/jquery-3.5.1.js' />"></script>
    <script src="<c:url value='/template/web/cart/Library/Jquery/jquery.easing.1.3.js' />"></script>
    <script src="<c:url value='/template/web/cart/Library/Toastr Js/toastr.min.js' />"></script>
</body>
</html>