<%-- registerForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<div>
	<h3>양식 등록</h3>
</div>
<br>
<br>

<div style="height: 550px;">
	<table class="table table-striped">
		<tr>
			<td style="width: 200px;"><label>제목</label></td>
			<td><input type="text" id="subject" /></td>
		</tr>
		<tr>
			<td><label>첨부파일</label></td>
			<td><input type="file" id="upload"/></td>
		</tr>

		<tr>
			<td colspan="2">
				<textarea rows="30" cols="30"></textarea>
			</td>
		</tr>

	</table>
</div>


<div align="right">
	<button type="button" id="regBtn" name="regBtn">등록</button>
	<button type="button" id="listBtn" name="listBtn">목록으로</button>
</div>

























