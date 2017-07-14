<%-- addApprover.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
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
	
	$('#addBtn').on('click', function() {
				
		 $(':checkbox[name=employee]').each(function() {
			 if($(this).prop('checked') && tap==1) {
				 if(approverList.indexOf($(this).val()) == -1) {
					 approverList.push($(this).val());
				 }			 
			   	
			 }
			 
			 if($(this).prop('checked') && tap==2) {
				 if(recieverList.indexOf($(this).val()) == -1) {
					 recieverList.push($(this).val());
				 }			 
			 
			 }
			 
		  });	
		
		
		alert(approverList.join() + '<br>' + recieverList.join());
		
	});
	
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
	
	$('#submitBtn').on('click', function() {
		$.ajax({
			url: '${pageContext.request.contextPath}/addApprover.do'
			,
			method: 'POST'
			,
			dataType: 'json'
			,
			data: {
				employeeId: '20170711001', //세션 userId 들어가야함. 테스트를 위해 일단 임시로 데이터 넣음
				subject: '' ,
				approverEmpIdList: JSON.stringify(approverList),
				recieverEmpIdList: JSON.stringify(recieverList)
						
			}
			, 
			cache: false
			,
			success: function(data) {
				window.close();
				
			}
			,
			error : function(jqXHR) {
				alert("Error : " + jqXHR.responseText);
			}			
			
		});
		
	});
		
});

function tapSetting(obj) {
	$('#approverTap').removeAttr('class');
	$('#recieverTap').removeAttr('class');
	$('#bookmarkTap').removeAttr('class');
	obj.attr('class', 'active');
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
					<tr id="20170711001">
						<td><label><input type="checkbox" name="approver" value=""></label></td>
						<td>일길동</td>
						<td>사원</td>
						<td>IT</td>
						<td>결재</td>
					</tr>
					<tr id="20170711002">
						<td><label><input type="checkbox" name="approver" value=""></label></td>
						<td>이길동</td>
						<td>사원</td>
						<td>경영</td>
						<td>수신</td>
					</tr>

				</table>
			</div>

		</div>

	</div>
	<br><br>
	<button type="button" id="submitBtn" class="btn btn-primary btn-lg pull-right">결재선 등록</button>
</div>



















