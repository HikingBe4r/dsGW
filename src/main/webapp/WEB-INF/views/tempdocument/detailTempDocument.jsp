<%-- writeDocument.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">
	var hasApprovalLine = false;

	$(document).ready(function() {
		// 오늘 날짜 설정
		var now = new Date();
		var year = now.getFullYear();
		var mon = (now.getMonth() + 1) > 9 ? '' + (now.getMonth() + 1): '0' + (now.getMonth() + 1);
		var day = now.getDate() > 9 ? '' + now.getDate() : '0' + now.getDate();
		var today = year + '/' + mon + '/' + day;
		$('#endDate').val(today);
		$('#writeday').text(today);
		
	});

	//시행일 달력
	$(function() {
		$("#endDate").datepicker({
			dateFormat : "yy/mm/dd",
			changeMonth : true,
			changeYear : true,
			showOn : "both",
			buttonImage : "resources/image/calendar6.png"
		});
	});

	
	//스마트 에디터
	$(function() {
		var obj = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : obj,
			elPlaceHolder : "content",
			sSkinURI : "./resources/editor/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true,
				bUseVerticalResizer : false,
				bUseModeChanger : false
			},
			fOnAppLoad : function() {	//기존 양식 불러오기
				var temp = '${requestScope.tempDocumentVO.content }';
				obj.getById["content"].exec("PASTE_HTML", [temp]); 	
			}

		});

		//기안 버튼
		$("#insertDocument").click(function() {
			if ($('#subject') == null || $('#subject').val() == '') {
				alert("제목을 입력하시오");
			} else if (!isValidDate($('#endDate').val())) {
				alert("유효하지 않은 시행일입니다. (YYYY/MM/DD)\n시행일은 현재 날짜부터 선택가능합니다.");	 
			} else if (!hasApprovalLine) {
				alert("결재선이 없습니다.");
			} else {
				obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
				$("#insertDocumentForm").submit();
			}
		});
		
		//결재선 버튼
		$('#approvalLine').click(function() {
			var popUrl = "${pageContext.request.contextPath }/addApprover.do";
			window.open(popUrl, 'test', 'width=1200, height=750');
		});
		
		//임시저장 버튼
		$('#tempDocument').click(function() {
			 if($('#subject').val().length == 0) {
				alert("제목을 입력하세요.");
			} else {
				obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);		
				$.ajax({
					url: '${pageContext.request.contextPath}/modifyTempDocument.do'
					,
					type: 'POST'
					,
					dataType: 'json'
					,
					data: {
						id: '${requestScope.tempDocumentVO.id}',
						employeeId: '${sessionScope.employee.id}',
						subject: $('#subject').val(),
						content: $('#content').val(),
						endDate: $('#endDate').val(),
	 					formId: '${requestScope.form.id}'
					}
					, 
					cache: false
					,
					success: function(data) {
						location.href = 'listTempDocument.do'; 				
					}
					,
					error : function(jqXHR) {
						alert("Error : " + jqXHR.responseText);
					}			
					
				});
			}
			
			
		});

		//삭제 버튼
		$("#cancel").click(function() {
			$.ajax({
				url: '${pageContext.request.contextPath}/removeTempDocument.do'
				,
				type: 'POST'
				,
				dataType: 'json'
				,
				data: {
					id: '${requestScope.tempDocumentVO.id}',
				}
				, 
				cache: false
				,
				success: function(data) {
					location.href = 'listTempDocument.do'; 				
				}
				,
				error : function(jqXHR) {
					alert("Error : " + jqXHR.responseText);
				}			
				
			});
		});

	});
	
	//결재선 존재 여부 확인
	function checkHasApprovalLine(val) {
		hasApprovalLine = val;
	}
	
	
	//날짜 유효성 체크
	function isValidDate(iDate) {
		if(iDate.length != 10) {
			return false;
		}
		
		oDate = new Date();
		oDate.setFullYear(iDate.substring(0,4));
		oDate.setMonth(parseInt(iDate.substring(5,7)) - 1);
		oDate.setDate(iDate.substring(8));
		if(oDate.getFullYear() != iDate.substring(0,4)
			|| oDate.getMonth() + 1 != iDate.substring(5,7)
			|| oDate.getDate()	!= iDate.substring(8)) {
			return false;
		} 
		var today = new Date();
		if(oDate < today ) {
			return false;
		}
			
		
		return true;
	}

</script>


<form action="${pageContext.request.contextPath }/writeDocument.do"
	method="post" enctype="multipart/form-data" id="insertDocumentForm">
	<!-- 상단 버튼 그룹 -->
	<div>
		<div class="btn-group" role="group" aria-label="...">
			<button type="button" class="btn btn-default" id="approvalLine">결재선</button>
			<button type="button" class="btn btn-default" id="tempDocument">임시저장</button>
			<button type="button" class="btn btn-danger" id="cancel">삭제</button>
		</div>

		<div class="pull-right">
			<button type="button" id="insertDocument"
				class="btn btn-primary btn-lg" style="WIDTH: 120pt;">기안</button>
		</div>
	</div>
	<br>
	<!-- 문서 -->
	<div class="panel panel-info" style="height: 820px;">
		<div class="panel-heading" align="center">
			<h4>${requestScope.form.subject }</h4>
			<input type="hidden" name="formId" value="${requestScope.form.id}">
		</div>

		<div class="panel-body">
			<div class="row">
				<!-- 문서 정보 -->
				<div class="col-sm-3">
					<table class="table table-condensed table-bordered">
						<tr>
							<td style="width: 100px;">기안자</td>
							<td style="width: 100px;">${sessionScope.employee.name }
							<input type="hidden" name="employeeId" value="${sessionScope.employee.id }"></td>	
						</tr>
						<tr>
							<td>소속</td>
							<td>${requestScope.department.name }</td>
						</tr>
						<tr>
							<td>날짜</td>
							<td id="writeday"></td>
						</tr>
						<tr>
							<td>문서번호</td>
							<td></td>
						</tr>
						<tr>
							<td>시행일</td>
							<td><input id="endDate" name="endDate" type="text"
								class="datepicker" style="width: 150px;" /></td>
						</tr>
					</table>
				</div>
				<div class="col-sm-9"></div>
		
			</div>


			<form class="row">
				<div class="form-group">
					<label for="subject" class="col-sm-1 control-label" align="right">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="subject" name="subject" value="${requestScope.tempDocumentVO.subject }">	
					</div>

					<div class="col-sm-12">
						<textarea class="form-control" name="content" id="content" rows="16"></textarea>
					</div>
				</div>
			</form>
			<br>
			<div class="col-sm-12" style="height: 10px;"></div>

			<div class="col-sm-10">
				<dl class="dl-horizontal">
					<div class="col-sm-1"></div>
					<input type="file" name="upload">
				</dl>
				<dl class="dl-horizontal">
					<div class="col-sm-1"></div>
					<input type="file" name="upload">
				</dl>
				<dl class="dl-horizontal">
					<div class="col-sm-1"></div>
					<input type="file" name="upload">
				</dl>
			</div>

		</div>

	</div>
</form>