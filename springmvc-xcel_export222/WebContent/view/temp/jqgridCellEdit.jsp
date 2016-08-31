<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>__Jqgrid example__</title>
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
	$(document).ready(function() {
		//##########################
		//등록,수정 pupup dialog 생성
		//##########################
	    var dialog = $("#dialog-form").dialog({
	       
	    });
	    dialog.dialog('close');
	    
	    
	    //###########################
	    // 그리드 랜더링
	    //###########################
	    $("#jqGrid").jqGrid({
	        //url: './data2.json',
	        // url: './data.json',
	        url: '${ctx}/test/list.do',
	        datatype: "json",
	        colModel: [{
	                label: 'id',
	                name: 'id',
	                width: 45,
	                key: true
	            }, {
	                label: '아이디',
	                name: 'user_id',
	                width: 75
	                , editable:true
	                
	                
	            }, {
	                label: '패스워드 ',
	                name: 'user_password',
	                width: 90
	                , editable:true
	            }, {
	                label: '이름',
	                name: 'name',
	                width: 100
	                , editable:true
	            }, {
	                label: '권한',
	                name: 'role',
	                width: 80,
	                sorttype: 'integer'
	               	, editable:true
	            }
	
	        ],
	        'cellEdit' : true,
	        'cellsubmit' : 'remote',
	    	'cellurl' : '${ctx}/test/updateCells.do',
	    	//셀을 submit 전에 데이터를 가지고 오는 func.
	    	beforeSubmitCell : function(rowid, cellname, value) {   // submit 전
	    		
	    		
	    	  return {"id":rowid, "cellName":cellname, "cellValue":value}
	    	
	    	
	    	},
	    	afterSubmitCell : function(res) {    // 변경 후

	            if(res.responseJSON.result == 1) {
	                userMsg = "데이터가 변경되었습니다.";
	               // alert(userMsg);
	            }else{
	            	userMsg = "fail";
	            	alert(userMsg);
	            }

	            return [(res.responseJSON.result == 1) ? true : false, userMsg];
	      
	        },
	    	
	        loadonce: true,
	        viewrecords: true,
	        width: 780,
	        height: 300,
	        rowNum: 10,
	        rowList: [5, 10, 20, 30, 50, 100],
	        rownumbers: false,
	        rownumWidth: 25,
	        //multiselect: true,
	        pager: "#jqGridPager",
	        pginput: false,
	        jsonReader: {
	        	root: "result"
	        }
	
	    });
	
		//@return : 체크된  row의 id values fetch
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
	    
	    $("#submit").button().on("click", function() {
	    	
	    	$("#form1").submit();
	    	
	    });
	    
	   
	    
		$("#getAllRowDatas").button().on("click", function() {
	    	
			 var rowDatas =  $("#jqGrid").getRowData();
			 
			 console.log(rowDatas);
			 
			 for ( i=0 ; i<rowDatas.length ; i++){
				 
				 console.log(rowDatas[i].user_id);
			 }
				 

	    	
	    });
	    
	    
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
    


<form id="form1">
    <table id="jqGrid"></table>
    <div id="jqGridPager"></div>
    
    <button id="submit">submit</button>
</form>    
    <button id="createUser">등록</button>
    <button id="deleteUser">삭제</button>
    <button  id="getAllRowDatas" >getAllRowDatas</button>
</body>
</html>

