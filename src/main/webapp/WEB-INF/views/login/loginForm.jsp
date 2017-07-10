<%-- loginForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>


<div class="panel panel-default">
	<div class="panel-body">
		<div class="container">
			<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-success">
					<div class="panel-heading">
						<div class="panel-title">환영합니다!</div>
					</div>
					<div class="panel-body">
						<form id="login-form">
							<div>
								<input type="text" class="form-control" name="employeeId"
									placeholder="Employee ID" autofocus>
							</div>
							<div>
								<input type="password" class="form-control" name="password"
									placeholder="Password">
							</div>
							<div>
								<button type="submit" class="form-control btn btn-primary">로그인</button>
							</div>
							<div>
								<button type="button" class="form-control btn btn-default">사번찾기 / 비밀번호 변경</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>











