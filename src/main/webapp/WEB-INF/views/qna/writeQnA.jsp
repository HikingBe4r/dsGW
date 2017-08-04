<%-- writeArticleForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>


<script src="//code.jquery.com/jquery.min.js"></script>
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<script>
   $(document).ready(function(){
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
   <form id="inputForm" action="${pageContext.request.contextPath }/writeQnA.do"   method="post" enctype="multipart/form-data">
      <input type="hidden" name="boardId" value="${param.boardId}">
      <input type="hidden" name="secret" value="${param.secret }">
      <input type="hidden" name="off" value="0">
	  <div class="row">
	  	<div class="col-md-2"><label>비공개 설정  &nbsp;</label><input id="off" type="checkbox"></div>
	  </div>
      <div class="row">
      	<div class="col-md-9"><textarea class='form-control' id="subject" name="subject" rows='1' cols='2' placeholder="제목"></textarea></div>
	  </div>
	  <br>
	  <div class="row">
	  	<div class="col-md-9"><textarea class='form-control' id="content" name="content" required="required" placeholder="문의내용을 작성해주세요" rows='20' cols='2'></textarea></div>
	  </div>
      <div class="row">
      	<div class="col-md-1">파일#1&nbsp;<input type="file" name="upload"></div>
      </div>
      <div class="row">
      	<div class="col-md-1">파일#2&nbsp;<input type="file" name="upload"></div>
      </div>
      <div class="row">
      	<div class="col-md-1">파일#3&nbsp;<input type="file" name="upload"></div>
      </div>
      
      <div class="row">
      	<div class="col-md-4"> </div>
		<div class="col-md-4">
			<input id="insert" class="btn btn-default" type="submit" value="등  록">&nbsp;
			<input class="btn btn-default" type="reset" value="취  소">
		</div>
		<div class="col-md-4"> </div>
      </div>
  </form>




