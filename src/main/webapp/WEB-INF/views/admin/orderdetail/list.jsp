<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<c:url var="orderURL" value="/quan-tri/order/danh-sach" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách Order</title>
</head>

<body>
	<div class="main-content">
		<form class="form-search"
			action="<c:url value='/quan-tri/order/search'/>">
			<span class="input-icon"> 
			<input type="text" name="nameOrId" class="nav-search-input" placeholder="Search...">
				<button type="submit">
					<i class="ace-icon fa fa-search nav-search-icon"></i>
				</button>
			</span>
		</form>
		<form action="<c:url value='/quan-tri/order/danh-sach'/>" id="formSubmit" method="get">

			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
								chủ</a></li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
						
						<c:if test="${not empty message}">
							<div class="alert alert-${alert}">
							  <strong>${message}</strong>
							</div>
						</c:if>
						
							<div class="widget-box table-filter">
								<div class="table-btn-controls">
									<div class="pull-right tableTools-container">
										<div class="dt-buttons btn-overlap btn-group">
																					
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>Id Order</th>
													<th>Ngày tạo</th>
													<th>Dịa chỉ</th>
													<th>Trạng thái</th>
													<th>Tổng giá</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${model.listResult}">
													<tr>
														<td>${item.id}</td>
														<td>${item.createdDate}</td>
														<td>${item.address}</td>
														<td>${item.status}</td>
														<td>${item.total}</td>
															<c:url var="updateOrderURL" value="/quan-tri/order/chinh-sua">
																<c:param name="id" value="${item.id}"/>
															</c:url>
														<td>
															<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip" title="Cập nhật sản phẩm" href='${updateOrderURL}'><i
																class="fa fa-pencil-square-o" aria-hidden="true"></i> 
															</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<ul class="pagination" id="pagination"></ul>
										<input type="hidden" value="" id="page" name="page"/>
										<input type="hidden" value="" id="limit" name="limit"/>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- /.main-content -->
	<script type="text/javascript">
	
		var totalPages = ${model.totalPage};
		var currentPage = ${model.page};
		
		$(function() {
				window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 10,
				startPage: currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#limit').val(2);
						$('#page').val(page);
						$('#formSubmit').submit();
					}
				}
			});
		});
		
		
	</script>
</body>

</html>