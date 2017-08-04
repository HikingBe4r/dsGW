<%-- listBoard.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.project.groupware.domain.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script>

//쓰기 버튼

	



$(document).ready(function() {
	
	
	var currentPage = 1;
	var checkRow = '';
	  
	/* $('#boardList').find('tr:not(:eq(0))').remove(); */ 
	
	  function loadBoardList(data) {
	
		 $("#boardBody").empty(data);
		 
		var htmlStr = "";
		if(data.boardList.length == 0) {
			alert("검색결과가 없습니다.");
		}
		for(var i = data.paging.startArticleNum; i <= data.paging.endArticleNum; i++) {
		
			console.log( data.boardList[i].name );
			
			htmlStr += "<tr>";
			htmlStr += "<td><label><input type='checkbox' id="+ data.boardList[i].id + " name='board'></label></td>";
			htmlStr += "<td>"+data.boardList[i].id+"</td>";
			htmlStr += "<td><input type='text'  rows='2' cols='20' readonly value="+ data.boardList[i].name + "></td>";
			htmlStr += "<td><input type='text'  rows='2' cols='20' readonly value="+ data.boardList[i].note + "></td>";
			htmlStr += "<td>"+data.boardList[i].articleCount+"</td>";
			htmlStr += "<td><input type='text' rows='1' cols='5' readonly value=" +data.boardList[i].secret + "></td>";
			htmlStr += "<td><button type='button'  id=" + data.boardList[i].id + ">수정</button></td>";
			htmlStr += "<td><button type='button'  id=" + data.boardList[i].id + ">삭제</button></td>";
			htmlStr += "</tr>"
			
		}
		
		$("#boardBody").append(htmlStr);
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
		
		
		$("#pagination").append(htmlStr);
		
	}
	
	//페이지 로드시
	$.ajax ({
		url: '${pageContext.request.contextPath}/listBoardAdmin.do'
		,
		method : 'GET'
		,
		cache : false
		,
		dataType : 'json'
		,
		data : {
			
			currentPage : '1'
		}
		,
		success: function(data) {
			loadBoardList(data);
			pagination(data);
		}
		,
		error : function(jqXHR) {
			alert("ERROR!");
			console.log(jqXHR.responseText);
		}
	});
	
	
	
	// 페이지 클릭시
	$("#pagination").on("click", "li", function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/listBoardAdmin.do'
			,
			method : 'GET'
			,
			cache : false
			,
			dataType : 'json'
			,
			data : {
				currentPage: $(this).val()
			}
			,
			success : function(data) {
				loadBoardList(data);
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
	
	
	  $("#addBtn").click(function() {
			/* location.href	= 'writeBoard.do'; */
		  $.ajax({
				 url: '${pageContext.request.contextPath}/writeBoard.do'
					  ,
					  method: 'GET'
					  ,
					  cache: false
					  ,
					  dataType: 'json'
					  ,
					  data: {
						  name: $('#name').val(),
						  note: $('#note').val(),
						  secret: $('#secret').val()
						  
					  },
					  success: function(data) {
						  loadBoardList(data);
					  }
					  ,
					  error:function(jqXHR) {
						  alert("Error: " + jqXHR.responseText);
					  }
			}) ;
		});
	
	
	//게시판 삭제
	/*   $("#boardList").on('click', ':button', function() {	  		
		//삭제			  
		if($(this).text() == '삭제') {  
				
				$.ajax({
				  url: '${pageContext.request.contextPath}/removeBoard.do'
				  ,
				  method: 'GET'
				  ,
				  cache: false
				  ,
				  dataType: 'json'
				  ,
				  data: {
					id: $(this).attr('id')
				  },
				  success: function(data) {				
				  	if(data.isRemoved == 1) {
				  		alert('등록된  게시글이 존재합니다.');
				  	}
				  	
				  	listBoard(data);
				
				  }
				  ,
				  error:function(jqXHR) {
					$('#boardList').empty();
					$('#boardList').text(jqXHR.responseText);
					 
				  }
			  });
		   } */
	 $("#boardBody").on('click', ':button', function()   {
		   
		if($(this).text() == '수정'){            
		      $(this).parent().parent('tr').find('input[type="text"]').attr("type", "text").removeAttr('readonly');
		    
		        $(this).text('수정완료');
		     
	     } else if($(this).text() == '수정완료'){   //댓글 수정완료
	        $.ajax({
	           url: '${pageContext.request.contextPath}/modifyBoard.do'
	           ,
	           method: 'GET'
	           ,
	           cache: false
	           ,
	           data: {
	              id: $(this).attr('id'),
	         
	              name: $(this).parent().parent('tr').find('td:input[type="text"]').val(),
	              note: $(this).parent().parent('tr').find('td:input[type="text"]').val(),
	              secret: $(this).parent().parent('tr').find('td:input[type="text"]').val(),
	              currentPage : '1'
	              
	           }
	           ,
	           dataType: 'json'
	           ,
	           success: function(data) {
	        	   if (data.isRemoved == 1) {
						alert('등록된  게시글이 존재합니다.');
					}
					loadBoardList(data);
					pagination(data);
	           }
	           ,
	           error: function(jqXHR) {
	              alert("Error : " + jqXHR.responseText);
	           }
	        });
	        
	        $(this).parent().parent('tr').find('input[type="text"]').attr("type", "text").removeAttr('readonly');
	        $(this).text('수정');
	     
	     } else if($(this).text() == '삭제'){
		   		$.ajax({
						url: '${pageContext.request.contextPath}/removeBoard.do'
						,
						method: 'GET'
						,
						dataType: 'json'
						,
						data: {
							id:$(this).attr('id')	
						}
						,
						cache: false
						,
						success: function(data) {
							if(data.isRemoved == 1) {
						  		alert('등록된  게시글이 존재합니다.');
						  	}
							loadBoardList(data);
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
	}); 	   
		
		/*  //선택 삭제
	     $('#removeBtn').click(function() {	    	  
				alert(id +"id");
	   	  		
				$(":checkbox[name='board']:checked").each(function(){
					checkRow += $(this).attr("id") + ",";
				});
				checkRow = checkRow.substring(0, checkRow.lastIndexOf(',')); //맨끝 콤마 지우기
				if(checkRow == '') {
					alert("삭제할 게시판을 선택하세요.");
				    return;
				}
	   	   */
							
				
						
					/* }); */
				

	 
		   
		
	
</script>
<a></a>
<div class="panel panel-default">
	<div class="panel-body">게시판 관리</div>
</div>
<div>
	<form class="form-inline pull-right">


	



	</form>
</div>
<br>
<br>

<!--  게시판 목록조회 -->
<div style="height: 550px;">
<form id="checkBoard" name="checkBoard" >
	<table class="table table-hover" id="boardList">

		<thead>

			<tr>

			   <th width="50"><label><input id="allCheck"   name="allCheck" type="checkbox"></label></th>
               <th width="100">번호</th>
               <th width="200">이름</th>
               <th width="200">비고</th>
               <th width="100">게시글수</th>
               <th width="100">게시판구별</th>
               <th width="100">수정</th>
			</tr>
		</thead>

		<tbody id="boardBody">
			
		</tbody>
	
	</table>
	</form>
</div>


<!-- <div align="right">
	   <button type="button" class="btn btn-primary" id="writeBtn">등록</button>
      <button type="button" class="btn btn-danger" id="removeBtn">삭제</button>
</div> -->
   
   
<div class="col-md-12" align="center">
	<ul id="pagination" class="pagination">	
		</ul>
	</div>
   


<!-- 게시판 등록 -->
<table class="table table-hover">
	<tr>
		<td>

			<div class="row">
				<div class="col-md-1">공개여부</div>
				<div class="col-md-5">
					<input id="secret" value="0" type="checkbox">
				</div>
			</div>

			<div class="row">
				<div class="col-md-1">게시판이름</div>
				<div class="col-md-5">
					<input type="text" rows="2" cols="80" id="name">
				</div>
			</div>
			<div class="row">
				<div class="col-md-1">비고</div>
				<div class="col-md-5">
					<input type="text" rows="2" cols="80" id="note">
				</div>
				<div class="col-md-1" id="addBtn"><button>등록</button>
				</div>
			</div> <br> <br>
		</td>
	</tr>
</table>


