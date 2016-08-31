<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>_____________________AMP2.0_________________</title>
<%@include file="./bb_common.jsp"%>
<style>
    body { font-size: 62.5%; }
    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
</style>   

<script>
	var sortColumnName; 
	var sortOrder;
	$(document).ready(function() {
		
			var topicjson={
			    "result": [
			           {
			               
			               "elementName": "제목",
			               level:"0", parent:"", isLeaf:false, expanded:true, loaded:true,
			               cellattr: function(rowId, tv, rawObject, cm, rdata) {
			                   return ' colspan=3'
			               }
			           },
			           {
			               "id": "1_1",
			               "elementName": "Simple Grouping",
			               level:"1", parent:"1", isLeaf:true, expanded:false, loaded:true
			           },
			           {
			               "id": "1_2",
			               "elementName": "May be some other grouping",
			               level:"1", parent:"1", isLeaf:true, expanded:false, loaded:true
			           },
			           {
			               "id": "2",
			               "elementName": "CustomFormater",
			               level:"0", parent:"", isLeaf:false, expanded:true, loaded:true
			           },
			           {
			               "id": "2_1",
			               "elementName": "Image Formatter",
			               "name": "고경준",
			               "id": "ssdfsdfd",
			               level:"1", parent:"2", isLeaf:true, expanded:false, loaded:true
			           },
			           {
			               "id": "2_1",
			               "elementName": "Anchor Formatter",
			               level:"1", parent:"2", isLeaf:true, expanded:false, loaded:true
			           }
			       ]
			    },
			    grid;

			$('<table id="list2"></table>').appendTo('#topics');

			grid = jQuery("#grid");
			grid.jqGrid({
			    datastr: topicjson,
			    datatype: "jsonstring",
			    height: "auto",
			//    loadui: "disable",
			    colNames: [/*"id",*/"elementName","name","id"],
			    colModel: [
			        //{name: "id",width:1, hidden:true, key:true},
			        {name: "elementName", width:100, resizable: false}
			        ,{name: "name",width:250,hidden:false}
			        ,{name: "id",width:250,hidden:false}
			    ],
			    treeGrid: true,
			    autowidth: true,
			    treeGridModel: "adjacency",
			    caption: "jqGrid Demos",
			    ExpandColumn: "elementName",
			    //autowidth: true,
			    rowNum: 10000,
			    //ExpandColClick: true,
			    treeIcons: {leaf:'ui-icon-document-b'},
			    jsonReader: {
			        repeatitems: false,
			        root: "result"
			    }
			});

		
		
		//@return : 체크된  row의 id values  
	    function getSelectedRows() {
	        var grid = $("#jqGrid");
	        var rowKey = grid.getGridParam("selrow");
	
	        if (!rowKey){
	        	alert("선택된행이 없습니다");
	        	return false;
	        }
	            
	        else {
	            var selectedIDs = grid.getGridParam("selarrrow");
	            var result = "";
	            for (var i = 0; i < selectedIDs.length; i++) {
	                result += selectedIDs[i] + ",";
	            }
	
	            return result;
	        }
	    }
		
	    
	
	//#gbox_jqGrid
	$("#gbox_jqGrid th").on("click", function() {
        			
        			var page= $("#page").val();
        			
        			//alert(sortOrder +":" +  sortColumnName);
        			
        			 $("#jqGrid").jqGrid('setGridParam', { 
        		        postData: {  
        		        	sortOrder: $("#sortOrder").val(),
        		        	sortColumnName: $("#sortColumnName").val()
        		        	/* page: page */
        		        	},
        		        	datatype:'json'
        			    }).trigger("reloadGrid",[{page:2}]);      
        			    
        			 
        			
        		});
	
	
	    $("#createUser").button().on("click", function() {
	    	
	    	
	    	var options = {
	    	        title: "Create",
	    	        autoOpen: false,
	    	        height: 300,
	    	        width: 350,
	    	        modal: true,
	    	        buttons: {
	    	            "등록": function() {
	    	
	    	
	    	                $.ajax({
	    	                    url: '${ctx}/test/add.do',
	    	                    type: 'post',
	    	                    data: $('#form1').serialize(),
	    	                    async: false,
	    	                    success: function(data) {
	    	                     
	    	                        if (data.result == 1) {
	    	                            //alert("성공");
	    	                            dialog.dialog("close");
	    	
	    	                            $('#jqGrid').setGridParam({
	    	                                page: 1,
	    	                                datatype: "json"
	    	                            }).trigger('reloadGrid');
	    	                        } else
	    	                            alert("fail");
	    	                    },
	    	                    error: function(data) {
	    	                        alert("fail!");
	    	                    }
	    	                })
	    	
	    	            },
	    	            "취소": function() {
	    	                dialog.dialog("close");
	    	            }
	    	        },
	    	        close: function() {
	    	        	
	    	        	$('#id').val('');
	                    $('#user_id').val('');
	                    $('#user_password').val('');
	                    $('#name').val('');
	                    $('#role').val('');
	    	        }
	       };
	    	dialog.dialog('option', options);
	        dialog.dialog("open");
	    });
	    
		//########################	
	    //deleteUser
   		//########################
	    $("#deleteUser").button().on("click", function() {
	
	        var selectedRows = getSelectedRows();
	        
	        if ( selectedRows !=false){
	        	
	        	if(confirm("삭제하시겠습니까?!")){
	   	        	$.ajax({
	   		            url: '${ctx}/test/delete.do',
	   		            type: 'post',
	   		            data: {
	   		                selectedRows: selectedRows
	   		            },
	   		            async: false,
	   		            success: function(data) {
	   		                //$('#time').text(data);
	   		                if (data.result == 1) {
	   		
	   		                    
	   		                    $('#jqGrid').setGridParam({
	   		                        page: 1,
	   		                        datatype: "json"
	   		                    }).trigger('reloadGrid');
	   		                    
	   		                    //alert("삭제성공");
	   		                } else
	   		                    alert("fail");
	   		            },
	   		            error: function(data) {
	   		                alert("fail!");
	   		            }
	   		        })
	   	        }
	   	        else
	   	        	return false;
	        }
	     
	    });//deleteUser Ends
	    
	    
	});
	
	 
</script>

</head>

<body>
<div id="dialog-form" title="유저등록">
  <form id="form1">
    <fieldset>
      
      id: <input type="text" name="id" id="id" value="" class="text ui-widget-content ui-corner-all" readonly="readonly">
      user_id:<input type="text" name="user_id" id="user_id" value="" class="text ui-widget-content ui-corner-all">
      user_password:<input type="text" name="user_password" id="user_password" value="" class="text ui-widget-content ui-corner-all">
      name:<input type="text" name="name" id="name" value="" class="text ui-widget-content ui-corner-all">
      role:<input type="text" name="role" id="role" value="" class="text ui-widget-content ui-corner-all">
      
 
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    </fieldset>
  </form>
</div>
    user_id:<c:out value="${sessionScope.loginSession.USER_ID}" />
    role:<c:out value="${sessionScope.loginSession.ROLE}" />


	<input type="text" id="page">
	<input type="text" id="sortOrder">
	<input type="text" id="sortColumnName">
	<c:out value=""></c:out>
    <table id="grid"></table>
    <div id="jqGridPager"></div>
    <button id="createUser">등록</button>
    <button id="deleteUser">삭제</button>
</body>
</html>

