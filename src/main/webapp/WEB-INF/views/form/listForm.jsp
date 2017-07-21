<%-- listForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js?ver=2"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>


<script>
	$(document).ready(function() {
		$("#regBtn").click(function() {
			document.location.href='${pageContext.request.contextPath}/registerForm.do';
		});
		
		$("#formBody").on("click", "input", function() {
			var index = $(this).val();	
		
			$.ajax ({
				url: "${pageContext.request.contextPath}/registerBookmarkForm.do"
				,
				method: "POST"
				,
				dataType : "json"
				,
				cache : false
				,
				data : {
					formId : index
				}
				,
				success : function(data) {
					alert("즐찾 성공")
				}
				,
				error : function(jqXHR) {
					alert("ERROR 발생. console.log를 확인하세요.");
					console.log(jqXHR);
				}
			});
		});
		
		
		$("#testBtn").on("click", function() {
			
			$("#testDiv > span").attr("class", "glyphicon glyphicon-star");
			
		});		
		
		$("#testDiv").on("click", "span", function() {
			//console.log($(this).children().val()); // hidden's value
			if($(this).children().val() == 0) {
				$(this).attr("class", "glyphicon glyphicon-star");
				$(this).children().val("1");
			} else if($(this).children().val() == 1) {
				$(this).attr("class", "glyphicon glyphicon-star-empty");
				$(this).children().val("0");
			}
			
			$.ajax ({
				
				url: ''
				,
				method: ''
				,
				cache: false
				,
				data : {
					
				}
				,
				dataType: 'json'
				,
				success: function(data) {
					
				}
				,
				error: function(jqXHR) {
					alert("ERROR!");
					console.log(jqXHR);
				}
			});
		});
	});

</script>


<div>
	<h3>양식 목록</h3>
	<form class="form-inline pull-right">
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
	<form id="checkForm" name="checkForm" >
	<table class="table table-striped" align="center">
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
			<c:forEach var="form" items="${requestScope.formList }"
				varStatus="loop">
				<tr align="center">
					<td><span class="glyphicon glyphicon-star-empty" aria-hidden="true">
						<input type="hidden" value="0"/>
					</span></td>
					
					<td>${form.id }</td>
					<c:url var="url" value="/detailForm.do">
						<c:param name="formId" value="${pageScope.form.id }"></c:param>
					</c:url>
					<td><a href="${url }">${form.subject }</a></td>
					<td>${form.writeday }</td>
					<td>${form.hitcount }</td>
				</tr>
			</c:forEach>
			
			
		</tbody>
	</table>
	</form>
</div>

<div id="testDiv">
	
</div>

<input id="testBtn" type="button" value="3ㅡ3"  />



<div align="right">
	<button type="button" class="btn btn-primary" id="regBtn">등록</button>
	<button type="button" class="btn btn-danger" id="removeBtn">삭제</button>
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























