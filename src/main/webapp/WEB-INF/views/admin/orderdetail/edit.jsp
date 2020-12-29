<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="clothesAPI" value="/api/clothes" />
<c:url var="clothesURL" value="/quan-tri/clothes/danh-sach" />
<c:url var="editClothesURL" value="/quan-tri/clothes/chinh-sua" />

<html>
<head>
<title>Chỉnh sửa bài viết</title>
</head>
<body>
<div class="main-content">
	<div class="main-content-inner">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>

				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
					</li>

					<li><a href="#">Forms</a></li>
					<li class="active">Form Elements</li>
				</ul>
			</div>
		</div>

		<div class="page-content">
			<div class="row">
				<div class="col-xs-12"></div>
				
				<c:if test="${not empty message}">
					<div class="alert alert-${alert}">
					  <strong>${message}</strong>
					</div>
				</c:if>
				
				<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model">
					
					<div class="form-group">
					  <label class="col-sm-3 control-label no-padding-right" for="categoryCode">Thể loại:</label>
					  <div class="col-sm-9">
						  <form:select path="categoryCode" id="categoryCode">
						  	<form:option value="" label="-- Chon the loai --"/>
						  	<form:options items="${categories}"/>
						  </form:select>
					  </div>
					</div>
					<div class="form-group">				
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Tên sản phẩm</label>
						<div class="col-sm-9">
							<!-- <input type="text" class="col-xs-10 col-sm-5" id="title" name="title" value="${model.title}"/> -->
							<form:input path="title" cssClass="col-xs-10 col-sm-5"/>
						</div>						
					</div>
					<div class="form-group">				
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Giá</label>
						<div class="col-sm-9">
							<!-- <input type="text" class="col-xs-10 col-sm-5" id="title" name="title" value="${model.title}"/> -->
							<form:input path="price" cssClass="col-xs-10 col-sm-5"/>
						</div>						
					</div>
					<div class="form-group">				
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Số lượng</label>
						<div class="col-sm-9">
							<!-- <input type="text" class="col-xs-10 col-sm-5" id="title" name="title" value="${model.title}"/> -->
							<form:input path="quantity" cssClass="col-xs-10 col-sm-5"/>
						</div>						
					</div>
					<div class="form-group">				
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Ảnh</label>
						<div class="col-sm-9">
							<form:input path="thumbnail" cssClass="col-xs-10 col-sm-5"/>
						</div>						
					</div>
					<div class="form-group">
					  <label class="col-sm-3 control-label no-padding-right" for="shortDescription">mô tả ngắn</label>
					  <div class="col-sm-9">
					  	<!-- <textarea class="form-control" rows="5" cols="10" id="shortDescription" name="shortDescription">${model.shortDescription}</textarea>  -->
					  	<form:textarea path="shortDescription" rows="5" cols="10" cssClass="form-control" id="shortDescription"/>
					  </div>
					</div>
					<div class="form-group">
					  <label class="col-sm-3 control-label no-padding-right" for="content">Chi tiết</label>
					  <div class="col-sm-9">
					  	<form:textarea path="detail" rows="5" cols="10" cssClass="form-control" id="detail"/>
					  </div>
					</div>
					<form:hidden path="id" id="clothesId"/>
					<div class="clearfix form-actions">	
						<div class="col-md-offset-3 col-md-9">
							<c:if test="${not empty model.id}">
								<button class="btn btn-info" type="button" id="btnAddOrUpdateClothes">
									<i class="ace-icon fa fa-check bigger-110"></i>
									Cập nhập sản phẩm
								</button>
							</c:if>
							<c:if test="${empty model.id}">
								<button class="btn btn-info" type="button" id="btnAddOrUpdateClothes">
									<i class="ace-icon fa fa-check bigger-110"></i>
									Thêm sản phẩm
								</button>
							</c:if>
								&nbsp; &nbsp; &nbsp;
							<button class="btn" type="reset">
									<i class="ace-icon fa fa-undo bigger-110"></i>
									Hủy
							</button>
						</div>
					</div>

				</form:form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">


	$('#btnAddOrUpdateClothes').click( function (e) {
		e.preventDefault();
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function(i, v) {
	    	data[""+v.name+""] = v.value;
	    });
		var id = $('#clothesId').val();
		if (id == "") {
			addClothes(data);
		}else {
			updateClothes(data);
		}
	});
	
	function addClothes(data) {
		$.ajax({
            url: '${clothesAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	
            	window.location.href = "${editClothesURL}?id="+result.id+"&message=insert_success";
            	
            	
            },
            error: function (error) {
            	window.location.href = "${clothesURL}?page=1&limit=2&message=error_system";
            	
            	
            }
        });
	};
	
	function updateClothes(data) {
		$.ajax({
            url: '${clothesAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${editClothesURL}?id="+result.id+"&message=update_success";
            },
            error: function (error) {
            	window.location.href = "${editClothesURL}?id="+result.id+"&message=error_system";
            }
        });
	};
</script>
</body>
</html>
