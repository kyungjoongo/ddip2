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
      <!-- jquery-1.11.3.js -->
      <script type="text/javascript" src='<c:url value="/resources/jquery-1.11.3.js"/>'></script>
      
      <script>
      
      	$( document ).ready(function() {
    	    console.log( "ready!" );
    	    
    	    
     		
     		
     		$("#btnInsertForm").click(function() {
				location.href="${ctx}/form.do";

    	    });
     		
     	
    	   
    	    
    	});
      
      
      
         
      </script>		
   </head>
   <body>
<h3>관리자메인페이지</h3>
관리자 아이디 : ${sessionScope.admin.admin_id }<br/>
관리자 이름: ${sessionScope.admin.admin_name }
     
   </body>
</html>