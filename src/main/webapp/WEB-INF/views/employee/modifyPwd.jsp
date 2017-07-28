<%-- findEmpPwd.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
	<script>
	function checkPwd() {
		var pw1 = $('#password').value;
		var pw2 = $('#pwd_check').value;
		if (pw1 != pw2) {
			$('#checkPwd').style.color = "red";
			$('#checkPwd').innerHTML = "동일한 암호를 입력하세요.";
		} else if(pw1 > 6 && pw2 > 6){
			$('#checkPwd').style.color = "black";
			$('#checkPwd').innerHTML = "암호가 확인 되었습니다.";
		}
		alert(pw2.html());
	}
	</script>
<form action="${pageContext.request.contextPath }/successPwd.do"
	method="post">
	<div class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
					<input type="hidden" name="id" value="${requestScope.id }">
						<label>비밀번호</label> <input type="password" class="form-control" onpaste="return false;" id="password"
							name="password" placeholder="Password">
					</div>
					
					<div class="form-group">
						<label>비밀번호 확인</label> <input type="password" class="form-control" name="pwd_check" id="pwd_check"
							placeholder="Password" onkeyup="return checkPwd();" onpaste="return false;">
					</div>
					<div id="checkPwd">동일한 암호를 입력하세요.</div>
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-primary"
						onclick="javascript:self.close()">취소</button>

				</div>
			</div>
		</div>
	</div>
</form>