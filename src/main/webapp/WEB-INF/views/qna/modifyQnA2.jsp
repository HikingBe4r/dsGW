<%-- modifyArticle.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.project.groupware.domain.ArticleVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<script> 
	$(document).ready(function() {
		
		//파일 번호
		var array = []; 
		$(':button').click(function() {
			array.push($(this).attr('id'));
			$(this).parent().find('#fileNames').empty();
			$(this).parent().html('<div class="col-md-3"><input type="file" name="upload" size="20"></div>');
			$('#fileNo').val(array.join(','));
			console.log('삭제하고자 하는 파일 : ' + array.join());
			$('#fileNo').val(array.join());
		});
		
		
		
		//공개여부 체크박스
		$('#off').on('click', function(){
			if($(this).prop('checked')) {
				$('input[name=off]').val("1");
			} else {
				$('input[name=off]').val("0");
			}
			console.log($('input[name=off]').val());
		});
	});

</script>

<div class="panel panel-default">
	<div class="panel-body">Q n A 게 시 판</div>
</div>
   <form action="${pageContext.request.contextPath}/modifyQnA.do"	method="post" enctype="multipart/form-data">
		<input type="hidden" name="fileNo" value="${param.fileNo}" id="fileNo">
		<input type="hidden" name="id" value="${requestScope.article.id}">
		<input type="hidden" name="off" value="0">
	  <div class="row">
      	<div class="col-md-9"><textarea class='form-control' id="subject" name="subject" rows='1' cols='2' >${requestScope.article.subject}</textarea></div>
	  </div>
	  <br>
	  <div class="row">
	 	<div class="col-md-8"><h3>문의내용</h3></div>
	  	<div class="col-md-3"><label>비공개 설정  &nbsp;</label><input id="off" type="checkbox"></div>
	  	<div class="col-md-1"> </div>
	  </div>
	  <div class="row">
	  	<div class="col-md-9"><textarea class='form-control' id="content" name="content" rows='20' cols='2'>${requestScope.article.content}</textarea></div>
	  </div>
	  
	  	<c:forEach var="files" items="${requestScope.article.files}" varStatus="loop">
			<div class="row">
				<div class="col-md-1" id="fileNames" class="col-md-3">${pageScope.files.originalFileName}</div>
				<div class="col-md-2"><button type="button" id="${pageScope.files.id}">삭제</button></div>
			</div>
		</c:forEach>	
		
		<c:set var="fileCount" value="${fn:length(requestScope.article.files) }" scope="page" />
		<c:if test="${pageScope.fileCount < 3}">
			<c:forEach begin="${fn:length(requestScope.article.files) + 1}"	end="3">
				<div class="row" id="uploadForm">
					<div class="col-md-3"><input type="file" name="upload" size="20"></div>					
				</div>
			</c:forEach>
		</c:if>
			  
      <div class="row">
      	<div class="col-md-4"> </div>
		<div class="col-md-4">
			<input class="btn btn-default" type="submit" value="등  록">&nbsp;
			<input class="btn btn-default" type="reset" value="취  소">
		</div>
		<div class="col-md-4"> </div>
      </div>
  </form>
     