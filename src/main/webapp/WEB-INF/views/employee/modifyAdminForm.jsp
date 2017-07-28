<%-- loginForm.jsp --%>
<%@page import="com.project.groupware.domain.EmployeeVO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="resources/bootstrap/css/jquery.fileupload.css">
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript"
	src="http://s1.daumcdn.net/svc/attach/U03/cssjs/postcode/1495012223804/170517.js"></script>
<script>

	function popup(frm) {
		var url = "${pageContext.request.contextPath }/modifyPwd.do";
		var title = "비밀번호 변경";
		var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=240, height=200, top=0,left=20";
		window.open("", title, status); //window.open(url,title,status); window.open 함수에 url을 앞에와 같이
		//인수로  넣어도 동작에는 지장이 없으나 form.action에서 적용하므로 생략
		//가능합니다.
		frm.target = title; //form.target 이 부분이 빠지면 form값 전송이 되지 않습니다. 
		frm.action = url; //form.action 이 부분이 빠지면 action값을 찾지 못해서 제대로 된 팝업이 뜨질 않습니다.
		frm.method = "post";
		frm.submit();
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
				if(data.check == $("#email").val() && data.check != $('#empEmail').val()){
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


	function modifysumit(frm) {
		if ($('#checkEmail').html() == '사용 가능한 메일 입니다' || $('#checkEmail').html() == '이메일을 입력해주세요') {
			var url = "${pageContext.request.contextPath }/modifyAdmin.do";
			frm.action = url; //form.action 이 부분이 빠지면 action값을 찾지 못해서 제대로 된 팝업이 뜨질 않습니다.
			frm.method = "post";
			frm.submit();
		} else {
			alert("이메일을 확인하세요");
		}
	}
</script>
<form action="${pageContext.request.contextPath }/modifyAdmin.do"
	method="post" enctype="multipart/form-data">
	<div class="py-5">

		<div class="container">
			<div>
				<div class="col-md-6">
					<div id="holder" style="width: 300px; height: 400px; margin: auto;">
					<img src="${pageContext.request.contextPath }/upload/empImage/${requestScope.empImage.systemFileName}" style="width: 100%; height: 100%;">
					</div>
					<div class="btn btn-success fileinput-button">
						<i class="glyphicon glyphicon-plus"></i> <span>등록</span>
						<input type="file" name="upload" id="upload"> 
						
					</div>
					<div id="holder2" style="width: 300px; height: 400px; margin: auto;">
					<img src="${pageContext.request.contextPath }/upload/empImage/${requestScope.empImage2.systemFileName}" style="width: 100%; height: 100%;">
					</div>
					<div class="btn btn-success fileinput-button">
						<i class="glyphicon glyphicon-plus"></i> <span>등록</span>
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
							value="${requestScope.findEmployee.id }"
							placeholder="사번은 입사일+순번 입니다." name="id" readOnly="readOnly">
					</div>
					<div class="form-group">
						<label>이름</label> <input type="text" class="form-control"
							placeholder="이름" name="name"
							value="${requestScope.findEmployee.name}" readOnly="readOnly">
					</div>
					<div class="form-group">
						<label>비밀번호</label> <input type="password" class="form-control"
							placeholder="Password" name="password"
							value="*******" disabled="disabled">
						<button type="button" class="btn btn-primary"
							onclick="popup(this.form)">비밀번호 변경</button>
					</div>
					<div class="form-group">
						<label>비밀번호 확인</label> <input type="password" class="form-control"
							placeholder="Password Check"
							value="*******" disabled="disabled">
					</div>
					<div class="form-group">
						<label>이메일</label>
						 <input type="email" class="form-control" value="${requestScope.findEmployee.email}"
							placeholder="xxxx@xxxx.xxx" name="email" id="email" onpaste="return false;">
							<input type="hidden" id="empEmail" value="${requestScope.findEmployee.email}">
					</div>
					<div id="checkEmail">이메일을 입력해주세요</div>
					<div class="form-group">
						<label>연락처</label> <input type="text" class="form-control"
							placeholder="000-0000-0000" name="phone"
							value="${requestScope.findEmployee.phone}">
					</div>
					<div class="form-group">
						<label>주소</label> <input type="text" class="form-control"
							id="address" placeholder="주소" name="address"
							value="${requestScope.findEmployee.address}">
						<button type="button" class="btn btn-primary"
							onclick="sample4_execDaumPostcode()">주소검색</button>
						<script>
							//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
							function sample4_execDaumPostcode() {
								new daum.Postcode(
										{
											oncomplete : function(data) {
												document
														.getElementById('address').value = data.jibunAddress;
												window.close();
											}
										}).open();
							}
						</script>
					</div>
					<div class="form-group">
						<label>상세주소</label> <input type="text" class="form-control"
							placeholder="상세주소" name="addressDetail"
							value="${requestScope.findEmployee.addressDetail}">
					</div>

					<label>부서</label><br> <select class="form-control"
						name="departmentId">
						<c:forEach var="deptList" items="${requestScope.deptList }"
							varStatus="loop">
							<c:choose>
								<c:when
									test="${requestScope.findEmployee.departmentId == pageScope.deptList.id}">
									<option selected="selected" value="${pageScope.deptList.id}">${pageScope.deptList.name }</option>
								</c:when>
								<c:otherwise>
									<option value="${pageScope.deptList.id}">${pageScope.deptList.name }</option>
								</c:otherwise>
							</c:choose>

						</c:forEach>
					</select> <br> <br> <label>직급</label><br> <select
						class="form-control" name="gradeId">
						<c:forEach var="gradeList" items="${requestScope.gradeList }"
							varStatus="loop">
							<c:choose>
								<c:when
									test="${requestScope.findEmployee.gradeId == loop.count}">
									<option selected="selected" value="${loop.count}">${pageScope.gradeList.GRADE }</option>
								</c:when>
								<c:otherwise>
									<option value="${loop.count}">${pageScope.gradeList.GRADE }</option>
								</c:otherwise>
							</c:choose>

						</c:forEach>
					</select> <br> <br> <label>상태</label><br> <select
						class="form-control" name="statusId">
						<c:forEach var="statusList" items="${requestScope.statusList }"
							varStatus="loop">
							<c:choose>
								<c:when
									test="${requestScope.findEmployee.statusId == loop.count}">
									<option selected="selected" value="${loop.count}">${pageScope.statusList.STATUS }</option>
								</c:when>
								<c:otherwise>
									<option value="${loop.count}">${pageScope.statusList.STATUS }</option>
								</c:otherwise>
							</c:choose>

						</c:forEach>
					</select> <br> <br>
				</div>
			</div>

			<div>
				<P align=right>
					<button type="button" class="btn btn-primary" onclick="modifysumit(this.form)">수정</button>
					<button type="button" class="btn btn-primary">취소</button>
				</p>
			</div>

		</div>
	</div>
</form>
