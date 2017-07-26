<%-- addApprover.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript"
	src="resources/tablednd/jquery.tablednd.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>

<script>
var tap = 1;
var departmentEmpList = [];

$(document).ready(function() {
	// 부서 조회
	$.ajax({
		url: '${pageContext.request.contextPath}/listDepartment.do'
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
	
	//부서원 조회
	$.ajax({
		url: '${pageContext.request.contextPath}/listEmployeeByDepartment.do'
		,
		method: 'POST'
		,
		dataType: 'json'
		,
		data: {
			departmentId : '${requestScope.deptid}'
		}
		, 
		cache: false
		,
		success: function(data) {
			
			var htmlStr = "";
			for(var i=0; i<data.empByDeptList.length; i++) {
				if(data.empByDeptList[i].id != '${sessionScope.employee.id}') {
				    htmlStr += "&nbsp; <label>";
					htmlStr +=  data.empByDeptList[i].name + " " + data.empByDeptList[i].gradeId + "</label> <br>"; 	
				}
			}
			
			$('#departmentEmpTable').append(htmlStr);
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
					 if(departmentEmpList.indexOf($(this).val()) == -1) {	
						 departmentEmpList.push($(this).val());
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
									htmlStr += "<td><label>&nbsp;&nbsp;<input type='checkbox' name='approver'>";
									htmlStr +=  data.employee.name + " " ;
									htmlStr +=  data.employee.gradeId;
									htmlStr += "</label></td></tr>";
										$('#departmentEmpTable').append(htmlStr);
								}						
								,
								error : function(jqXHR) {
									alert("Error : " + jqXHR.responseText);
								}			
								
							});
						 
					 } else {
						 alert($(this).val() +" 사원은 이미 추가된 사원입니다.")
					 }		 
				   	

			 }
			 
		  });	
	});
	
	// 임시목록 삭제 버튼
	$('#removeBtn').on('click', function() {
		  $(':checkbox[name=approver]').each(function() {
			   
			   if($(this).prop('checked')) {
				   	approverList.splice(approverList.indexOf($(this).parent().parent().parent()), 1);				 
				   $(this).parent().parent().parent().remove();
			   }	  
			   
		   });
	});
	
	
	// 서브밋 버튼
	$('#submitBtn').on('click', function() {
		if(departmentEmpList.length == 0) {
			alert("선택된 사원이 없습니다.");
		} else {
			
			$.ajax({
				url: '${pageContext.request.contextPath}/modifyDepartment.do'
				,
				method: 'POST'
				,
				dataType: 'json'
				,
				data: {
					departmentEmpList: JSON.stringify(departmentEmpList),
					departmentId: '${requestScope.deptid}'
				}
				, 
				cache: false
				,
				success: function(data) {
					alert("부서 변경이 완료되었습니다.");
					location.href = "listDepartment.do";
				}
				,
				error : function(jqXHR) {
					alert("Error : " + jqXHR.responseText);
					console.log("Error : " + jqXHR.responseText);
				}			
				
			});
		
		}		
	});
		
});

 //부서별 사원 및 즐겨찾기 조회 
$(function () {
	$('#employeeList').on("click", "span", function() {
		var thisSpan = $(this);
		//클릭 이벤트 제거
		if(thisSpan.find('br').length > 0) {
			return true;
		}
			//부서별 사원 조회
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
					
					var htmlStr = "<br><br>";
					for(var i=0; i<data.empByDeptList.length; i++) {
						if(data.empByDeptList[i].id != '${sessionScope.employee.id}') {
						    htmlStr += "&nbsp;&nbsp; <label> <input type='checkbox' name='employee' value='"+data.empByDeptList[i].id+"'>";
							htmlStr +=  data.empByDeptList[i].name + " " + data.empByDeptList[i].gradeId + "</label> <br>"; 	
						}
					}		
					thisSpan.append(htmlStr);
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
			<div class="col-md-12">
				<!-- 리스트 영역 -->
				<div class="panel panel-default">
					<div class="panel-body" style="overflow: scroll; height: 600px;">
						<div id="employeeList" class="checkbox"></div>
					</div>
				</div>
				<!-- 검색 폼 -->
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
	<span id="addBtn" class="glyphicon glyphicon-chevron-right"
		aria-hidden="true"></span><br> <br> <span id="removeBtn"
		class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
</div>


<!-- 오른쪽 패널 -->
<div class="col-md-5">
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="col-md-12">
				<!-- 리스트 영역 -->
				<div class="panel panel-default">
					<div class="panel-body" style="overflow: scroll; height: 600px;">
						<div id="departmentEmpTable" class="checkbox"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<button type="button" class="btn btn-primary btn-lg pull-right">취소</button>
	<button type="button" id="submitBtn"
		class="btn btn-primary btn-lg pull-right">수정</button>
</div>