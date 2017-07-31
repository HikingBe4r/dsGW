<%-- listDocument.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
	function listDocument(data) {
		$('#documents').empty(data);
		
		var htmlStr = "";
		
		for (var i = data.paging.startArticleNum ; i <= data.paging.endArticleNum ; i++) {
			htmlStr += "<tr>";
			htmlStr += '<td id="bookmark">';
			htmlStr += '&nbsp;&nbsp;<button type="button" class="btn btn-default" aria-label="Center Align">';			
			if(data.documentList[i].isBookmark == 0) {
				htmlStr += '<span class="glyphicon glyphicon-star-empty" aria-hidden="true">';
			} else {
				htmlStr += '<span class="glyphicon glyphicon-star" aria-hidden="true">';
			}			
			htmlStr += '<input type="hidden" id="isBookmark" value='+data.documentList[i].isBookmark+' />';
			htmlStr += '<input type="hidden" id="documentId" value='+data.documentList[i].id+' />';
			htmlStr += '</span>';
			htmlStr += '</button>';
			htmlStr += '</td>';
			htmlStr += "<td>" + data.documentList[i].id + "</td>";
			htmlStr += "<td><a href='${pageContext.request.contextPath}/detailApprovalDocument.do?documentId=" + data.documentList[i].id + "'>" + data.documentList[i].subject + "</a></td>";
			htmlStr += "<td>" + data.documentList[i].writeday + "</td>";
			htmlStr += "<td>" + data.documentList[i].endDate + "</td>";
			if (data.status != 6) {
				htmlStr += "<td>" + data.documentList[i].writer + "</td>";
			}			
	 		if (data.myDocs == 1 || data.myDocs == 2 && data.status == 5) {
	 			htmlStr += "<td>&nbsp;&nbsp;" + data.documentList[i].status + "</td>";
	 		}
			htmlStr += "</tr>";
		}
							
		$('#documents').append(htmlStr);
	};
	
	function pagination(data) {
		$("#pagination").empty(data);
		
		var htmlStr = "";		
		
		var prevPage = 
		
		htmlStr += "<li name='pageNum' id='pageNum' value="+data.paging.prevPage+">";
		htmlStr += "<a aria-label='Previous'>";
		htmlStr += '&laquo;';
		htmlStr += "</a>";
		htmlStr += "</li>";
		for(var i = data.paging.startPage; i <= data.paging.endPage; i++) {
			if(data.paging.currentPage == i) {
				htmlStr += "<li class='active' name='pageNum' id='pageNum' value="+ i +">";
			} else {
				htmlStr += "<li name='pageNum' id='pageNum' value="+ i +">";
			}
			htmlStr += "<a>";
			htmlStr += i;
			htmlStr += "</a>";
			htmlStr += "</li>";
		}
		htmlStr += "<li name='pageNum' id='pageNum' value="+data.paging.nextPage+">";
		htmlStr += "<a aria-label='Next'>";
		htmlStr += '&raquo;';
		htmlStr += "</a>";		
		htmlStr += "</li>";
		
		$("#pagination").append(htmlStr);
	};

	$(document).ready(function() {		
		// 오픈되자마자.
		$.ajax({
				url : '${pageContext.request.contextPath}/searchDocument.do'
				,
				method : 'GET'
				,
				cache : false
				,
				dataType : 'json'
				,
				data : {
					keyfield:  $("select[name='keyfield'] > option:selected").val() ,
					keyword:  $(":text[name='keyword']").val() ,
					startDay:  $(":text[name='startDay']").val() ,
					endDay:  $(":text[name='endDay']").val() ,
					searchDay:  $(":radio[name='searchDay']:checked").val() ,
					myDocs:  $(":hidden[name='myDocs']").val() ,
					status:  $(":hidden[name='status']").val() ,
					searchStatus:  $("select[name='searchStatus'] > option:selected").val() ,
					currentPage: "1"
				}
				,
				success : function(data) {
					listDocument(data);
					pagination(data);
				}
				,
				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
		});
		
		$('#searchBtn').click(function() {
			if ($(":text[name='startDay']").val() != '' && $(":text[name='endDay']").val() != '') {
				if ($(":text[name='startDay']").val() > $(":text[name='endDay']").val()) {
					alert('정확한 날짜를 입력하세요.');
					return;
				}
			}
			
			$.ajax({
				url: '${pageContext.request.contextPath}/searchDocument.do'
				,
				method: 'GET'
				,
				dataType: 'json'
				,
				data: {
					keyfield:  $("select[name='keyfield'] > option:selected").val() ,
					keyword:  $(":text[name='keyword']").val() ,
					startDay:  $(":text[name='startDay']").val() ,
					endDay:  $(":text[name='endDay']").val() ,
					searchDay:  $(":radio[name='searchDay']:checked").val() ,
					myDocs:  $(":hidden[name='myDocs']").val() ,
					status:  $(":hidden[name='status']").val() ,
					searchStatus:  $("select[name='searchStatus'] > option:selected").val() ,
					currentPage: "1"
				}
				, 
				cache: false
				,
				success: function(data) {
					listDocument(data);
					pagination(data);
				}
				,
				error : function(jqXHR) {
					alert("Error : " + jqXHR.responseText);
					console.log(jqXHR.responseText);
				}				
				
			});			
		});
		
		$('#searchStatus').change(function() {
			if ($(":text[name='startDay']").val() != '' && $(":text[name='endDay']").val() != '') {
				if ($(":text[name='startDay']").val() > $(":text[name='endDay']").val()) {
					alert('정확한 날짜를 입력하세요.');
					return;
				}
			}
			
			$.ajax({
				url: '${pageContext.request.contextPath}/searchDocument.do'
				,
				method: 'GET'
				,
				dataType: 'json'
				,
				data: {
					keyfield:  $("select[name='keyfield'] > option:selected").val() ,
					keyword:  $(":text[name='keyword']").val() ,
					startDay:  $(":text[name='startDay']").val() ,
					endDay:  $(":text[name='endDay']").val() ,
					searchDay:  $(":radio[name='searchDay']:checked").val() ,
					myDocs:  $(":hidden[name='myDocs']").val() ,
					status:  $(":hidden[name='status']").val() ,
					searchStatus:  $("select[name='searchStatus'] > option:selected").val() ,
					currentPage: "1"
				}
				,
				cache: false
				,
				success: function(data) {
					listDocument(data);
					pagination(data);
				}
				,
				error : function(jqXHR) {
					alert("Error : " + jqXHR.responseText);
					console.log(jqXHR.responseText);
				}				
				
			});
		});		
		
		$("#pagination").on("click", "li", function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/searchDocument.do'
				,
				method : 'GET'
				,
				cache : false
				,
				dataType : 'json'
				,
				data : {
					keyfield:  $("select[name='keyfield'] > option:selected").val() ,
					keyword:  $(":text[name='keyword']").val() ,
					startDay:  $(":text[name='startDay']").val() ,
					endDay:  $(":text[name='endDay']").val() ,
					searchDay:  $(":radio[name='searchDay']:checked").val() ,
					myDocs:  $(":hidden[name='myDocs']").val() ,
					status:  $(":hidden[name='status']").val() ,
					searchStatus:  $("select[name='searchStatus'] > option:selected").val() ,
					currentPage: $(this).val()
				}
				,
				success : function(data) {
					listDocument(data);
					pagination(data);
				}
				,
				error : function(jqXHR) {
					alert("Error : " + jqXHR.responseText);
					console.log(jqXHR.responseText);
				}
				
			});
		});		
		
		// 즐겨찾기 추가/제거
		$('#documents').on("click", "tr > td > button", function() {
			var isBookmark = $(this).children().children().first().val();
			var documentId = $(this).children().children().last().val();
		
			console.log("isbookmark: "+$(this).children().children().first().val()); // hidden1
			console.log("documentId: "+$(this).children().children().last().val()); // hidden2			
			
			// 0: 북마크x, 1: 북마크o
			$.ajax ({
				url: '${pageContext.request.contextPath}/registerMyDocs.do'
				,
				method: 'POST'
				,
				cache: false
				,
				dataType: 'json'
				,
				data : {
					isBookmark : isBookmark,
					documentId : documentId,
					keyfield:  $("select[name='keyfield'] > option:selected").val() ,
					keyword:  $(":text[name='keyword']").val() ,
					startDay:  $(":text[name='startDay']").val() ,
					endDay:  $(":text[name='endDay']").val() ,
					searchDay:  $(":radio[name='searchDay']:checked").val() ,
					myDocs:  $(":hidden[name='myDocs']").val() ,
					status:  $(":hidden[name='status']").val() ,
					searchStatus:  $("select[name='searchStatus'] > option:selected").val()
				}
				,
				success: function(data) {
					listDocument(data);
					pagination(data);
					
				}
				,
				error: function(jqXHR) {
					alert("Error : " + jqXHR.responseText);
					console.log(jqXHR.responseText);
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
	<c:choose>
		<c:when test="${requestScope.myDocs == 1}">
			<h3>개인문서 목록</h3>
		</c:when>
		<c:when test="${requestScope.status == 3 and requestScope.myDocs == 2}">
			<h3>승인문서 목록</h3>
		</c:when>
		<c:when test="${requestScope.status == 4 and requestScope.myDocs == 2}">
			<h3>반려문서 목록</h3>
		</c:when>
		<c:when test="${requestScope.status == 5 and requestScope.myDocs == 2}">
			<h3>수신문서 목록</h3>
		</c:when>
		<c:when test="${requestScope.status == 6 and requestScope.myDocs == 2}">
			<h3>만료문서 목록</h3>
		</c:when>
	</c:choose>
	<form class="form-inline pull-right">
		<div class="form-group">
			날짜검색 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- <input type="radio" name="searchDay" value="all">전체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
			<input type="radio" name="searchDay" value="writeDay">작성일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="searchDay" value="finishDay">완료일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="startDay" name="startDay" type="text" class="form-control" style="width: 150px;">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;
			<input id="endDay" name="endDay" type="text" class="form-control" style="width: 150px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select class="form-control" name="keyfield">
				<option value="subject">제목&nbsp;&nbsp;&nbsp;</option>
				<c:if test="${requestScope.status != 6}">
					<option value="writer">작성자</option>
				</c:if>
			</select>
			<input type="text" class="form-control" id="searchKeyword" placeholder="keyword" name="keyword">
		</div>
		<button type="button" class="btn btn-default" id="searchBtn">검색</button>
		<input type="hidden" name="myDocs" id="myDocs" value="${requestScope.myDocs }">
		<input type="hidden" name="status" id="status" value="${requestScope.status }">
	</form>
</div>
<br>
<br>

<div style="height: 550px;">
	<table class="table table-striped" align="center">
		<thead>
			<tr>
				<th width="100">즐겨찾기</th>
				<th width="100">번호</th>
				<th>제목</th>
				<th width="200">작성일</th>
				<c:if test="${requestScope.status != 6}">
					<c:if test="${requestScope.myDocs == 1 or requestScope.myDocs == 2 and requestScope.status == 5}">
						<th width="200">완료일</th>
					</c:if>
					<c:if test="${requestScope.status == 3 and requestScope.myDocs == 2}">
						<th width="200">승인일</th>
					</c:if>
					<c:if test="${requestScope.status == 4 and requestScope.myDocs == 2}">
						<th width="200">반려일</th>
					</c:if>
					<th width="100">작성자</th>
				</c:if>
				<c:if test="${requestScope.status == 6}">
					<th width="200">만료일</th>
				</c:if>
				<c:if test="${requestScope.myDocs == 1 or requestScope.myDocs == 2 and requestScope.status == 5}">				
					<th width="100">
						<select id="searchStatus" name="searchStatus">
							<option value="all">전체</option>
							<option value="accept">승인</option>
							<option value="reject">반려</option>
							<c:if test="${requestScope.myDocs == 1}">
								<option value="expiration">만료</option>
							</c:if>
						</select>
					</th>
				</c:if>
			</tr>
		</thead>
		<tbody id="documents">
			
	 	</tbody>
	</table>
</div>

<div class="col-md-12" align="center">
	<ul id="pagination" class="pagination">
		
		<li><a href="${requestScope.paging.prevPage }" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
		<c:forEach var="pageNum" begin="${requestScope.paging.startPage }"
			end="${requestScope.paging.endPage }" step="1">
			<li id="pageNum"><a>${pageNum }</a></li>
		</c:forEach>
		<li><a href="${requestScope.paging.nextPage }" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
	</ul>
</div>