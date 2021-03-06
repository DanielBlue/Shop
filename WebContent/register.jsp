<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员注册</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<!-- <script type="text/javascript" src= "js/messages_zh"></script> -->
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />

<script type="text/javascript">

	//自定义校验规则		//规则名称			//执行函数
	$.valitor.addMethod("checkUserExisted",function(value,element,params){
		var flag= flase;
		//value:输入的内容
		//element:被校验的元素对象
		//params：规则对应的参数值
		
		$.ajax({
			async:flase,
			success:function(data){
				flag = data.isExist;
			},
			url:"${pageContext.request.contextPath }/user/check",
			data:{"username":value}
		});
		
		return flag;
	});

	$(function() {
		$("#myForm").validate({
			rules:{
				username:{
					"required":true
				},
				password:{
					"required":true
				},
				repassword:{
					"required":true,
					"equalTo":"#password"
				},
				email:{
					"required":true,
					"email":true
				},
				name:{
					"required":true
				},
				sex:{
					"required":true
				},
				birthday:{
					"required":true
				}
			},
			messages:{
				username:{
					"required":"用户名不能为空"
				},
				password:{
					"required":"密码不能为空"
				},
				repassword:{
					"required":"确认密码不能为空",
					"equalTo":"两次密码不一样"
				},
				email:{
					"required":"邮件不能为空",
					"email":"邮件格式不正确"
				},
				name:{
					"required":"姓名不能为空"
				},
				sex:{
					"required":"性别不能为空"
				},
				birthday:{
					"required":"生日不能为空"
				}
			}
		});
	})
</script>

<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.error{
	color:red;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

font {
	color: #3164af;
	font-size: 18px;
	font-weight: normal;
	padding: 0 10px;
}
</style>
</head>
<body>

	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>

	<div class="container"
		style="width: 100%; background: url('image/regist_bg.jpg');">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8"
				style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
				<font>会员注册</font>USER REGISTER
				<form id="myForm" class="form-horizontal" style="margin-top: 5px;">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="username" id="username"
								placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="inputPassword3"
							name = "password"	placeholder="请输入密码">
						</div>
					</div>
					<div class="form-group">
						<label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-6">
							<input name="repassword" type="password" class="form-control" id="confirmpwd"
								placeholder="请输入确认密码">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-6">
							<input type="email" class="form-control" id="inputEmail3"
							name="email"	placeholder="Email">
						</div>
					</div>
					<div class="form-group">
						<label for="usercaption" class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="usercaption"
							name = "name"	placeholder="请输入姓名">
						</div>
					</div>
					<div class="form-group opt">
						<label for="inlineRadio1" class="col-sm-2 control-label">性别</label>
						<div class="col-sm-6">
							<label class="radio-inline"> <input type="radio"
								name="sex" id="inlineRadio1" value="man">
								男
							</label> 
							<label class="radio-inline"> <input type="radio"
								name="sex" id="inlineRadio2" value="woman">
								女
							</label>
							<label class="error" for="sex" style="display:none ">性别不能为空</label>
						</div>
					</div>
					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">出生日期</label>
						<div class="col-sm-6">
							<input name = "birthday" type="date" class="form-control">
						</div>
					</div>

					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">验证码</label>
						<div class="col-sm-3">
							<input type="text" class="form-control">

						</div>
						<div class="col-sm-2">
							<img src="./image/captcha.jhtml" />
						</div>

					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" width="100" value="注册" name="submit"
								style="background: url('./images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
						</div>
					</div>
				</form>
			</div>

			<div class="col-md-2"></div>

		</div>
	</div>

	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>




