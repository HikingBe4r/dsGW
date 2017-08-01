<%-- writeArticleForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="//code.jquery.com/jquery.min.js"></script>
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

 <script>
 $(document).ready(function(){
     $('#secret').on('click', function(){
        
        if($(this).prop('checked')) {
           $('input[name=secret]').val("1");
        } else {
           $('input[name=secret]').val("0");
           
        }
        console.log($('input[name=secret]').val());
     });
  });
 
//목록 버튼
$(document).ready(function() {   
	$("#listBtn").click(function() {
		location.href	= 'listBoardAdminForm.do';
	});
});

//등록 버튼
$(document).ready(function() {   
	$("#writeBtn").click(function() {
		location.href	= 'listBoardAdminForm.do';
	});
});
</script>
<div>
	<h3>양식 등록</h3>
</div>
<br>
<br>

<form action="${pageContext.request.contextPath }/writeBoard.do"  method="POST" enctype="multipart/form-data">
	<input type="hidden" name="secret" value="0">
	<div style="height: 550px;">
		<table class="table table-striped">
			<tr>
				<td style="width: 200px;"><label>전체보기</label></td>
				<td><input id="secret" type="checkbox"/></td>
			</tr>
			<tr>
				<td style="width: 200px;"><label>이름</label></td>
				<td><input type="text" id="name" name="name"/></td>
			</tr>
			<tr>
				<td><label>비고</label></td>
				<td><input type="text" id="note" name="note"/></td>
			</tr>
		</table>
	</div>

	<div align="right">
		<button type="submit" class="btn btn-primary" id="listBtn" name="listBtn">등록</button>
		<button type="button" class="btn btn-default" id="listBtn" name="listBtn">목록으로</button>
	</div>

</form>





