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
      <script type="text/javascript" src='<c:url value="/resources/dropzone.js"/>'></script>
      <script type="text/javascript" src='<c:url value="/resources/ckeditor/ckeditor.js"/>'></script>
      <link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
      <script>
      
      	$( document ).ready(function() {
    	    console.log( "ready!" );
    	    
    	    CKEDITOR.replace( 'myfield',{
    	    	
    	    	customConfig: '${ctx}/resources/ckeditor/config2.js'
    	    	
    	    } );
    	    
    	    var editor = CKEDITOR.inline( 'editable', {
    	        removePlugins: 'toolbar',
    	        allowedContent: 'p h1 h2 strong em; a[!href]; img[!src,width,height];'
    	    } );
    	});
      	
         
      </script>		
   </head>
   <body>
      <c:out value="${loginedUserSesMap.user_id}"/>
   <c:out value="${loginedUserSesMap.user_name}"/>
   
     
      <fieldset>
         
         <center>
             <form  action="${ctx}/user/addUser.do" name="userForm" method="post">
             	<%-- <input type=text id="pageNum" value="${param.pageNum}"/> --%>
               <table id="table1">
                  <tr >
                     <td colspan="2" align="left">
                        <form:errors path="*" cssStyle="color : red;"/>
                     </td>
                  </tr>
                  <!-- <tr>
                     <td>id : </td>
                     <td>
                        <input type="text" name="id" readonly="readonly">
                     </td>
                  </tr> -->
                  
                  <tr>
                     <td>Name : </td>
                     <td>
                        <input type="text" name="name">
                     </td>
                  </tr>
                  <tr>
                     <td>user_id:</td>
                     <td>
                        <input type="text" name="user_id">
                     </td>
                  </tr>
                  <tr>
                     <td>user_password : </td>
                     <td>
                        <input type="text" name="user_password">
                     </td>
                  </tr>
                  <tr>
                     <td>role : </td>
                     <td>
                      <input type="text" name="role">
                        
                     </td>
                  </tr>
                
                  <tr>
                  	<td colspan="2">
                  		<input type="submit" value="submit"></input>
                  	</td>
                  	<td>
              <!--     	<form action="/file-upload" class="dropzone">
					  <div class="fallback">
					    <input name="file" type="file" multiple />
					  </div>
					</form> -->
                  	
                  	</td>
                  
                  </tr>
                  <textarea class="ckeditor" id="myfield" rows="10" cols="10" ></textarea>        
                  
                  
               </table>
            </form>
           
         </center>
      </fieldset>
      
   </body>
</html>