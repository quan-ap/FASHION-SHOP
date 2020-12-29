<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail Product</title>
</head>
<body>
	<section class="product-shop spad page-details">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="filter-widget">
						<h4 class="fw-title">Categories</h4>
						<ul class="filter-catagories">
							<li><a href="#">Men</a></li>
							<li><a href="#">Women</a></li>
							<li><a href="#">Kids</a></li>
						</ul>
					</div>
					<div class="filter-widget">
						<h4 class="fw-title">Brand</h4>
						<div class="fw-brand-check">
							<div class="bc-item">
								<label for="bc-calvin"> Calvin Klein <input
									type="checkbox" id="bc-calvin"> <span class="checkmark"></span>
								</label>
							</div>
							<div class="bc-item">
								<label for="bc-diesel"> Diesel <input type="checkbox"
									id="bc-diesel"> <span class="checkmark"></span>
								</label>
							</div>
							<div class="bc-item">
								<label for="bc-polo"> Polo <input type="checkbox"
									id="bc-polo"> <span class="checkmark"></span>
								</label>
							</div>
							<div class="bc-item">
								<label for="bc-tommy"> Tommy Hilfiger <input
									type="checkbox" id="bc-tommy"> <span class="checkmark"></span>
								</label>
							</div>
						</div>
					</div>
					<div class="filter-widget">
						<h4 class="fw-title">Price</h4>
						<div class="filter-range-wrap">
							<div class="range-slider">
								<div class="price-input">
									<input type="text" id="minamount"> <input type="text"
										id="maxamount">
								</div>
							</div>
							<div
								class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
								data-min="33" data-max="98">
								<div class="ui-slider-range ui-corner-all ui-widget-header"></div>
								<span tabindex="0"
									class="ui-slider-handle ui-corner-all ui-state-default"
									style="left: 0%;"></span> <span tabindex="0"
									class="ui-slider-handle ui-corner-all ui-state-default"
									style="left: 100%;"></span>
								<div class="ui-slider-range ui-corner-all ui-widget-header"
									style="left: 0%; width: 100%;"></div>
							</div>
						</div>
						<a href="#" class="filter-btn">Filter</a>
					</div>
					<div class="filter-widget">
						<h4 class="fw-title">Color</h4>
						<div class="fw-color-choose">
							<div class="cs-item">
								<input type="radio" id="cs-black"> <label
									class="cs-black" for="cs-black">Black</label>
							</div>
							<div class="cs-item">
								<input type="radio" id="cs-violet"> <label
									class="cs-violet" for="cs-violet">Violet</label>
							</div>
							<div class="cs-item">
								<input type="radio" id="cs-blue"> <label class="cs-blue"
									for="cs-blue">Blue</label>
							</div>
							<div class="cs-item">
								<input type="radio" id="cs-yellow"> <label
									class="cs-yellow" for="cs-yellow">Yellow</label>
							</div>
							<div class="cs-item">
								<input type="radio" id="cs-red"> <label class="cs-red"
									for="cs-red">Red</label>
							</div>
							<div class="cs-item">
								<input type="radio" id="cs-green"> <label
									class="cs-green" for="cs-green">Green</label>
							</div>
						</div>
					</div>
					<div class="filter-widget">
						<h4 class="fw-title">Size</h4>
						<div class="fw-size-choose">
							<div class="sc-item">
								<input type="radio" id="s-size"> <label for="s-size">s</label>
							</div>
							<div class="sc-item">
								<input type="radio" id="m-size"> <label for="m-size">m</label>
							</div>
							<div class="sc-item">
								<input type="radio" id="l-size"> <label for="l-size">l</label>
							</div>
							<div class="sc-item">
								<input type="radio" id="xs-size"> <label for="xs-size">xs</label>
							</div>
						</div>
					</div>
					<div class="filter-widget">
						<h4 class="fw-title">Tags</h4>
						<div class="fw-tags">
							<a href="#">Towel</a> <a href="#">Shoes</a> <a href="#">Coat</a>
							<a href="#">Dresses</a> <a href="#">Trousers</a> <a href="#">Men's
								hats</a> <a href="#">Backpack</a>
						</div>
					</div>
				</div>
				<form action="<c:url value='/trang-chu/detail'/>" id="formSubmit"
					method="get">

					<c:set var="item" value="${model}" />
					<div class="row">
						<div class="col-lg-6">
							<div class="product-pic-zoom"
								style="position: relative; overflow: hidden;">
								<img class="product-big-img"
									src="<c:out value="${item.thumbnail}"/>" alt=""
									style="height: 440px; width: 330px">
								<div class="zoom-icon">
									<i class="fa fa-search-plus"></i>
								</div>
								<img role="presentation" alt=""
									src="file:///C:/Users/Asus/Desktop/Java/fashi/img/product-single/product-1.jpg"
									class="zoomImg"
									style="position: absolute; top: -79.3333px; left: -103.8px; opacity: 0; width: 440px; height: 520px; border: none; max-width: none; max-height: none;">
							</div>

						</div>
						<div class="col-lg-6">
							<div class="product-details">
								<div class="pd-title">
									<h3>
										<c:out value="${item.title}" />
									</h3>
									<a href="#" class="heart-icon"><i class="icon_heart_alt"></i></a>
								</div>
								<div class="pd-desc">
									<h5>Description:</h5>
									<p>
										<c:out value="${item.shortDescription}" />
									</p>
									<h4>
										<c:out value="${item.price}$" />
									</h4>
								</div>
								<div class="pd-size-choose">
									<div class="sc-item">
										<input type="radio" id="sm-size"> <label for="sm-size">s</label>
									</div>
									<div class="sc-item">
										<input type="radio" id="md-size"> <label for="md-size">m</label>
									</div>
									<div class="sc-item">
										<input type="radio" id="lg-size"> <label for="lg-size">l</label>
									</div>
									<div class="sc-item">
										<input type="radio" id="xl-size"> <label for="xl-size">xs</label>
									</div>
								</div>
								<div class="quantity">
									<div class="pro-qty">
										<span class="dec qtybtn">-</span> <input type="text" value="1">
										<span class="inc qtybtn">+</span>
									</div>
									<a href="#" class="primary-btn pd-cart">Add To Cart</a>
								</div>
								<ul class="pd-tags">
									<li><span>CATEGORIES: </span> <c:out
											value="${item.categoryCode}" /></li>
								</ul>
								<div class="pd-share">
									<div class="p-code">Sku : 00012</div>
									<div class="pd-social">
										<a href="#"><i class="ti-facebook"></i></a> <a href="#"><i
											class="ti-twitter-alt"></i></a> <a href="#"><i
											class="ti-linkedin"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
</html>