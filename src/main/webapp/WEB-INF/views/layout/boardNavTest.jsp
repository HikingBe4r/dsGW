<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.project.groupware.domain.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<script>
   $('#approval').removeAttr('class');
   $('#board').attr('class', 'active');
</script>

<c:choose>
   <c:when test="${sessionScope.employee == null}">
      <form action="${pageContext.request.contextPath }/logout.do"
         method="post">
         <div class="row">
            <div class="col-sm-7 col-md-7">
               <div class="thumbnail">
                  <img
                     src="${pageContext.request.contextPath }/resources/image/example.png"
                     id="profileImg">
               </div>
            </div>

            <div class="col-sm-3 col-md-3">
               <div class="panel panel-default">${sessionScope.admin.id }</div>
               <button class="btn btn-default" type="submit">로그아웃</button>
            </div>
         </div>
         <br> <br>

         <ul class="nav nav-pills nav-stacked">
            <c:forEach var="board" items="${requestScope.boards}"
               varStatus="loop">
               <li><a
                  href="${pageContext.request.contextPath}/listArticleForm.do?boardId=${pageScope.board.id}&open=${pageScope.board.secret}">${pageScope.board.name}</a></li>
            </c:forEach>
         </ul>
      </form>
   </c:when>
   <c:otherwise>
      <div class="row">
         <div class="col-md-6">
            <div class="thumbnail">
               <img
                  src="${pageContext.request.contextPath }/upload/empImage/${sessionScope.empImage1.systemFileName}"
                  alt="..." id="profileImg" style="height: 150px;">
            </div>
         </div>
         <br> <br>
         <div id="employeeInfo" style="height: 70px;">
            <h5>${sessionScope.employeeDetail.departmentId }</h5>
            <h4>${sessionScope.employeeDetail.name }
               ${sessionScope.employeeDetail.gradeId }</h4>
         </div>

         <button id="modifyInfo" class="btn btn-default" type="button"
            onclick="window.open('${pageContext.request.contextPath }/modifyEmployee.do?id=${sessionScope.employee.id }', '개인정보수정','width=1250, height=900, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">정보수정</button>

         <form action="${pageContext.request.contextPath }/logout.do"
            method="post">
            <input id="logout" class="btn btn-default" type="submit"
               value="로그아웃">
         </form>
      </div>
      <br>

      <!-- <div class="panel panel-info">
 
   <div class="panel-heading">
      <a href="#"><h4>공지사항</a></h4>
   </div>
   <div class="panel-body">
      <ul>
         <li><a href="#">전체 공지사항</a></li>
         <li><a href="#">부서별 공지사항</a></li>
      </ul>
   </div>
   <div class="panel-heading">
      <a href="#"><h4>게시판</a></h4>
   </div>
   <div class="panel-body">
      <ul>
         <li><a href="#">일반 게시판</a></li>
         <li><a href="#">Q&A 게시판</a></li>
      </ul>
   </div>
</div> -->
   <ul class="nav nav-pills nav-stacked">
         <c:forEach var="board" items="${requestScope.boards}"
            varStatus="loop">
            <li><a
               href="${pageContext.request.contextPath}/listArticleForm.do?boardId=${pageScope.board.id}&open=${pageScope.board.secret}">${pageScope.board.name}</a></li>
         </c:forEach>
      </ul>
   </c:otherwise>
</c:choose>
