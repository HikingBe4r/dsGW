<%-- loginForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/bootstrap/css/jquery.fileupload.css">
<script	src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script	src="https://pingendo.com/assets/bootstrap/bootstrap-4.0.0-alpha.6.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript"
	src="http://s1.daumcdn.net/svc/attach/U03/cssjs/postcode/1495012223804/170517.js"></script>
<script type="text/javascript">
	function checkPwd() {
		var pw1 = document.frm.password.value;
		var pw2 = document.frm.pwd_check.value;
		if (pw1 != pw2) {
			document.getElementById('checkPwd').style.color = "red";
			document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
		} else{
			document.getElementById('checkPwd').style.color = "black";
			document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다.";
		}
	}
	
	$(document).ready(function(){
			$('#email').keyup(function(){
			$.ajax({
				url : '${pageContext.request.contextPath}/checkEmail.do',
				method : 'POST',
				cache : false,
				dataType : 'json',
				data : {
					email: $("#email").val()
				},
				success : function(data) {
					if(data.check == $("#email").val()){
						$('#checkEmail').html('중복된 메일 입니다.');
					}else{
						$('#checkEmail').html('사용 가능한 메일 입니다');
					}
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n"
							+ "message:"
							+ request.responseText + "\n"
							+ "error:" + error);
					console.log("code:" + request.status
							+ "\n" + "message:"
							+ request.responseText + "\n"
							+ "error:" + error);
				}
			});//ajax 완료
		});//click 완료
	});//ready 완료
	

	function empSumit(frm) {
		var f = document.getElementsByTagName('form')[0];
		if ($('#checkEmail').html() == '사용 가능한 메일 입니다' && $('#checkPwd').html() == '암호가 확인 되었습니다.' && f.checkValidity()) {
			var url = "${pageContext.request.contextPath }/registerEmployee.do";
			frm.action = url; //form.action 이 부분이 빠지면 action값을 찾지 못해서 제대로 된 팝업이 뜨질 않습니다.
			frm.method = "post";
			frm.submit();
		} else if ($('#checkEmail').html() != '사용 가능한 메일 입니다') {
			alert("이메일을 확인하세요");
		} else if ($('#checkPwd').html() != '암호가 확인 되었습니다.') {
			alert("암호를 확인하세요");
		}
		
	}
</script>
<form action="${pageContext.request.contextPath }/registerEmployee.do"
	method="post" enctype="multipart/form-data" name="frm" >
	<div class="py-5">
		<div class="container">
			<br>
			<div>

				<div class="col-md-6">
					<div id="holder" style="width: 300px; height: 400px; margin: auto;"></div>
					<div class="btn btn-success fileinput-button" style="margin: auto;">
						<i class="glyphicon glyphicon-plus"></i> <span>사원사진등록</span>
						<input type="file" name="upload" id="upload" >
					</div>
					<div id="holder2" style="width: 300px; height: 400px; margin: auto;"></div>
					<div class="btn btn-success fileinput-button">
						<i class="glyphicon glyphicon-plus"></i> <span>결재정보등록</span>
						<input type="file" name="upload" id="upload">
					</div>
				</div>
				<script>
					var upload = document.getElementsByTagName('input')[0]
					var upload2 = document.getElementsByTagName('input')[1]
					var holder = document.getElementById('holder');
					var holder2 = document.getElementById('holder2');

					upload.onchange = function(e) {
						e.preventDefault();

						var file = upload.files[0], reader = new FileReader();
						reader.onload = function(event) {
							var img = new Image();
							img.style.width = '100%';
							img.style.height = '100%';
							img.src = event.target.result;
							holder.innerHTML = '';
							holder.appendChild(img);
						};
						reader.readAsDataURL(file);

						return false;
					};
					upload2.onchange = function(e) {
						e.preventDefault();

						var file = upload2.files[0], reader = new FileReader();
						reader.onload = function(event) {
							var img = new Image();
							img.style.width = '100%';
							img.style.height = '100%';
							img.src = event.target.result;
							holder2.innerHTML = '';
							holder2.appendChild(img);
						};
						reader.readAsDataURL(file);

						return false;
					};
					
				</script>
				<div class="col-md-6">
					<div class="form-group">
						<label>사번</label> <input type="text" class="form-control" 
							placeholder="사번은 입사일+순번 입니다." disabled="disabled">
					</div>
					<div class="form-group">
						<label>이름</label> <input type="text" class="form-control" required="required"
							placeholder="이름" name="name">
					</div>
					<div class="form-group">
						<label>비밀번호</label> <input type="password" class="form-control" onpaste="return false;"
							placeholder="Password" name="password" >
					</div>
					<div class="form-group">
						<label>비밀번호 확인</label> <input type="password" class="form-control" 
							name="pwd_check" onkeyup="return checkPwd();" onpaste="return false;"
							placeholder="Password Check">
					</div>
					<div id="checkPwd">동일한 암호를 입력하세요.</div>
					<br>
					<div class="form-group">
						<label>이메일</label>
						 <input type="email" class="form-control"
							placeholder="xxxx@xxxx.xxx" name="email" id="email" onpaste="return false;">
					</div>
					<div id="checkEmail">이메일을 입력해주세요</div>
					<br>
					<div class="form-group">
						<label>연락처</label> <input type="text" class="form-control"
							placeholder="000-0000-0000" name="phone">
					</div>
					<div class="form-group">
						<label>주소</label> <input type="text" class="form-control" 
							id="address" placeholder="주소" name="address">
						<button type="button" class="btn btn-primary"
							onclick="sample4_execDaumPostcode()">주소검색</button>
						<script>
							//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
							function sample4_execDaumPostcode() {
								new daum.Postcode(
										{
											oncomplete : function(data) {
												// 우편번호와 주소 정보를 해당 필드에 넣는다.
												document.getElementById('address').value = data.jibunAddress;
												window.close();
											}
										}).open();
							}
						</script>
					</div>
					<div class="form-group">
						<label>상세주소</label> <input type="text" class="form-control" required="required"
							placeholder="상세주소" name="addressDetail">
					</div>

					<label>부서</label><br> <select class="form-control" required="required"
						name="departmentId">
						<c:forEach var="deptList" items="${requestScope.deptList }"
							varStatus="loop">
							<option value="${pageScope.deptList.id}">${pageScope.deptList.name }</option>
						</c:forEach>
					</select> <br> <br> <label>직급</label><br> <select required="required"
						class="form-control" name="gradeId">
						<c:forEach var="gradeList" items="${requestScope.gradeList }"
							varStatus="loop">
							<option value="${loop.count}">${pageScope.gradeList.GRADE }</option>
						</c:forEach>
					</select> <br> <br> <label>상태</label><br> <select required="required"
						class="form-control" name="statusId">
						<c:forEach var="statusList" items="${requestScope.statusList }"
							varStatus="loop">
							<option value="${loop.count}">${pageScope.statusList.STATUS }</option>
						</c:forEach>
					</select> <br> <br>
				</div>
			</div>
			<div>
				<P align=right>
					<button type="button" class="btn btn-primary" onclick="empSumit(this.form)">등록</button>
					<button type="button" class="btn btn-primary" onClick="javascript:history.go(-1);">취소</button>
				</p>
			</div>
		</div>

	</div>
</form>


