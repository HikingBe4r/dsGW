<%-- removeApprovalLineBookmark.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>  
<script type="text/javascript" src="resources/tablednd/jquery.tablednd.js"></script>


<script>
var currentBookmark = "";

$(document).ready(function() {
	
	search();
	
	//서브밋 버튼
	$('#submitBtn').on('click', function() {	
		$.ajax({
			url: '${pageContext.request.contextPath}/removeApprovalLineBookmark.do'
			,
			method: 'POST'
			,
			dataType: 'json'
			,
			data: {
				approvalLineId : currentBookmark.attr("id")
			}
			, 
			cache: false
			,
			success: function(data) {
				alert("즐겨찾기 삭제 성공!");
				location.href = "removeApprovalLineBookmark.do";		
			}
			,
			error : function(jqXHR) {
				alert("Error : " + jqXHR.responseText);
			}					
		});		
	});
	
	//검색 버튼
	$('#searchBtn').on('click', function() {
		search();
	}); 
	
	//엔터 치면 검색
	$('#keyword').on('keydown', function(event) {
		if(event.keyCode == 13) {
			search();
		}
	});
		
});

//즐겨찾기 검색
function search() {
	$('#bookmarkList').empty();
	$('#approverTable tr:not(:first)').empty();
	$('#recieverTable tr:not(:first)').empty();
	$('#submitBtn').attr('disabled', 'disabled');	
	$.ajax({
		url: '${pageContext.request.contextPath}/searchApprovalLineBookmark.do'
		,
		method: 'GET'
		,
		dataType: 'json'
		,
		data: {
			employeeId : '${sessionScope.employee.id}',
			keyword: $('#keyword').val()
		}
		, 
		cache: false
		,
		success: function(data) {
			var htmlStr = "";
			for(var i=0; i<data.approvalLineList.length; i++) { 
				
			    htmlStr += "<label> <button id='" + data.approvalLineList[i].id + "' type='button' class='btn btn-default btn-sm'> ";
			    htmlStr += "<span class='glyphicon glyphicon-remove' aria-hidden='true'></span> "
			    htmlStr += data.approvalLineList[i].subject + "</button></label><br> ";
			    									
			}		
			htmlStr += "<br>";
			$('#bookmarkList').append(htmlStr);
		}
		,
		error : function(jqXHR) {
			alert("Error : " + jqXHR.responseText);
		}				
	}); 

}


// 즐겨찾기 버튼
$(function() {
	$('#bookmarkList').on("click", "button", function() {
		$('#bookmarkList button').attr("class", "btn btn-default btn-sm");
		$(this).attr("class", "btn btn-danger btn-sm");
		$('#submitBtn').removeAttr('disabled');
		
		
		//테이블 비움
		$('#approverTable tr:not(:first)').empty();
		$('#recieverTable tr:not(:first)').empty();
		
		currentBookmark = $(this);
		
		$.ajax({
			url: '${pageContext.request.contextPath}/listApproverInBookmark.do'
			,
			method: 'POST'
			,
			dataType: 'json'
			,
			data: {
				approvalLineId : currentBookmark.attr("id")
			}
			, 
			cache: false
			,
			success: function(data) {
				
				//배열 및 테이블 채우기
				var htmlStr = "";
				for(var i=0; i<data.approverList.length; i++) {
					htmlStr += "<tr id="+ data.approverList[i].id +">";
					htmlStr += "<td></td>";
					htmlStr += "<td>" + data.approverList[i].name + "</td>";
					htmlStr += "<td>" + data.approverList[i].gradeId + "</td>";
					htmlStr += "<td>" + data.approverList[i].departmentId + "</td>";
					htmlStr += "<td>결재</td>";
					htmlStr += "</tr>";
				}
				$('#approverTable').append(htmlStr);
				htmlStr = "";
				for(var i=0; i<data.recieverList.length; i++) {
					htmlStr += "<tr id="+ data.recieverList[i].id +">";
					htmlStr += "<td></td>";
					htmlStr += "<td>" + data.recieverList[i].name + "</td>";
					htmlStr += "<td>" + data.recieverList[i].gradeId + "</td>";
					htmlStr += "<td>" + data.recieverList[i].departmentId + "</td>";
					htmlStr += "<td>수신</td>";
					htmlStr += "</tr>";
				}
				$('#recieverTable').append(htmlStr);				
			}
			,
			error : function(jqXHR) {
				alert("Error : " + jqXHR.responseText);
			}			
			
		});	
		 
	})
})

</script>
<div>
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;결재선 즐겨찾기 삭제</h3>
</div>
<br>


<!-- 왼쪽 패널 -->
<div class="col-md-5">
	<div class="panel panel-default">
		<div class="panel-body">
			<!-- 리스트 영역 -->
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body" style="overflow:scroll; height: 500px;">
						<div id="bookmarkList" class="checkbox">
						</div>
					</div>
				</div>
				<!-- 검색 폼 -->
				<form class="form-inline pull-right" onsubmit="return false">
					<select id="keyfield" class="form-control">
						<option value="name">이름</option>
					</select>

					<div class="form-group">
						<input type="text" class="form-control" id="keyword" placeholder="keyword">
					</div>
					<button id="searchBtn" type="button" class="btn btn-default">검색</button>
				</form>
			</div>
		</div>
	</div>
</div>


<div class="col-md-1">
	
</div>


<!-- 오른쪽 패널 -->
<div class="col-md-6">
	<div class="panel panel-default" style="overflow:scroll; height: 260px;"> 
		<!-- 결재자 -->
		<div class="panel-body">
			<div class="checkbox">
				<table id="approverTable" class="tablednd table table-striped" align="center">
					<thead>
						<tr>
							<th></th>
							<th>이름</th>
							<th>직책</th>
							<th>부서</th>
							<th>구분</th>
						</tr>
					</thead>
				</table>				
			</div>
		</div>
	</div>
	<br>
	<div class="panel panel-default" style="overflow:scroll; height: 300px;"> 
		<!-- 수신자 -->
		<div class="panel-body">
			<div class="checkbox">
				<table id="recieverTable" class="table table-striped" align="center">
					<thead>
						<tr>
							<th></th>
							<th>이름</th>
							<th>직책</th>
							<th>부서</th>
							<th>구분</th>
						</tr>
					</thead>				
				</table>					
			</div>
		</div>
	</div>	
	<br>
	<button type="button" id="submitBtn" class="btn btn-primary btn-lg pull-right" disabled="disabled">결재선 삭제</button>
	
</div>