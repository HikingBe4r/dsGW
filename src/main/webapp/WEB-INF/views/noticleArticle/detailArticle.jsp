<%-- detailArticle.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.project.groupware.domain.ArticleVO"%>
<%@ page import="com.project.groupware.domain.ArticleFileVO"%>
<%@ page import="com.project.groupware.domain.BoardVO"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ page contentType="text/html; charset=utf-8"%>

<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	
<script>
	$(document).ready(function() {
		
		$('#prevBtn').click(function() {
			alert('이전' + '${requestScope.article.id}');
			$(location).attr('href', 
					'${pageContext.request.contextPath}/naviDetailNoticeArticle.do?id=${requestScope.article.id}&navi=prev&boardId=${param.boardId}&open=${param.open}');
		});
		
		

		$('#nextBtn').click(function() {
			alert('다음');
			$(location).attr('href', '${pageContext.request.contextPath}/naviDetailNoticeArticle.do?id=${requestScope.article.id}&navi=next&boardId=${param.boardId}&open=${param.open}');
		});
		
	
	});

</script>	
	
<div class="panel panel-default">
	<div class="panel-body">공지사항</div>
	
</div>





<div class="row">
	<div class="col-md-11"></div>
	<c:url var="modifyUrl" value="/modifyNoticeArticle.do">
		<c:param name="id" value="${requestScope.article.id }" />
	</c:url>
	<c:url var="removeUrl" value="/removeNoticeArticle.do">
		<c:param name="id" value="${requestScope.article.id }" />
		<c:param name="boardId" value="${requestScope.article.boardId }" />
	</c:url>


	<div class="col-md-1">
		<button onclick="location.href='${pageScope.modifyUrl }'">수정</button>
	</div>
	<div class="col-md-1">
		<button onclick="location.href='${pageScope.removeUrl }'">삭제</button>	
	</div>
	
	<div class="col-md-1">
		<button id="listBtn"
			onclick="location.href='${pageContext.request.contextPath}/listNoticeArticle.do?boardId=${requestScope.article.boardId}'">목록보기</button>			
	</div>

	<div class="col-md-1">
		<button id="prevBtn">이전</button>
	</div>
	
	<div class="col-md-1">
		<button id="nextBtn">다음</button>
	</div>

</div>


<div class="row">
	<div class="col-md-12">${requestScope.article.subject}</div>
</div>
<br>
<br>
<div class="row">
	<div class="col-md-1">글쓴이${requestScope.article.id}</div>
	<div class="col-md-1">${requestScope.article.employee.name}</div>
	<div class="col-md-1">조회수</div>
	<div class="col-md-1">${requestScope.article.hitcount}</div>
	<div class="col-md-1"></div>
	<div class="col-md-1"></div>
	<div class="col-md-1"></div>
	<div class="col-md-1"></div>
	<div class="col-md-1">작성일</div>
	<div class="col-md-1">${requestScope.article.writeday}</div>
</div>
<br>
<br>

<div style="overflow: scroll; width: 1161px; height: 500px;">
	<%-- <div class="col-md-12">${requestScope.article.content}<br><img src="${pageContext.request.contextPath }/upload/${requestScope.image.systemImageName}" width="800" height="700">
  </div> --%>


	<div class="col-md-12">${requestScope.article.content}<br>
		<c:if test="${not empty requestScope.article.image }">
			<c:forEach var="image" items="${requestScope.article.image}" varStatus="loop">
				<img src="${pageContext.request.contextPath }/upload/${pageScope.image.systemImageName}"
					width="800" height="400">
		</c:forEach>
		</c:if>
	</div>

</div>
<br>
<br>
<div class="row">
	<c:if test="${not empty requestScope.article.files }">

		<c:forEach var="files" items="${requestScope.article.files}"
			varStatus="loop">

			<c:url var="url" value="/downloadFile.do">
				<div class="col-md-1">
					<c:param name="originalFileName"
						value="${pageScope.files.originalFileName }" />
					<c:param name="systemFileName"
						value="${pageScope.files.systemFileName }" />
				</div>
			</c:url>
			<tr>
				<td>파일${pageScope.loop.count }</td>
				<td><a href="${pageScope.url }">${pageScope.files.originalFileName }</a></td>
			</tr>

		</c:forEach>

	</c:if>

</div>
