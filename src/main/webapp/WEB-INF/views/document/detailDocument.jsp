<%-- writeDocument.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js?ver=23"></script>
<script>
	$(document).ready(function() {
		console.log("${requestScope.approvalDocument}");
	});
</script>

<form id="detailDocumentForm">
	<div>
		<div class="btn-group" role="group" aria-label="...">
			<button type="button" class="btn btn-default" id="approvalLine">결재선</button>
			<button type="button" class="btn btn-danger">취소</button>
		</div>

		<div class="pull-right">
			<button type="submit" class="btn btn-primary btn-lg">승인</button>
			<button type="submit" class="btn btn-primary btn-lg btn-danger">반려</button>
		</div>
	</div>
	<br>
	<div class="panel panel-info" style="height: 750px;">
		<div class="panel-heading" align="center">
			<h4> ${requestScope.approvalDocument.document.formVO.subject}</h4>	
			<input type="hidden" name="formId" value="1">
		</div>

		<div class="panel-body">
			<div class="row">
				<div class="col-sm-3">
					<table class="table table-condensed table-bordered">	
						<tr>
							<td style="width: 100px;">기안자</td>
							<td style="width: 100px;">${requestScope.approvalDocument.approverList[0].EMPLOYEENAME }<input type="hidden" name="employeeId" value="20170711001"></td>
						</tr>
						<tr>
							<td>소속 부서</td>
							<td>${requestScope.approvalDocument.approverList[0].DEPARTMENTNAME }</td>
						</tr>
						<tr>
							<td>문서번호</td>
							<td>${requestScope.approvalDocument.document.id }</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td>${requestScope.approvalDocument.document.writeday }</td>
						</tr>
						<tr>
							<td>시행일</td>
							<td>${requestScope.approvalDocument.document.endDate }</td>
						</tr>
					</table>
				</div>
				<div class="col-sm-6"></div>

				<div class="col-sm-3">
					<table class="table table-bordered table-condensed">
						<c:forEach var="i" begin="0" end="1">
							<tr>
							<c:forEach var="j" begin="1" end="${requestScope.approvalDocument.approverList.size()-1 }">
								<c:if test="${i == 0 }">
									<td>${requestScope.approvalDocument.approverList[j].EMPLOYEENAME}</td>	
								</c:if>
								<c:if test="${i == 1}">
									<td style="height: 80px;">${requestScope.approvalDocument.approverList[j].IMAGE}</td>	
								</c:if>
								
							</c:forEach>
							</tr>
						</c:forEach>
						
					</table>
					<div class="col-sm-1"></div>
				</div>
				<div class="pull-right col-sm-1"></div>
			</div>


			<form class="row">
				<div class="form-group">
					<label for="subject" class="col-sm-1 control-label" align="right">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="subject" name="subject"
							placeholder="문서제목" readonly="readonly" value="${requestScope.approvalDocument.document.subject }">
					</div>
					<br> <br> <br>
					<div class="col-sm-12">
						<textarea class="form-control" rows="5" name="content" readonly="readonly">${requestScope.approvalDocument.document.content }</textarea>
					</div>
				</div>
			</form> <br>
			<div class="col-sm-12" style="height: 20px;">
				
			</div>

			<div class="col-sm-10">
				<dl class="dl-horizontal">
					<table>
						<c:forEach var="documentFile" items="${requestScope.approvalDocument.document.documentFileList }" varStatus="loop">
							<tr>
								<td style="width: 100px;"><label>첨부파일 ${loop.index+1 }</label></td>
								<td style="width: 300px;"><a href="#">${documentFile.originalFileName }</a></td>
							</tr>
						</c:forEach>
					</table>
				</dl>
			</div>
		</div>
	</div>
</form>















