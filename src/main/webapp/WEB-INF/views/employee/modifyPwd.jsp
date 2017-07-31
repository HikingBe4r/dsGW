<%-- findEmpPwd.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<script>
	function checkPwd() {
		var pw1 = $("#password").val();
		var pw2 = $("#pwd_check").val();
		if (pw1 != pw2) {
			document.getElementById('checkPwd').style.color = "red";
			document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
		} else {
			document.getElementById('checkPwd').style.color = "black";
			document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다.";
		}
	}
	
	function pwdSumit(frm) {
		if ($('#checkPwd').html() == '암호가 확인 되었습니다.') {
			var url = "${pageContext.request.contextPath }/successPwd.do";
			frm.action = url; //form.action 이 부분이 빠지면 action값을 찾지 못해서 제대로 된 팝업이 뜨질 않습니다.
			frm.method = "post";
			frm.submit();
		} else{
			alert("암호를 확인하세요");
		}
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
					<button type="button" onclick="pwdSumit(this.form)" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-primary"
						onclick="javascript:self.close()">취소</button>

				</div>
			</div>
		</div>
	</div>
</form>