<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
    <title>Trirand jqGrid - jQuery based grid HTML5 component for Javascript</title>
    
	<link rel="stylesheet" type="text/css" media="screen" href="http://cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css" />
	<script type="text/javascript" src='<c:url value="/resources/jquery-1.11.3.js"/>'></script>
    <script type="text/javascript" src='http://cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js'></script>
    
    <style>
    
tfoot{
display: none;
}    
    
    </style>

<script>

$(document).ready(function() {
    
	$.ajax({
         type:"POST",
         url:"${ctx}/test/showTables.do",
         dataType:"JSON", 
         success : function(data) {
        	 
        	 alert(data.toString());
        	 
        	 $.each(data.newshowableTableList, function (index, tableOne) {
        		  console.log("tableNm-->"+ tableOne.tableNm);
        		  $.each(tableOne.colList, function (index, colProperty) {
        			  
        			  console.log("Field-->"+ colProperty.Field);  
        			  console.log("Type-->"+ colProperty.Type);
        			  console.log("Null-->"+ colProperty.Null);
        			  console.log("Key-->"+ colProperty.Key);
        		  });
        	 });
               
         },
         error : function(xhr, status, error) {
               alert("ERROR");
         }
    });
	
	
	
	
} );
	

 
   </script>

</head>

<body>

    
<input type="button" value="btn1" id="btn1"></input>

<div style="width: 800px">
	asdasdasdasdas
</div>
</body>
</html>

