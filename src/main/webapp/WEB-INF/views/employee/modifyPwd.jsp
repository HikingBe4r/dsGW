<%-- findEmpPwd.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<form action="${pageContext.request.contextPath }/successPwd.do"
	method="post">
	<div class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
					<input type="hidden" name="id" value="${requestScope.id }">
						<label>비밀번호</label> <input type="password" class="form-control"
							name="password" placeholder="Password">
					</div>
					<div class="form-group">
						<label>비밀번호 확인</label> <input type="password" class="form-control"
							placeholder="Password">
					</div>
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-primary"
						onclick="javascript:self.close()">취소</button>

				</div>
			</div>
		</div>
	</div>
</form>