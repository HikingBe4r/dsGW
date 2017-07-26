<%-- choiceForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
	var currentPage = 1;
	
	
	function loadFormList(data) {
		$("#formBody").empty(data);
		var htmlStr = "";
		if(data.formList.length == 0) {
			alert("검색결과가 없습니다.");
		}
		for(var i = data.paging.startArticleNum; i <= data.paging.endArticleNum; i++) {
			
			var linkUrl = '${pageContext.request.contextPath}/writeDocument.do';	
				linkUrl += '?formId=' + data.formList[i].id;
			
				
			htmlStr += '<tr>';
			htmlStr += '<td id="bookmark">';
			htmlStr += '<button type="button" class="btn btn-default" aria-label="Center Align">';
			if(data.formList[i].isBookmark == 0) {
				htmlStr += '<span class="glyphicon glyphicon-star-empty" aria-hidden="true">';
			} else {
				htmlStr += '<span class="glyphicon glyphicon-star" aria-hidden="true">';
			}
			htmlStr += '<input type="hidden" id="isBookmark" value='+data.formList[i].isBookmark+' />';
			htmlStr += '<input type="hidden" id="formId" value='+data.formList[i].id+' />';
			htmlStr += '</span>';
			htmlStr += '</button>';
			htmlStr += '</td>';

			htmlStr += '<td>'+data.formList[i].id+'</td>';
			htmlStr += '<td><a href='+linkUrl+'>'+data.formList[i].subject+'</a></td>';
			htmlStr += '<td>'+data.formList[i].writeday+'</td>';
			htmlStr += '<td>'+data.formList[i].hitcount+'</td>';
		}
		
		$("#formBody").append(htmlStr);
		$("#searchKeyword").val('');
	}
	
	function pagination(data) {
		$("#pagination").empty(data);
		
		var htmlStr = "";
		
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
		
		/*
		// 이게 왜 실패했는지 생각해보자.
		if(data.paging.currentPage == $("#pageNum").val()) {
			$("#pageNum").attr("class", "active");
		}
		*/
		
		$("#pagination").append(htmlStr);
	}
	
	// 페이지 로드시
	$.ajax ({
		url: '${pageContext.request.contextPath}/searchForm.do'
		,
		method : 'GET'
		,
		cache : false
		,
		dataType : 'json'
		,
		data : {
			keytype: $("#keytype").val(),
			keyword: $("#searchKeyword").val(),
			boardId : '1', //'${param.boardId}',
			currentPage : '1'
		}
		,
		success: function(data) {
			loadFormList(data);
			pagination(data);
		}
		,
		error : function(jqXHR) {
			alert("ERROR!");
			console.log(jqXHR);
		}
	});
	
	// 양식 등록하기.
	$("#regBtn").click(function() {
		document.location.href='${pageContext.request.contextPath}/registerForm.do';
	});
			
	// 즐겨찾기 추가/제거
	$('#formBody').on("click", "tr > td > button", function() {
		var isBookmark = $(this).children().children().first().val();
		var formId = $(this).children().children().last().val();
	
		console.log("isbookmark: "+$(this).children().children().first().val()); // hidden1
		console.log("formId: "+$(this).children().children().last().val()); // hidden2
		
		
		// 0: 북마크x, 1: 북마크o
		$.ajax ({
			url: '${pageContext.request.contextPath}/registerBookmarkForm.do'
			,
			method: 'POST'
			,
			cache: false
			,
			dataType: 'json'
			,
			data : {
					
				isBookmark : isBookmark,
				formId : formId,
				keytype: '${requestScope.keytype}',
				keyword: '${requestScope.keyword}',
				boardId: '1', //'${param.boardId}',
				currentPage: currentPage // 반드시 고칠것.
			}
			,
			success: function(data) {
				loadFormList(data);
				pagination(data);
				
			}
			,
			error: function(jqXHR) {
				alert("ERROR!");
				console.log(jqXHR);
			}
		});
	});
	
	//검색
	function search() {
		$.ajax({
			url : '${pageContext.request.contextPath}/searchForm.do'
			,
			method : 'GET'
			,
			cache : false
			,
			dataType : 'json'
			,
			data : {
				//employeeId : '${sessionScope.employee.id}',
				keytype: $("#keytype").val(),
				keyword: $("#searchKeyword").val(),
				boardId: '1', //"${param.boardId}",
				currentPage: '1'
			}
			,
			success : function(data) {
				loadFormList(data);
				pagination(data);
			}	
			,
			error : function(jqXHR) {
				alert("ERROR: "+jqXHR.responseText);
				console.log(jqXHR.responseText);
			}
			
		});
	}
	
	//검색 버튼
	$("#searchBtn").click(function() {
		search();
	});
	
	//엔터 치면 검색
	$('#searchKeyword').on('keydown', function(event) {
		if(event.keyCode == 13) {
			search();
		}
	})
	
	
	// 페이지 클릭시
	$("#pagination").on("click", "li", function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/searchForm.do'
			,
			method : 'GET'
			,
			cache : false
			,
			dataType : 'json'
			,
			data : {
				//employeeId : '${sessionScope.employee.id}',
				keytype: $("#keytype").val(),
				keyword: $("#searchKeyword").val(),
				boardId: '1',
				currentPage: $(this).val()
			}
			,
			success : function(data) {
				loadFormList(data);
				pagination(data);
				currentPage = data.paging.currentPage;					
			}	
			,
			error : function(jqXHR) {
				alert("ERROR: "+jqXHR.responseText);
				console.log(jqXHR.responseText);
			}
			
		});
	});
	
});


</script>


<div>
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;새 기안 양식 선택</h3>
	<form class="form-inline pull-right" onsubmit="return false">
		<select class="form-control" name="keytype" id="keytype">
			<option value="전체" id="1">전체</option>
			<option value="제목" id="2">제목</option>
		</select>
		<div class="form-group">
			<input type="text" class="form-control" id="searchKeyword"
				placeholder="keyword">
		</div>
		<button type="button" class="btn btn-default" id="searchBtn">검색</button>
	</form>
</div>

<br>
<br>

<div style="height: 550px;">
	<form id="checkForm" name="checkForm">
		<table class="table table-striped">
			<thead>
				<tr>
					<th width="100">즐겨찾기</th>
					<th width="100">번호</th>
					<th>제목</th>
					<th width="200">등록일</th>
					<th width="100">조회수</th>
				</tr>
			</thead>
			
			<tbody id="formBody">
				
			</tbody>
		</table>
	</form>
</div>

<div class="col-md-12" align="center">
	<ul id="pagination" class="pagination">
		
	</ul>
</div>

