<%-- findEmployeeId.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>

<form action="${pageContext.request.contextPath }/findEmpId.do"
	method="post">
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="container">
				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-success">
						<div class="panel-heading">
							<div class="panel-title">사번 찾기</div>
						</div>
						<div class="panel-body">
							<div>
								<input type="text" class="form-control" name="name1"
									placeholder="Name" autofocus>
							</div>
							<div>
								<input type="email" class="form-control" name="email1"
									placeholder="Email">
							</div>
							<div style="margin: auto">
								<button type="submit" class="btn btn-primary" >찾기</button>
								<button type="button" class="btn btn-primary" 
									onclick="javascript:self.close()">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

<form action="${pageContext.request.contextPath }/findEmpPwd.do"
	method="post">
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="container">
				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-success">
						<div class="panel-heading">
							<div class="panel-title">비밀번호 변경</div>
						</div>
						<div class="panel-body">
							<div>
								<input type="text" class="form-control" name="employeeId2"
									placeholder="Employee ID"
									autofocus>
							</div>
							<div>
								<input type="text" class="form-control" name="name2"
									 placeholder="Name" autofocus>
							</div>
							<div>
								<input type="email" class="form-control" name="email2"
									 placeholder="Email">
							</div>
							<div>
								<button type="submit" class="btn btn-primary">비밀번호
									변경</button>
								<button type="button" class="btn btn-primary"
									onclick="javascript:self.close()">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>




