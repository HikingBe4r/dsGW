<%-- listTempDocument.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
	function listTempDocument(data) {
		$('#tempDocuments').empty(data);
		
		var htmlStr = "";
		
		for (var i = data.paging.startArticleNum ; i <= data.paging.endArticleNum ; i++) {
			htmlStr += "<tr>";
			htmlStr += "<td>&nbsp;&nbsp;<input type='checkbox' name='tempDocumentId' value='" + data.tempDocumentList[i].id + "'></td>";
			htmlStr += "<td>&nbsp;&nbsp;" + data.tempDocumentList[i].id + "</td>";
			htmlStr += "<td><a href='${pageContext.request.contextPath}/detailTempDocument.do?id=" + data.tempDocumentList[i].id + "'>" + data.tempDocumentList[i].subject + "</a></td>";
			htmlStr += "<td>" + data.tempDocumentList[i].writeday + "</td>";			
			htmlStr += "</tr>";
		}
							
		$('#tempDocuments').append(htmlStr);
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
				url : '${pageContext.request.contextPath}/searchTempDocument.do'
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
					currentPage: "1"
				}
				,
				success : function(data) {
					listTempDocument(data);
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
					endDay:  $(":text[name='endDay']").val() ,
					currentPage: "1"
				}
				,
				cache: false
				,
				success: function(data) {
					listTempDocument(data);
					pagination(data);
				}
				,
				error : function(jqXHR) {
					alert("Error : " + jqXHR.responseText);
					console.log(jqXHR.responseText);
				}				
				
			});
		});				
		
		$('#select').click(function() {
			if ($(this).attr('checked') == 'checked') {
				$(":checkbox[name='tempDocumentId']").each(function() {
					 var subChecked = $(this).attr('checked');
					 
					 if (subChecked != 'checked') {
					 	$(this).click();
					 }
				 });
			}
			else {
				$(":checkbox[name='tempDocumentId']").each(function() {
					 var subChecked = $(this).attr('checked');
					 
					 if (subChecked == 'checked') {
					 	$(this).click();
					 }
				 });
			}
		});
		
		$('#deleteBtn').click(function() {
			var checkRow = '';
			
			$(":checkbox[name='tempDocumentId']:checked").each(function(){
				checkRow = checkRow + $(this).val() + ', ';
			});
			
			checkRow = checkRow.substring(0, checkRow.lastIndexOf(', ')); //맨끝 콤마 지우기
			
			if(checkRow == '') {
				alert("삭제할 문서를 선택하세요.");
			    return;
			}
			
			if(confirm('정말로 삭제하시겠습니까?')) {
				$.ajax({
					url: '${pageContext.request.contextPath}/removeTempDocument.do'
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
						checkRow: checkRow
					}
					,
					cache: false
					,
					success: function(data) {
						listTempDocument(data);
						pagination(data);
					}
					,
					error : function(jqXHR) {
						alert("Error : " + jqXHR.responseText);
						console.log(jqXHR.responseText);
					}
					
				});
			}
			
		});
		
		$("#pagination").on("click", "li", function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/searchTempDocument.do'
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
					currentPage: $(this).val()
				}
				,
				success : function(data) {
					listTempDocument(data);
					pagination(data);
				}
				,
				error : function(jqXHR) {
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
	<h3>임시문서 목록</h3>
	<form class="form-inline pull-right">
		<div class="form-group">
			<input id="startDay" name="startDay" type="text" class="form-control" style="width: 150px;">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;
			<input id="endDay" name="endDay" type="text" class="form-control" style="width: 150px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select class="form-control" name="keyfield">
				<option value="subject">제목&nbsp;&nbsp;&nbsp;</option>
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
				<th width="50">&nbsp;&nbsp;<input type="checkbox" id="select" name="select"></th>
				<th width="100">번호</th>
				<th>제목</th>
				<th width="200">임시저장일</th>
			</tr>
		</thead>
		<tbody id="tempDocuments">
			
	 	</tbody>
	</table>
</div>

<div align="right">
	<button type="button" class="btn btn-danger" id="deleteBtn">삭제</button>
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