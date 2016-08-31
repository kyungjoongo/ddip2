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
      <link rel="stylesheet" href="./dropzone.css">
 <style>
        .dropzone-previews {
            height: 200px;
            width: 500px;
            border: dashed 1px red;
            background-color: lightblue;
        }
    </style>
    <script>
  //DropzoneJS snippet - js

  

    $(document).ready(function() {
    	
    	  $.getScript('http://cdnjs.cloudflare.com/ajax/libs/dropzone/3.8.4/dropzone.min.js',function(){
    	      // instantiate the uploader
    	      $('#file-dropzone').dropzone({ 
    	        url: "/upload",
    	        maxFilesize: 100,
    	        paramName: "uploadfile",
    	        maxThumbnailFilesize: 5,
    	        autoProcessQueue: false,
    	        uploadMultiple: true,
    	        parallelUploads: 25,
    	        init: function() {
    	        	
    	        	var myDropzone = this;

    	            // Here's the change from enyo's tutorial...

    	            $("#submit-all").click(function (e) {
    	                e.preventDefault();
    	                e.stopPropagation();
    	                myDropzone.processQueue();
    	            }); 
    	          
    	          this.on('success', function(file, json) {
    	        	  
    	        	  alert("Sdflsdkfl");
    	          });
    	          
    	          this.on('addedfile', function(file) {
    	            
    	          });
    	          
    	          this.on('drop', function(file) {
    	            alert('file');
    	          }); 
    	        }
    	      });
    	    });
    	
    	
    	
    	
    });
    
    
    </script>  
</head>
<body>


   
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-12">
    	<h3>DropzoneJS Upload Example - http://www.dropzonejs.com/</h3>  
    </div>
  </div><!--/row-->
  <hr>
  <div> 
      <form action="/upload.do" class="dropzone" drop-zone="" id="file-dropzone"></form>
      
      <input type="button" id="submit-all" value="전송"></input>
  </div>
</div>
</body>    
</html>