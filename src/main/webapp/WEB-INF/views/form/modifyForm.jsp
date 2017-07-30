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
		
		
		$("#modBtn").click(function() {
			if ($('#subject') == null || $('#subject').val() == '') {
				alert("제목을 입력하세요.");
			} else if ($('#content') == null || $('#content').val() == '') {
				alert("설명을 입력하세요.");
			} else if ($('#upload') == null) {
				alert("파일을 첨부하세요.");
			} 
			else {
				obj.getById["formContent"].exec("UPDATE_CONTENTS_FIELD", []);
				$("#modForm").attr("action", "${pageContext.request.contextPath}/modifyForm.do");
				$("#modForm").submit();
			}
		});
		
		$("#backBtn").click(function() {
			history.back();
		});
		
		// 스마트 에디터
		var obj = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : obj,
			elPlaceHolder : "formContent",
			sSkinURI : "./resources/editor/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true,
				bUseVerticalResizer : false,
				bUseModeChanger : false
			},
			fOnAppLoad : function() {	//기존 양식 불러오기
				var temp = '${requestScope.form.formContent}';
				obj.getById["formContent"].exec("PASTE_HTML", [temp]); 	
			}

		});
		
		/* // 스마트에디터
		var obj = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : obj,
			elPlaceHolder : "formContent",
			sSkinURI : "./resources/editor/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true,
				bUseVerticalResizer : false,
				bUseModeChanger : false
			},
			fOnAppLoad : function() {	//기존 양식 불러오기
				var temp = '${requestScope.form.formContent}';
				obj.getById["formContent"].exec("PASTE_HTML", [temp]); 	
			}
		}); */
	});
	
</script>


<div>
	<h3>양식 수정</h3>
</div>
<br>
<br>

<form action="" 
	method="POST" id="modForm" name="modForm" enctype="multipart/form-data">
	<input type="hidden" id="formId" name="id" value="${requestScope.form.id }"/>
	<div style="height: 550px;">

		<table class="table table-striped">
			<tr>
				<td style="width: 200px;"><label>제목</label></td>
				<td><input type="text" id="subject" name="subject" value="${requestScope.form.subject }"/></td>
			</tr>
			<tr>
				<td><label>첨부파일</label></td>
				<td><input type="file" id="upload" name="upload" 
					value=""/></td>
			</tr>

			<tr>
				<td valign="top"><label>설명</label></td>
				<td><input type="text" id="content" name="content" width="100" value="${requestScope.form.content }"/></td>
			</tr>
			
			<tr>
				<td valign="top"><label>양식</label></td>
				<td><textarea id="formContent" name="formContent" rows="16"></textarea></td>
			</tr>
		</table>
	</div>
	
	<div align="right">
		<button type="button" class="btn btn-primary" id="modBtn" name="modBtn">수정</button>
		<button type="button" class="btn btn-default" id="backBtn" name="backBtn">뒤로가기</button>
	</div>

</form>























