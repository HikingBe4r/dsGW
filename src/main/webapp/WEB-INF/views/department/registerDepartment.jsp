<%-- findEmpPwd.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
<form action="${pageContext.request.contextPath }/registerSuccess.do"
	method="post">
	<div class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
					<input type="hidden" name="id" value="${requestScope.id }">
						<label>부서번호</label> <input type="text" class="form-control"
							name="deptid" placeholder="부서번호 : 부서정보 2자리 + 팀정보 2자리(ex 11 + 01 경영 + 1팀) ">
					</div>
					<div class="form-group">
						<label>부서이름</label> <input type="text" class="form-control"
							name="deptname"  placeholder="부서이름">
					</div>
					<button type="submit" class="btn btn-primary">등록</button>
					<button type="button" class="btn btn-primary"
						onclick="javascript:self.close()">취소</button>

				</div>
			</div>
		</div>
	</div>
</form>