<%-- addApprover.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script>
$(document).ready(function() {
	var tap = 1;
	var approverList = [];
	var recieverList = [];
	$('#approverTap').on('click', function() {
		tap=1;
		tapSetting($(this));		
		
	});
	
	$('#recieverTap').on('click', function() {
		tap=2;	
		tapSetting($(this));
	});
	
	$('#bookmarkTap').on('click', function() {
		tap=3;	
		tapSetting($(this));
		
	});
	
	// 임시목록 추가 버튼
	$('#addBtn').on('click', function() {
				
		 $(':checkbox[name=employee]').each(function() {
			 if($(this).prop('checked')) {
				 if(tap==1) {
					 if(approverList.indexOf($(this).val()) == -1) {
						 approverList.push($(this).val());
						 $.ajax({
								url: '${pageContext.request.contextPath}/getEmployee.do'
								,
								method: 'POST'
								,
								dataType: 'json'
								,
								data: {
									employeeId: $(this).val()									
								}
								, 
								cache: false
								,
								success: function(data) {
									
									var htmlStr = "<tr id="+ data.employee.id +">";
									htmlStr += "<td><label><input type='checkbox' name='approver'></label></td>";
									htmlStr += "<td>" + data.employee.name + "</td>";
									htmlStr += "<td>" + data.employee.gradeId + "</td>";
									htmlStr += "<td>" + data.employee.departmentId + "</td>";
									if(tap == 1) {
										htmlStr += "<td>결재</td>";
									} else {
										htmlStr += "<td>수신</td>";
									}
									htmlStr += "</tr>";
									
									
									$('#approverTable').append(htmlStr);
							
								}
								,
								error : function(jqXHR) {
									alert("Error : " + jqXHR.responseText);
								}			
								
							});
						 
					 }			 
				   	
				 }
				 
				 if(tap==2) {
					 if(recieverList.indexOf($(this).val()) == -1) {
						 recieverList.push($(this).val());
						 $.ajax({
								url: '${pageContext.request.contextPath}/getEmployee.do'
								,
								method: 'POST'
								,
								dataType: 'json'
								,
								data: {
									employeeId: $(this).val()									
								}
								, 
								cache: false
								,
								success: function(data) {
									
									var htmlStr = "<tr id="+ data.employee.id +">";
									htmlStr += "<td><label><input type='checkbox' name='approver'></label></td>";
									htmlStr += "<td>" + data.employee.name + "</td>";
									htmlStr += "<td>" + data.employee.gradeId + "</td>";
									htmlStr += "<td>" + data.employee.departmentId + "</td>";
									if(tap == 1) {
										htmlStr += "<td>결재</td>";
									} else {
										htmlStr += "<td>수신</td>";
									}
									htmlStr += "</tr>";
									
									
									$('#approverTable').append(htmlStr);
							
								}
								,
								error : function(jqXHR) {
									alert("Error : " + jqXHR.responseText);
								}			
								
							});
					 }			 	 
				 }
				 
				 	
	 
			 }
			 	 
		  });	
		 
		//alert(approverList.join() + '<br>' + recieverList.join());	
		
	});
	
	// 임시목록 삭제 버튼
	$('#removeBtn').on('click', function() {
		  $(':checkbox[name=approver]').each(function() {
			   
			   if($(this).prop('checked')) {
				   approverList.splice(approverList.indexOf($(this).parent().parent().parent()), 1);
				   recieverList.splice(approverList.indexOf($(this).parent().parent().parent()), 1);
				   $(this).parent().parent().parent().remove();
			   }	  
			   

		   });	
		  
		  alert(approverList.join() + '<br>' + recieverList.join());
	});
	
	
	// 서브밋 버튼
	$('#submitBtn').on('click', function() {
		if(approverList.length == 0 && recieverList.length == 0) {
			alert("선택된 사원이 없습니다.");
		} else {
			
			$.ajax({
				url: '${pageContext.request.contextPath}/addApprover.do'
				,
				method: 'POST'
				,
				dataType: 'json'
				,
				data: {
					employeeId: '${sessionScope.employee.id}', 
					subject: '' ,
					approverEmpIdList: JSON.stringify(approverList),
					recieverEmpIdList: JSON.stringify(recieverList)
							
				}
				, 
				cache: false
				,
				success: function(data) {
					window.opener.checkHasApprovalLine(true);
					window.close();				
				}
				,
				error : function(jqXHR) {
					alert("Error : " + jqXHR.responseText);
				}			
				
			});
		
		}		
	});
		
});

// 탭 설정
function tapSetting(obj) {
	$('#approverTap').removeAttr('class');
	$('#recieverTap').removeAttr('class');
	$('#bookmarkTap').removeAttr('class');
	obj.attr('class', 'active');
	$(':checkbox[name=employee]').each(function() {
		$(this).prop('checked', false);
	});
}


</script>

<div style="height: 10px;"></div>
<div class="col-md-5">
	<div class="panel panel-default">
		<div class="panel-body">
			<form class="navbar navbar-default col-md-12">
				<div class="collapse navbar-collapse" id="navbar">
					<ul class="nav navbar-nav">
						<li id="approverTap" class="active" ><a href=#>결재자</a></li>
						<li id="recieverTap"><a href=#>수신자</a></li>
						<!-- <li id="bookmarkTap"><a href=#>즐겨찾기 설정</a></li> -->
					</ul>
				</div>
			</form>
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body" style="overflow:scroll; height: 330px;">
						<div class="checkbox">
						
						
							<span class="glyphicon glyphicon-folder-open" aria-hidden="true"> IT부서 </span> <br> 
							&nbsp; <span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>1팀 <br> 
							&nbsp;&nbsp; <label> <input type="checkbox"	name="employee" value="20170712001"> 삼길동 팀장 </label> <br>
							
							
							<span class="glyphicon glyphicon-folder-open" aria-hidden="true">
								IT부서 </span> <br> &nbsp; <span
								class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>
							1팀 <br> &nbsp;&nbsp; <label> <input type="checkbox" name="employee"
								value="20170711002"> 이길동 팀장
							</label> <br>
						
							<span class="glyphicon glyphicon-folder-open" aria-hidden="true"> IT부서 </span> <br> 
							&nbsp; <span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>1팀 <br> 
							&nbsp;&nbsp; <label> <input type="checkbox"	name="employee" value="20170711001"> 일길동 팀장 </label> <br>
											
							
							<br> <span class="glyphicon glyphicon-folder-open"
								aria-hidden="true"> 즐겨찾기 </span> <br> &nbsp; <span
								class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
							나의 결재선 <br>
							
							

						</div>
						

					</div>
				</div>
				<form class="form-inline pull-right">
					<select class="form-control">
						<option>이름</option>
						<option>부서</option>
					</select>

					<div class="form-group">
						<input type="text" class="form-control" id="searchKeyword"
							placeholder="keyword">
					</div>
					<button type="button" class="btn btn-default">검색</button>

				</form>
			</div>
		</div>
	</div>

</div>
<div class="col-md-1" align="center">
	<div style="height: 100px;"></div>
	<span id="addBtn" class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><br>
	<br> <span id="removeBtn" class="glyphicon glyphicon-chevron-left"
		aria-hidden="true"></span>
</div>

<div class="col-md-6">
	<div class="panel panel-default" style="overflow:scroll; height: 380px;"> <!-- 여기 -->
		<div class="panel-body">
			<div class="checkbox">
				<table id="approverTable" class="table table-striped" align="center">
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
	<br><br>
	<button type="button" id="submitBtn" class="btn btn-primary btn-lg pull-right">결재선 등록</button>
</div>



















