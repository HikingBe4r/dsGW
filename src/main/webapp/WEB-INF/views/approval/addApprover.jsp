<%-- addApprover.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>  
<script type="text/javascript" src="resources/tablednd/jquery.tablednd.js"></script>

<script>
var tap = 1;
var approverList = [];
var recieverList = [];

$(document).ready(function() {
	
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

	
	/* var temp = "<span class='glyphicon glyphicon-folder-open' aria-hidden='true'> IT부서 </span> <br>"; 
	temp += "&nbsp; <span class='glyphicon glyphicon-triangle-bottom' aria-hidden='true'></span>1팀 <br>" ;
	temp += "&nbsp;&nbsp; <label> <input type='checkbox' name='employee' value='20170712001'> 삼길동 팀장 </label> <br>";
	
	$('#employeeList').append(temp); */
	
	
	// 사원 조회
	$.ajax({
		url: '${pageContext.request.contextPath}/listDepartment.do' //'${pageContext.request.contextPath}/listDepartment.do'
		,
		method: 'POST'
		,
		dataType: 'json'
		,
		data: {
												
		}
		, 
		cache: false
		,
		success: function(data) {
			
			var htmlStr = "";
			for(var i=0; i<data.departmentList.length; i++) {
				 htmlStr += "<span class='glyphicon glyphicon-folder-open' aria-hidden='true' id=" + data.departmentList[i].id  + ">  "; 
				 htmlStr += data.departmentList[i].name + "</span> <br>" ;
				 	 
			}
			
			$('#employeeList').append(htmlStr);
	
		}
		,
		error : function(jqXHR) {
			alert("Error : " + jqXHR.responseText);
		}			
		
	});
	
	
	 

	// 임시목록 추가 버튼
	$('#addBtn').on('click', function() {
		
		 $(':checkbox[name=employee]').each(function() {
			 if($(this).prop('checked')) {
				 //결재자
				 if(tap==1) {
					 if(approverList.indexOf($(this).val()) == -1 && recieverList.indexOf($(this).val()) == -1) {	
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
									htmlStr += "<td>결재</td>";
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
				 
				 //수신자
				 if(tap==2) {
					 if(approverList.indexOf($(this).val()) == -1 && recieverList.indexOf($(this).val()) == -1) {
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
									htmlStr += "<td><label><input type='checkbox' name='reciever'></label></td>";
									htmlStr += "<td>" + data.employee.name + "</td>";
									htmlStr += "<td>" + data.employee.gradeId + "</td>";
									htmlStr += "<td>" + data.employee.departmentId + "</td>";
									htmlStr += "<td>수신</td>";
									htmlStr += "</tr>";
									$('#recieverTable').append(htmlStr);
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
		 //alert(approverList.join() + '|||' + recieverList.join());	 		
	});
	
	// 임시목록 삭제 버튼
	$('#removeBtn').on('click', function() {
		  $(':checkbox[name=approver]').each(function() {
			   
			   if($(this).prop('checked')) {
				   	approverList.splice(approverList.indexOf($(this).parent().parent().parent()), 1);				 
				   $(this).parent().parent().parent().remove();
			   }	  
			   
		   });	
		  
		  $(':checkbox[name=reciever]').each(function() {
			   
			   if($(this).prop('checked')) {
				   	recieverList.splice(recieverList.indexOf($(this).parent().parent().parent()), 1);	      
				   $(this).parent().parent().parent().remove();
			   }	  
		   });	
		  //alert(approverList.join() + '|||' + recieverList.join());
		  
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

//테이블 드롭앤다운 (결재순서 변경)
$(function() {	
	$('#approverTable').on("mouseover", function() {
		$("#approverTable").tableDnD({
			onDrop: function(table, row) {
				var rows = table.tBodies[0].rows;
				approverList = [];
				
				for (var i=0; i<rows.length; i++) {
	                approverList.push(rows[i].id);
	            }
			}
		});
	})	
})

 // 부서별 사원 조회
$(function () {
	$('#employeeList').on("click", "span", function() {
		var thisSpan = $(this);
		if($(thisSpan).find('label').length > 0) {
			return true;
		}
		
		$.ajax({
			url: '${pageContext.request.contextPath}/listEmployeeByDepartment.do'
			,
			method: 'POST'
			,
			dataType: 'json'
			,
			data: {
				departmentId : thisSpan.attr("id")												
			}
			, 
			cache: false
			,
			success: function(data) {
				
				var htmlStr = "<br>";
				for(var i=0; i<data.empByDeptList.length; i++) {
						
				    htmlStr += "&nbsp;&nbsp; <label> <input type='checkbox' name='employee' value='"+data.empByDeptList[i].id+"'>";
					htmlStr +=  data.empByDeptList[i].name + " " + data.empByDeptList[i].gradeId + "</label> <br>"; 		
									
				}		
				$(thisSpan).append(htmlStr);
			}
			,
			error : function(jqXHR) {
				alert("Error : " + jqXHR.responseText);
			}			
			
		});	
		
	
	})
}) 


</script>

<div style="height: 10px;"></div>


<!-- 왼쪽 패널 -->
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
						<div id="employeeList" class="checkbox">
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


<!-- 가운데 버튼 -->
<div class="col-md-1" align="center">
	<div style="height: 200px;"></div>
	<span id="addBtn" class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><br><br> 
	<span id="removeBtn" class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
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
	<br><br>
	<button type="button" id="submitBtn" class="btn btn-primary btn-lg pull-right">결재선 등록</button>
	
</div>



















