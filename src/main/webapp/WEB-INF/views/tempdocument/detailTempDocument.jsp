<%-- detailTempDocument.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
	$(document).ready(function() {
		
		/* // 오늘 날짜 설정
		var now = new Date();
	    var year= now.getFullYear();
	    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();          
	    var today = year + '/' + mon + '/' + day;      
	    $('#endDate').val(today); */
		
		
	    //결재선 버튼 클릭시 팝업
		$('#approvalLine').click(function() {
			var popUrl = "/groupware/addApprover.do";
			window.open(popUrl, 'test', 'width=1200, height=550');
		});
	    
		$("#cancelBtn").click(function() {
			location.href = "${pageContext.request.contextPath}/listTempDocument.do";
		});		
		
	});
	
	//작성일 달력
	$(function() {
	    $( "#writeday" ).datepicker({
	    	dateFormat : "yy/mm/dd",
	    	changeMonth: true,
	    	changeYear: true,
	    	showOn: "both", 
	        buttonImage: "resources/image/calendar6.png" 
	    });
	});
	
	//시행일 달력
	$(function() {
	    $( "#endDate" ).datepicker({
	    	dateFormat : "yy/mm/dd",
	    	changeMonth: true,
	    	changeYear: true,
	    	showOn: "both", 
	        buttonImage: "resources/image/calendar6.png" 
	    });
	});	
</script>

<script type="text/javascript">
	 //스마트 에디터
	 $(function(){
	     var obj = [];             
	     nhn.husky.EZCreator.createInIFrame({
	         oAppRef: obj,
	         elPlaceHolder: "content",
	         sSkinURI: "./resources/editor/SmartEditor2Skin.html",
	         htParams : {
	             bUseToolbar : true,           
	             bUseVerticalResizer : false,   
	             bUseModeChanger : true
	         }
	     });
	     $("#insertDocument").click(function(){
	   	  if($('#subject') == null || $('#subject').val() == '') {
	   		  alert("제목을 입력하시오");
	   	  } else if(false){
	   		  /*    		 
	   		  
	   		  		날짜 유효성 체크 + 현재날짜, 시행일 비교
	   	 		  
	   		  */
	   	  } else {  
	          obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	          $("#insertBoardFrm").submit();
	   	  }
	     });
	     
	 });
</script>

<form action="${pageContext.request.contextPath }/detailTempDocument.do" method="post" enctype="multipart/form-data">
	<div>
		<div class="btn-group" role="group" aria-label="...">
			<button type="button" class="btn btn-default" id="approvalLine">결재선</button>
			<button type="submit" class="btn btn-default" formaction="${pageContext.request.contextPath }/modifyTempDocument.do" formmethod="post">임시저장</button>
			<button type="button" class="btn btn-danger" id="cancelBtn">취소</button>
		</div>

		<div class="pull-right">
			<button type="button" id="insertDocument" class="btn btn-primary btn-lg" style="WIDTH: 120pt;">기안</button>
			<button type="submit" id="deleteBtn" class="btn btn-primary btn-lg" style="WIDTH: 120pt;" formaction="${pageContext.request.contextPath }/deleteTempDocument.do" formmethod="post">삭제</button>
		</div>
	</div>
	<br>
	<div class="panel panel-info" style="height: 750px;">
		<div class="panel-heading" align="center">
			<h4>${requestScope.tempDocumentVO.formVO.subject }</h4>
			<input type="hidden" name="formId" value="${requestScope.tempDocumentVO.formVO.id}">
		</div>

		<div class="panel-body">
			<div class="row">
				<div class="col-sm-3">
					<table class="table table-condensed table-bordered">
						<tr>
							<td style="width: 100px;">기안자</td>
							<%-- <td style="width: 100px;">${sessionScope.employee.name } <input type="hidden" name="employeeId" value="${sessionScope.employee.id }" ></td> --%>
							<td style="width: 100px;">${requestScope.tempDocumentVO.writer }<input type="hidden" name="employeeId" value="20170711001"></td>
						</tr>
						<tr>
							<td>소속</td>
							<td>${requestScope.tempDocumentVO.departmentName }</td>
						</tr>
						<tr>
							<td>날짜</td>
							<td><input id="writeday" name="writeday" type="text" class="datepicker" style="width: 150px;" value="${requestScope.tempDocumentVO.writeday }"/></td>
						</tr>
						<tr>
							<td>문서번호</td>
							<td><input type="hidden" id="tempDocumentId" name="id" value="${requestScope.tempDocumentVO.id }"/>${requestScope.tempDocumentVO.id }</td>
						</tr>
						<tr>
							<td>시행일</td>
							<td>
								<%-- <input type="text" name="endDate" value="${requestScope.tempDocumentVO.endDate }"> --%>
								<input id="endDate" name="endDate" type="text" class="datepicker" style="width: 150px;" value="${requestScope.tempDocumentVO.endDate }">
								<!-- <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> -->
							</td>
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
						<!-- <input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력하시오"> -->
						<input type="text" class="form-control" id="subject" name="subject" value="${requestScope.tempDocumentVO.subject }">
					</div>
					<br><br><br>
					<div class="col-sm-12">
						<textarea class="form-control" rows="15" name="content">${requestScope.tempDocumentVO.content }</textarea>
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