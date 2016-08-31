<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <title>spring3 mvc 수정폼</title>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <script type="text/javascript" src='<c:url value="/resources/common.js"/>'></script>
      <!-- jquery-1.11.3.js -->
      <script type="text/javascript" src='<c:url value="/resources/jquery-1.11.3.js"/>'></script>
      
      <script>
      
      	$( document ).ready(function() {
    	    console.log( "ready!" );
    	    
 
    	});
      	
         
      </script>		
   </head>
   <body>
      
     
      <fieldset>
         
         <center>
             <form  action="${ctx}/user/update.do" name="userForm" method="post">
               <table id="table1">
                  <tr >
                     <td colspan="2" align="left">
                        <form:errors path="*" cssStyle="color : red;"/>
                     </td>
                  </tr>
                  <tr>
                     <td>id : </td>
                     <td>
                     <input type="hidden" name="pageNum" value="${param.pageNum}" >
                        <input type="text" name="id" value="${user.id}" >
                     </td>
                  </tr>
                  
                  <tr>
                     <td>Name : </td>
                     <td>
                        <input type="text" name="name" value="${user.name}">
                     </td>
                  </tr>
                  <tr>
                     <td>user_id : </td>
                     <td>
                        <input type="text" name="user_id" value="${user.user_id}">
                     </td>
                  </tr>
                  <tr>
                     <td>user_password : </td>
                     <td>
                        <input type="text" name="user_password" value="${user.user_password}">
                     </td>
                  </tr>
                  <tr>
                     <td>role : </td>
                     <td>
                        <input type="text" name="role" value="${user.role}">
                        
                        
                     </td>
                  </tr>
                  <tr>
                  	<td colspan="2">
                  		<input type="submit" value="submit"></input>
                  	</td>
                  
                  </tr>
                  
               </table>
            </form>
           
         </center>
      </fieldset>
      
   </body>
</html>