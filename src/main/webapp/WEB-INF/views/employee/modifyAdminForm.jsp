<%-- loginForm.jsp --%>
<%@page import="com.project.groupware.domain.EmployeeVO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/bootstrap/css/jquery.fileupload.css">

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>

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

	function modifysumit(frm) {
		var url = "${pageContext.request.contextPath }/modifyAdmin.do";
		frm.action = url; //form.action 이 부분이 빠지면 action값을 찾지 못해서 제대로 된 팝업이 뜨질 않습니다.
		frm.method = "post";
		frm.submit();
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
						<label>이메일</label> <input type="email" class="form-control"
							placeholder="xxxx@xxxx.xxx" name="email"
							value="${requestScope.findEmployee.email}">
					</div>
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
												// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

												// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
												// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
												var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
												var extraRoadAddr = ''; // 도로명 조합형 주소 변수

												// 법정동명이 있을 경우 추가한다. (법정리는 제외)
												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
												if (data.bname !== ''
														&& /[동|로|가]$/g
																.test(data.bname)) {
													extraRoadAddr += data.bname;
												}
												// 건물명이 있고, 공동주택일 경우 추가한다.
												if (data.buildingName !== ''
														&& data.apartment === 'Y') {
													extraRoadAddr += (extraRoadAddr !== '' ? ', '
															+ data.buildingName
															: data.buildingName);
												}
												// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
												if (extraRoadAddr !== '') {
													extraRoadAddr = ' ('
															+ extraRoadAddr
															+ ')';
												}
												// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
												if (fullRoadAddr !== '') {
													fullRoadAddr += extraRoadAddr;
												}

												// 우편번호와 주소 정보를 해당 필드에 넣는다.
												document
														.getElementById('address').value = data.jibunAddress;

												// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
												if (data.autoJibunAddress) {
													var expJibunAddr = data.autoJibunAddress;
													document
															.getElementById('guide').innerHTML = '(예상 지번 주소 : '
															+ expJibunAddr
															+ ')';

												} else {
													document
															.getElementById('guide').innerHTML = '';
												}
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