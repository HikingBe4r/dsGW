<%-- detailForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<div>
	<h3>양식 상세조회</h3>
</div>
<br>
<br>

<div style="height: 550px;">
	<table class="table table-striped">
		<tr>
			<td style="width: 200px;"><label>제목</label></td>
			<td><label id="subject" name="subject">
					${requestScope.form.subject } </label></td>
		</tr>
		<tr>
			<td><label>등록일</label></td>
			<td><label id="writeday" name="writeday" draggable="false">${requestScope.form.writeday }</label>
			</td>
		</tr>
		<tr>
			<td><label>조회수</label></td>
			<td><label id="hitcount" name="hitcount" draggable="false">${requestScope.form.hitcount }</label>
			</td>
		</tr>
		<tr>
			<td><label>첨부파일</label></td>
			<td>${requestScope.form.formFile.originalFileName }</td>
		</tr>

		<tr>
			<td colspan="2">${requestScope.form.content }</td>
		</tr>

	</table>
</div>
<div align="right">
	<button type="button" id="modBtn" name="modBtn">수정</button>
	<button type="button" id="removeBtn" name="removeBtn">삭제</button>
	<button type="button" id="listBtn" name="listBtn">목록으로</button>
</div>



























