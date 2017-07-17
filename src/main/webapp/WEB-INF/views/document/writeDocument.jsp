<%-- writeDocument.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script>
	$(document).ready(function() {
		$('#approvalLine').click(function() {
			var popUrl = "/groupware/addApprover.do";
			window.open(popUrl, 'test', 'width=1200, height=550');
		});
	});
</script>

<script type="text/javascript">
  $(function(){
      //전역변수
      var obj = [];             
      //스마트에디터 프레임생성
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: obj,
          elPlaceHolder: "content",
          sSkinURI: "./resources/editor/SmartEditor2Skin.html",
          htParams : {
              // 툴바 사용 여부
              bUseToolbar : true,           
              // 입력창 크기 조절바 사용 여부
              bUseVerticalResizer : false,   
              // 모드 탭(Editor | HTML | TEXT) 사용 여부
              bUseModeChanger : true,
          }
      });
      //전송버튼
      $("#insertDocument").click(function(){
    	  if($('#subject') == null || $('#subject').val() == '') {
    		  alert("제목을 입력하시오");
    	  } else {
    	  
	          //id가 smarteditor인 textarea에 에디터에서 대입
	          obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	           //폼 submit
	          $("#insertBoardFrm").submit();
    	  }
      });
      
  });
</script>


<form action="${pageContext.request.contextPath }/writeDocument.do" method="post" enctype="multipart/form-data" id="insertBoardFrm">
	<div>
		<div class="btn-group" role="group" aria-label="...">
			<button type="button" class="btn btn-default" id="approvalLine">결재선</button>
			<button type="button" class="btn btn-default">임시저장</button>
			<button type="button" class="btn btn-danger">취소</button>
		</div>

		<div class="pull-right">
			<button type="button" id="insertDocument" class="btn btn-primary btn-lg" style="WIDTH: 120pt;">기안</button>
		</div>
	</div>
	<br>
	<div class="panel panel-info" style="height: 750px;">
		<div class="panel-heading" align="center">
			<h4>${requestScope.form.subject }</h4>
			<input type="hidden" name="formId" value="${requestScope.form.id}">
		</div>

		<div class="panel-body">
			<div class="row">
				<div class="col-sm-3">
					<table class="table table-condensed table-bordered">
						<tr>
							<td style="width: 100px;">기안자</td>
							<td style="width: 100px;">${sessionScope.employee.name } <input type="hidden" name="employeeId" value="${sessionScope.employee.id }" ></td>
							
							
						</tr>
						<tr>
							<td>소속</td>
							<td>IT 1팀</td>
						</tr>
						<tr>
							<td>날짜</td>
							<td></td>
						</tr>
						<tr>
							<td>문서번호</td>
							<td></td>
						</tr>
						<tr>
							<td>시행일</td>
							<td>2017-08-01 <span class="glyphicon glyphicon-calendar"
								aria-hidden="true"></span>
								<input type="hidden" name="endDate" value="2017/08/01"></td>
						</tr>
					</table>
				</div>
				<div class="col-sm-6"></div>

				<div class="col-sm-3">
					<table class="table table-bordered table-condensed">
						<tr>
							<td>팀장</td>
							<td>부장</td>
						</tr>
						<tr>
							<td>일길동</td>
							<td>이길동</td>
						</tr>
						<tr>
							<td style="height: 80px;"></td>
							<td></td>
						</tr>
					</table>
					<div class="col-sm-1"></div>
				</div>
				<div class="pull-right col-sm-1"></div>
			</div>


			<form class="row" >
				<div class="form-group">
					<label for="subject" class="col-sm-1 control-label" align="right">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="subject" name="subject"
							placeholder="제목을 입력하시오">
					</div>
					
					<div class="col-sm-12">
						<textarea class="form-control" name="content" id="content" rows="15"></textarea>
					</div>
				</div>
			</form> <br>
			<div class="col-sm-12" style="height: 20px;">
				
			</div>

			<div class="col-sm-10">
				<dl class="dl-horizontal">
					<div class="col-sm-1"></div>
					<button class="btn btn-default" type="button">파일첨부</button>
					
					  &nbsp;참고자료.hwp
				</dl>
			</div>

		</div>

	</div>
</form>