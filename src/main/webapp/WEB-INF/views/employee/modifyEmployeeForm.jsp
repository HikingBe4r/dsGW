<%-- loginForm.jsp --%>
<%@page import="com.project.groupware.domain.EmployeeVO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script
	src="https://pingendo.com/assets/bootstrap/bootstrap-4.0.0-alpha.6.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript"
	src="http://s1.daumcdn.net/svc/attach/U03/cssjs/postcode/1495012223804/170517.js"></script>
<%
	EmployeeVO employee = (EmployeeVO)request.getAttribute("findEmployee");
	request.setAttribute("id", employee.getId());
%>
<script>
	function modifypwd() {
		window
				.open('${pageContext.request.contextPath }/modifyPwd.do',
						'비밀번호 변경',
						'width=600, height=450, toolbar=no, menubar=no, scrollbars=no, resizable=yes');
		return false;
	}
</script>
<form action="${pageContext.request.contextPath }/modifyEmployee.do"
	method="post" enctype="multipart/form-data">
	<div class="py-5">

		<div class="container">
			<div>
				<div class="col-md-6">
					<img class="img-fluid d-block" src=""> <input type="file"
						name="upload" class="btn btn-primary">
					<button type="button" class="btn btn-primary">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">삭제</button>
				</div>

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
							value="${requestScope.findEmployee.password}" disabled="disabled">
						<button type="button" class="btn btn-primary"
							onclick="return modifypwd()">비밀번호 변경</button>
					</div>
					<div class="form-group">
						<label>비밀번호 확인</label> <input type="password" class="form-control"
							placeholder="Password Check"
							value="${requestScope.findEmployee.password}" disabled="disabled">
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
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-primary">취소</button>
				</p>
			</div>

		</div>
	</div>
</form>
