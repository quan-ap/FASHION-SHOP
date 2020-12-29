<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
</head>
<body>
	<div class="login-form">
		<div class="limiter">
			<div class="container-login100" style="background-image: url('<c:url value='/template/login/images/bg-01.jpg'/>');">
				<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
					<form class="login100-form validate-form"  action="j_spring_security_check" id="formLogin" method="post">
						<span class="login100-form-title p-b-49">
							Login
						</span>
						
						<c:if test="${param.incorrectAccount != null}">
						<div class="alert alert-danger">	
								Username or password incorrect
						</div>
						</c:if>
						<c:if test="${param.accessDenied != null}">
							<div class="alert alert-danger">	
									You not authorize
							</div>
						</c:if>
						
							<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
								<span class="label-input100">Username</span>
								<input type="text" class="input100" id="userName" name="j_username" placeholder="Tên đăng nhập">
								<span class="focus-input100" data-symbol="&#xf206;"></span>
							</div>
		
							<div class="wrap-input100 validate-input" data-validate="Password is required">
								<span class="label-input100">Password</span>
								<input type="password" class="input100" id="password" name="j_password" placeholder="Mật khẩu">
								<span class="focus-input100" data-symbol="&#xf190;"></span>
							</div>
							
							<div class="text-right p-t-8 p-b-31">
								<a href="#">
									Forgot password?
								</a>
							</div>
							
							<div class="container-login100-form-btn">
								<div class="wrap-login100-form-btn">
									<div class="login100-form-bgbtn"></div>
									<button type="submit" class="btn btn-primary login100-form-btn" >Đăng nhập</button>
								</div>
							</div>
						</form>
						
						<div class="txt1 text-center p-t-54 p-b-20">
							<span>
								Or Sign Up Using
							</span>
						</div>
	
						<div class="flex-c-m">
							<a href="#" class="login100-social-item bg1">
								<i class="fa fa-facebook"></i>
							</a>
	
							<a href="#" class="login100-social-item bg2">
								<i class="fa fa-twitter"></i>
							</a>
	
							<a href="#" class="login100-social-item bg3">
								<i class="fa fa-google"></i>
							</a>
						</div>
	
						<div class="flex-col-c p-t-155">
							<span class="txt1 p-b-17">
								Or Sign Up Using
							</span>
	
							<a href="#" class="txt2">
								Sign Up
							</a>
						</div>
				</div>
			</div>
		</div>
	</div>

	<div id="dropDownSelect1"></div>
	
</body>
</html>