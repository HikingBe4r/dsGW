<%-- registerForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>

<script>
	if(${sessionScope.admin == null}) {
		alert("관리자만 사용할수 있습니다.");
		document.location.href="${pageContext.request.contextPath}/listForm.do?boardId=1";
	}
	
	$(document).ready(function() {
		
		
		$("#regBtn").click(function() {
			if ($('#subject') == null || $('#subject').val() == '') {
				alert("제목을 입력하세요.");
			} else if ($('#content') == null || $('#content').val() == '') {
				alert("내용을 입력하세요.");
			} else if ($('#upload').val() == '') {
				alert("파일을 첨부하세요.");
			} 
			else {
				obj.getById["formContent"].exec("UPDATE_CONTENTS_FIELD", []);
				$("#regForm").submit();
			}
		});
		
		$("#listBtn").click(function() {
			document.location.href='${pageContext.request.contextPath}/listForm.do?boardId=1';
		});
		
		
		// 스마트에디터
		var obj = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : obj,
			elPlaceHolder : "formContent",
			sSkinURI : "./resources/editor/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true,
				bUseVerticalResizer : false,
				bUseModeChanger : false
			}
		
		});
	});
</script>


<div>
	<h3>양식 등록</h3>
</div>
<br>
<br>

<form action="${pageContext.request.contextPath}/registerForm.do" 
	method="POST" id="regForm" name="regForm" enctype="multipart/form-data">
	
	<div style="height: 550px;">
		<table class="table table-striped">
			<tr>
				<td style="width: 200px;"><label>제목</label></td>
				<td><input type="text" id="subject" name="subject"/></td>
			</tr>
			<tr>
				<td><label>첨부파일</label></td>
				<td><input type="file" id="upload" name="upload"/></td>
			</tr>

			<tr>
				<td valign="top"><label>설명</label></td>
				<td><input type="text" id="content" name="content" width="100"/></td>
			</tr>
			
			<tr>
				<td valign="top"><label>양식</label></td>
				<td><textarea id="formContent" name="formContent" rows="16"></textarea></td>
			</tr>
		</table>
	</div>
	
	<div align="right">
		<button type="button" class="btn btn-primary" id="regBtn" name="regBtn">등록</button>
		<button type="button" class="btn btn-default" id="listBtn" name="listBtn">목록으로</button>
	</div>

</form>























