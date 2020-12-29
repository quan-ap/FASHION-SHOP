<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<section class="product-shop spad">
		<div class="container">
			<div class="row">
				<div
					class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
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
				<div class="col-lg-9 order-1 order-lg-2">
					<div class="product-show-option">
						<div class="row">
							<div class="col-lg-7 col-md-7">
								<div class="select-option">
									<select class="sorting" style="display: none;">
										<option value="">Default Sorting</option>
									</select>
									<div class="nice-select sorting" tabindex="0">
										<span class="current">Default Sorting</span>
										<ul class="list">
											<li data-value="" class="option selected">Default
												Sorting</li>
										</ul>
									</div>
									<select class="p-show" style="display: none;">
										<option value="">Show:</option>
									</select>
									<div class="nice-select p-show" tabindex="0">
										<span class="current">Show:</span>
										<ul class="list">
											<li data-value="" class="option selected">Show:</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-lg-5 col-md-5 text-right">
								<p>Show 01- 09 Of 36 Product</p>
							</div>
						</div>
					</div>
					
					<form action="<c:url value='/trang-chu'/>" id="formSubmit" method="get">
					<div class="product-list">
						<div class="row">
							<c:if test="${empty model.listResult}">
							    <h5>NOT FOUND</h5>
							</c:if>
							<c:if test="${not empty model.listResult}">
							    <c:forEach var="item" items="${model.listResult}">
									
									<div class="col-lg-4 col-sm-6">
										<div class="product-item">
											<div class="pi-pic">
												<img
													src="${item.thumbnail}" alt="">
												<div class="icon">
													<i class="icon_heart_alt"></i>
												</div>
												<ul>
													<li class="w-icon active"><a href="#"><i
															class="icon_bag_alt"></i></a></li>
													<li class="quick-view"><a href="#">+ Quick View</a></li>
													<li class="w-icon"><a href="#"><i
															class="fa fa-random"></i></a></li>
												</ul>
											</div>
											<div class="pi-text">
												<div class="catagory-name">${item.categoryCode}</div>
												<a href="<c:url value="/trang-chu/detail?id=${item.id}"/>">
													<h5>${item.title}</h5>
												</a>
												<div class="product-price">
													${item.price}$
												</div>
											</div>
										</div>
									</div>
										
								</c:forEach>
							</c:if>							
								    
							
						</div>
					</div>

						<ul class="pagination justify-content-center" id="pagination"></ul>
						<input type="hidden" value="" id="page" name="page"/>
						<input type="hidden" value="" id="limit" name="limit"/>
						
					</form>	
					
					
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
	
		var totalPages = ${model.totalPage};
		var currentPage = ${model.page};

		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 10,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#limit').val(6);
						$('#page').val(page);
						$('#formSubmit').submit();
					}
				}
			});
		});
		
	</script>
	
</body>
</html>