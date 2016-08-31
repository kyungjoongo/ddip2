<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>spring3 mvc 고경준고경준</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src='<c:url value="/resources/common.js"/>'></script>
<script type="text/javascript" src='<c:url value="/resources/jquery-1.11.3.js"/>'></script>
<script>
      
      	$( document ).ready(function() {
    	    console.log( "ready!3333" );
    	    
    	    
     		$("table tr td #btnDelete").click(function() {
				
				var _id = $(this).attr("val");
				
				//alert($(this).attr("val"));
				
			     	$.ajax({
			            url:'${ctx}/user/delete.do',
			            type: "POST",  
			            data: { id: _id}   ,
			            success:function(data){

							alert("삭제 성공");
							location.href= "${ctx}/user/list.do"
			            }
			        }) 
			    

    	    });
     		
     	   
     		$("table tr td #btnModify").click(function() {
				
				var _id = $(this).attr("val");
				
				var pageNum = $("#pageNum").val();
				
				location.href="${ctx}/user/modifyForm.do?id="+ _id+ "&pageNum="+pageNum ;
				
			    

    	    });
     		

     		
     		$("#btnInsertForm").click(function() {
     			
     			
     			var pageNum = $("#pageNum").val()
     			
				location.href="${ctx}/user/form.do?pageNum="+ pageNum;
    	    });
     		
     		
     		
     		$("#btnLogout").click(function() {
     			
     			alert("로그아웃합니다!");
				location.href="${ctx}/logout.do";
    	    });
     		
     	
    	   
    	    
    	});
      
      
      
         
      </script>		
   </head>
   <body>
<input type=hidden id="pageNum" value="${pu.pageNum}"/>   
   id:<c:out value="${loginedUserSesMap.user_id}"/><br/>
   name:<c:out value="${loginedUserSesMap.user_name}"/>
      
      <c:if test="${!empty users}">
         <br />
         <center>
            <table width="90%" class='dataGrid'>
               <tr style="background-color: gray;">
               		<th>id</th>	
                  <th>name</th>
                  <th>user_id</th>
                  <th>user_password</th>
                  <th>role</th>
                  <th>--</th>
                  <th>--</th>
               </tr>
               <c:forEach items="${users}" var="user">
                  <tr  style="background-color: silver;" val="${user.id}"  >
                  	<td>
                        <c:out value="${user.id}"/>
                     </td>
                     <td>
                        <c:out value="${user.name}"/>
                     </td>
                     <td>
                        <c:out value="${user.user_id}"/>
                     </td>
                     <td>
                        <c:out value="${user.user_password}"/>
                     </td>
                     <td>
                        <c:out value="${user.role}"/>
                     </td>
                     <td>
                     	<input id="btnDelete" type="button" value="삭제" val="${user.id}"></input>
                     </td>
                     <td>
                     	<input id="btnModify" type="button" value="수정" val="${user.id}"></input>
                     </td>
                     
                  </tr>
               </c:forEach>
            </table>
            
            <%@include file="./../common/paging.jsp"%>
            
             <%-- <jsp:include page="${ctx}/common/paging.do"></jsp:include> --%>
            <table>
            		 <td>
                     	<input id="btnInsertForm" type="button" value="입력폼" val="${user.id}"></input>
                     </td>
                     
                     <td>
                     	<input id="btnLogout" type="button" value="로그아웃" ></input>
                     </td>
			</table>                     
         </center>
         <br />
      </c:if>
      
     
   </body>
</html>