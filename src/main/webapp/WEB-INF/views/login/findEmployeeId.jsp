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
						<div class="panel-title">사번 찾기</div>
					</div>
					<div class="panel-body">
						<form id="login-form">
							<div>
								<input type="text" class="form-control" name="name"
									placeholder="Name" autofocus>
							</div>
							<div>
								<input type="email" class="form-control" name="email"
									placeholder="Email">
							</div>
							<div>
								<button type="submit" class="form-control btn btn-primary">찾기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<div class="panel panel-default">
	<div class="panel-body">
		<div class="container">
			<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-success">
					<div class="panel-heading">
						<div class="panel-title">비밀번호 변경</div>
					</div>
					<div class="panel-body">
						<form id="login-form">
							<div>
								<input type="text" class="form-control" name="employeeId"
									placeholder="Employee ID" autofocus>
							</div>
							<div>
								<input type="text" class="form-control" name="name"
									placeholder="Name" autofocus>
							</div>
							<div>
								<input type="email" class="form-control" name="email"
									placeholder="Email">
							</div>
							<div>
								<button type="submit" class="form-control btn btn-primary">비밀번호 변경</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>







