<%-- detailTempDocument.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<form action="${pageContext.request.contextPath }/detailTempDocument.do" method="post" enctype="multipart/form-data">
	<div>
		<div class="btn-group" role="group" aria-label="...">
			<button type="button" class="btn btn-default">결재선</button>
			<button type="submit" class="btn btn-default" formaction="${pageContext.request.contextPath }/modifyTempDocument.do" formmethod="post">임시저장</button>
			<button type="button" class="btn btn-danger">취소</button>
		</div>
		
		<div class="pull-right">
			<button type="submit" class="btn btn-primary btn-lg">기안</button>
		</div>
	</div>
		
	<br>
	
	<div class="panel panel-info">
		<div class="panel-heading" align="center">
			<h4>휴가신청서</h4>
			<input type="hidden" name="formId" value="1">
		</div>

		<div class="panel-body">
			<div class="row">
				<div class="col-sm-3">
					<table class="table table-condensed table-bordered">
						<tr>
							<td style="width: 100px;">기안자</td>
							<td style="width: 100px;">${requestScope.tempDocumentVO.writer }<input type="hidden" name="employeeId" value="20170711001"></td>
							
						</tr>
						<tr>
							<td>소속</td>
							<td>${requestScope.tempDocumentVO.departmentName }</td>
						</tr>
						<tr>
							<td>날짜</td>
							<td><input type="text" name="writeday" value="${requestScope.tempDocumentVO.writeday }"/></td>
						</tr>
						<tr>
							<td>문서번호</td>
							<td><input type="hidden" name="id" value="${requestScope.tempDocumentVO.id }"/>${requestScope.tempDocumentVO.id }</td>
						</tr>
						<tr>
							<td>시행일</td>
							<td>
								<input type="text" name="endDate" value="${requestScope.tempDocumentVO.endDate }">
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


			<form class="row">
				<div class="form-group">
					<label for="subject" class="col-sm-1 control-label" align="right">제목</label>
					<div class="col-sm-10">
						<!-- <input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력하시오"> -->
						<input type="text" class="form-control" id="subject" name="subject" value="${requestScope.tempDocumentVO.subject }">						
					</div>
					<br> <br> <br>
					<div class="col-sm-12">
						<textarea class="form-control" rows="15" name="content">${requestScope.tempDocumentVO.content }</textarea>
					</div>
				</div>
			</form>
			<br>

			<div class="col-sm-10">
				<dl class="dl-horizontal">
					<dt>
						<button class="btn btn-default" type="button">파일첨부</button>
					</dt>
					<dd>참고자료.hwp</dd>
				</dl>
			</div>
		</div>
	</div>
</form>