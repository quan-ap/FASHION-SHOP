<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="createCategoryURL" value="/quan-tri/category/chinh-sua"/>
<c:url var ="categoryAPI" value="/api/category"/>
<c:url var="categoryURL" value="/quan-tri/category/danh-sach" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách bài viết</title>
</head>

<body>
	<div class="main-content">
		<form action="<c:url value='/quan-tri/category/danh-sach'/>" id="formSubmit" method="get">

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
											<a flag="info"
												class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Thêm thể loại' href='${createCategoryURL}'> <span>
													<i class="fa fa-plus-circle bigger-110 purple"></i>
											</span>
											</a>
											
											<button id="btnDelete" type="button" onclick="warningBeforeDelete()"
												class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Xóa thể loại'>
												<span> <i class="fa fa-trash-o bigger-110 pink"></i>
												</span>
											</button>
											
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
													<th><input type="checkbox" id="checkAll"></th>
													<th>Tên thể loại</th>
													<th>Mã thể loại</th>
											</thead>
											<tbody>
												<c:forEach var="item" items="${model.listResult}">
													<tr>
														<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
														<td>${item.name}</td>
														<td>${item.code}</td>
															<c:url var="updateCategoryURL" value="/quan-tri/category/chinh-sua">
																<c:param name="id" value="${item.id}"/>
															</c:url>
														<td>
															<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip" title="Cập nhật thể loại" href='${updateCategoryURL}'><i
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
		
		function warningBeforeDelete() {
			swal({
				  title: "Xác nhân xóa",
				  text: "Bạn có xác nhận muốn xóa không!",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonClass: "btn-success",
				  cancelButtonClass: "btn-danger",
				  confirmButtonText: "Xác nhận",
				  cancelButtonText: "Hủy bỏ",
				  closeOnConfirm: false,
				  closeOnCancel: false
				}).then(function(isConfirm) {
				  if (isConfirm) {
					  //var data = {};
						var ids = $('tbody input[type=checkbox]:checked').map(function () {
				            return $(this).val();
				        }).get();
						//data['ids'] = ids;
						deleteCategory(ids);
				  }
				});
		};
		
		function deleteCategory(data) {
	        $.ajax({
	            url: '${categoryAPI}',
	            type: 'DELETE',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            success: function (result) {
	            	window.location.href = "${categoryURL}?page=1&limit=2&message=delete_success";
	            },
	            error: function (error) {
	            	window.location.href = "${categoryURL}?page=1&limit=2&message=error_system";
	            }
	        });
	    };
		
	</script>
</body>

</html>