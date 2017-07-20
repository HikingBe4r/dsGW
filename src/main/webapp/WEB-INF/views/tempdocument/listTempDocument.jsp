<%-- listTempDocument.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>

	$(document).ready(function() {
		$('#searchBtn').click(function() {
			$.ajax({
				url: '${pageContext.request.contextPath}/searchTempDocument.do'
				,
				method: 'GET'
				,
				dataType: 'json'
				,
				data: {
					keyfield:  $("select[name='keyfield'] > option:selected").val() ,
					keyword:  $(":text[name='keyword']").val() ,
					startDay:  $(":text[name='startDay']").val() ,
					endDay:  $(":text[name='endDay']").val()
				}
				, 
				cache: false
				,
				success: function(data) {
					$('#tempDocuments').empty(data);
					
					var htmlStr = "";
					
					for (var i = 0 ; i < data.tempDocumentList.length ; i++) {
						htmlStr += "<tr>";
						htmlStr += "<td>&nbsp;&nbsp;" + data.tempDocumentList[i].id + "</td>";
						htmlStr += "<td><a href='/groupware/detailTempDocument.do?id=" + data.tempDocumentList[i].id + "'>" + data.tempDocumentList[i].subject + "</a></td>";
						htmlStr += "<td>" + data.tempDocumentList[i].writeday + "</td>";
						htmlStr += "<td>&nbsp;&nbsp;<input type='checkbox' name='tempDocumentId' value='" + data.tempDocumentList[i].id + "'></td>";
						htmlStr += "</tr>"; 
					}
										
					$('#tempDocuments').append(htmlStr);
					
				}
				,
				error : function(jqXHR) {
					alert("Error : " + jqXHR.responseText);
				}				
				
			});			
		});		
	});

	$(function() {
	    $( "#startDay" ).datepicker({
	    	dateFormat : "yy/mm/dd",
	    	changeMonth: true,
	    	changeYear: true,
	    	showOn: "both",
	        buttonImage: "resources/image/calendar6.png"
	    });
	});
	
	$(function() {
	    $( "#endDay" ).datepicker({
	    	dateFormat : "yy/mm/dd",
	    	changeMonth: true,
	    	changeYear: true,
	    	showOn: "both",
	        buttonImage: "resources/image/calendar6.png"
	    });
	});

</script>

<div>
	<h3>임시문서 목록</h3>
	<form class="form-inline pull-right">
		<div class="form-group">
			<input id="startDay" name="startDay" type="text" class="form-control" style="width: 150px;">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;
			<input id="endDay" name="endDay" type="text" class="form-control" style="width: 150px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select class="form-control" name="keyfield">
				<option value="subject">제목</option>
			</select>
			<input type="text" class="form-control" id="searchKeyword" placeholder="keyword" name="keyword">
		</div>
		<button type="button" class="btn btn-default" id="searchBtn">검색</button>
	</form>
</div>
<br>
<br>

<div style="height: 550px;">
	<table class="table table-striped" align="center">
		<thead>
			<tr>
				<th width="100">번호</th>
				<th>제목</th>
				<th width="200">임시저장일</th>
				<th width="100">비고</th>
			</tr>
		</thead>
		<tbody id="tempDocuments">
			<c:forEach var="tempDocument" items="${requestScope.tempDocumentList }" varStatus="loop">
		 		<c:url var="url" value="/detailTempDocument.do">
		 			<c:param name="id" value="${pageScope.tempDocument.id }" />
		 		</c:url>
		 		<tr>
		 			<%-- <td>${requestScope.paging.num - loop.index }</td> --%>
		 			<td>&nbsp;&nbsp;${pageScope.tempDocument.id }</td> 			
		 			<td><a href="${pageScope.url }">${pageScope.tempDocument.subject }</a></td>
		 			<td>${pageScope.tempDocument.writeday }</td>
		 			<td>&nbsp;&nbsp;<input type="checkbox" name="tempDocumentId" value="${pageScope.tempDocument.id }"></td>
		 		</tr>
		 	</c:forEach>
	 	</tbody>
	</table>
</div>

<div align="right">
	<button type="button">삭제</button>
</div>



<div class="col-md-12" align="center">
	<ul id="pagination" class="pagination">
		<li><a href="#" aria-label="Previous"> <span
				aria-hidden="true">&laquo;</span>
		</a></li>
		<li><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a></li>
	</ul>
</div>