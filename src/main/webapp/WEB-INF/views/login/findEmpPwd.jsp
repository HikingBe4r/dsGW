<%-- findEmpPwd.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script>
	function check() {
		var form = document.authenform;
		var authNum = ${authNum};

		if (!form.authnum.value) {
			alert("인증번호를 입력하세요");
			return false;
		}
		if (form.authnum.value != authNum) {
			alert("인증번호가 잘못되었습니다.");
			form.authnum.value = "";
			return false;
		}
		if (form.authnum.value == authNum) {
			alert("인증 완료");
			location.href = "employee/modifyPwd.do";
		}
	}
</script>
<center>
	<br> <br>
	<div class="container">
		<form method="post" name="authenform" onclick="return check();">
		<div class="panel-title">인증 번호 입력</div>
			<input type="text" name="authnum" class="form-control"><br>
			<br> <input type="button" class="form-control btn btn-primary">
		</form>
	</div>
	</center>