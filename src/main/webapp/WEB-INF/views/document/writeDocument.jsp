<%-- writeDocument.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>



<script>
	$(document).ready(
			function() {

				// 오늘 날짜 설정
				var now = new Date();
				var year = now.getFullYear();
				var mon = (now.getMonth() + 1) > 9 ? '' + (now.getMonth() + 1)
						: '0' + (now.getMonth() + 1);
				var day = now.getDate() > 9 ? '' + now.getDate() : '0'
						+ now.getDate();
				var today = year + '/' + mon + '/' + day;
				$('#endDate').val(today);

				//결재선 버튼 클릭시 팝업
				$('#approvalLine').click(function() {
					var popUrl = "/groupware/addApprover.do";
					window.open(popUrl, 'test', 'width=1200, height=550');
				});
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
</script>

<script type="text/javascript">
	var hasApprovalLine = false;

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
				bUseModeChanger : true
			}
		});

		//기안 버튼
		$("#insertDocument").click(function() {
			if ($('#subject') == null || $('#subject').val() == '') {
				alert("제목을 입력하시오");
			} else if (false) {
				/*    		 	   		  
						날짜 유효성 체크 + 현재날짜, 시행일 비교  
				 */
			} else if (!flag) {
				alert("결재선이 없습니다.");
			} else {
				obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
				$("#insertBoardFrm").submit();
			}
		});

		//취소 버튼
		$("#cancel").click(function() {
			location.href = 'choiceForm.do';
		});

	});
	
	function checkHasApprovalLine(val) {
		hasApprovalLine = val;
	}
</script>


<form action="${pageContext.request.contextPath }/writeDocument.do"
	method="post" enctype="multipart/form-data" id="insertBoardFrm">
	<div>
		<div class="btn-group" role="group" aria-label="...">
			<button type="button" class="btn btn-default" id="approvalLine">결재선</button>
			<button type="button" class="btn btn-default">임시저장</button>
			<button type="button" class="btn btn-danger" id="cancel">취소</button>
		</div>

		<div class="pull-right">
			<button type="button" id="insertDocument"
				class="btn btn-primary btn-lg" style="WIDTH: 120pt;">기안</button>
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
							<td style="width: 100px;">${sessionScope.employee.name }<input
								type="hidden" name="employeeId"
								value="${sessionScope.employee.id }"></td>


						</tr>
						<tr>
							<td>소속</td>
							<td>${requestScope.department.name }</td>
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
							<td><input id="endDate" name="endDate" type="text"
								class="datepicker" style="width: 150px;" /></td>
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


			<form class="row">
				<div class="form-group">
					<label for="subject" class="col-sm-1 control-label" align="right">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="subject"
							name="subject" placeholder="제목을 입력하시오">
					</div>

					<div class="col-sm-12">
						<textarea class="form-control" name="content" id="content"
							rows="15"></textarea>
					</div>
				</div>
			</form>
			<br>
			<div class="col-sm-12" style="height: 20px;"></div>

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