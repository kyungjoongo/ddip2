<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>__Jqgrid example__</title>
<%@include file="./temp/bb_common.jsp"%>
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

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Bootstrap Admin Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
<style>

.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form {
    border-color: #101010;
    background-color: white;
}

.side-nav {
    
    background-color: white;
    }
</style>
          <script>
	$(document).ready(function() {
		
		//alert("sdflksdlfk");
		//##########################
		//등록,수정 pupup dialog
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
	            }, {
	                label: '패스워드 ',
	                name: 'user_password',
	                width: 90
	            }, {
	                label: '이름',
	                name: 'name',
	                width: 100
	            }, {
	                label: '권한',
	                name: 'role',
	                width: 80,
	                sorttype: 'integer'
	            }
	
	        ],
	        loadonce: true,
	        viewrecords: true,
	        width: 780,
	        height: 300,
	        rowNum: 10,
	        rowList: [5, 10, 20, 30, 50, 100],
	        rownumbers: false,
	        rownumWidth: 25,
	        multiselect: true,
	        pager: "#jqGridPager",
	        pginput: false,
	        jsonReader: {
	        	root: "result"
	        	     /* root: "rows", 
		            page: "page", 
		            total: "total", */
		            /* records: "records" */
	
	        },
	        //###############################
	        //더블클릭 이벤트.(수정 event.)
	        //###############################
	        ondblClickRow: function(rowId) {
	            var rowData = jQuery(this).getRowData(rowId); 
	            var name = rowData['name'];
	            var user_id = rowData['user_id'];
	            var id = rowData['id'];
	          
	            $.ajax({
                    url: '${ctx}/test/selectOne.do',
                    type: 'post',
                    data: {
		                id: id
		            },
                    success: function(data) {
                            $('#id').val(data.result.id);
                            $('#user_id').val(data.result.user_id);
                            $('#user_password').val(data.result.user_password);
                            $('#name').val(data.result.name);
                            $('#role').val(data.result.role);
                    },
                    error: function(data) {
                        alert("fail!");
                    }
                })
                
    	    	//수정폼options	    	    	
    	    	var modifyformoptions = {
	    	        autoOpen: false,
	    	        height: 300,
	    	        title: "수정폼",
	    	        width: 350,
	    	        modal: true,
	    	        //#######################
	    	        //update 핸들링
	    	        //#########################
	    	        buttons: {
	    	            "수정": function() {
	    	                $.ajax({
	    	                    url: '${ctx}/test/update.do',
	    	                    type: 'post',
	    	                    data: $('#form1').serialize(),
	    	                    async: false,
	    	                    success: function(data) {
	    	                        //$('#time').text(data);
	    	                        if (data.result == 1) {
	    	                            
	    	                            dialog.dialog("close");
	    	
	    	                            $('#jqGrid').setGridParam({
	    	                                page: 1,
	    	                                datatype: "json"
	    	                            }).trigger('reloadGrid');
	    	                            
	    	                            alert("수정완료");
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
	          
	            dialog.dialog('option', modifyformoptions);
		        dialog.dialog("open");
	            
	        },
	
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

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">SB Admin</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-left ">
                <a href="#">
                    메뉴1
                </a>
               
               
            </ul>
             <ul class="nav navbar-left ">
                <a href="#">
            메뉴2
          	      </a>
                
                
               
               
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="index.jsp"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="charts.html"><i class="fa fa-fw fa-bar-chart-o"></i> Charts</a>
                    </li>
                    <li>
                        <a href="tables.html"><i class="fa fa-fw fa-table"></i> Tables</a>
                    </li>
                    <li>
                        <a href="forms.html"><i class="fa fa-fw fa-edit"></i> Forms</a>
                    </li>
                    <li>
                        <a href="bootstrap-elements.html"><i class="fa fa-fw fa-desktop"></i> Bootstrap Elements</a>
                    </li>
                    <li>
                        <a href="bootstrap-grid.html"><i class="fa fa-fw fa-wrench"></i> Bootstrap Grid</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Dropdown <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="blank-page.html"><i class="fa fa-fw fa-file"></i> Blank Page</a>
                    </li>
                    <li>
                        <a href="index-rtl.html"><i class="fa fa-fw fa-dashboard"></i> RTL Dashboard</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">
<!-- ########################################### -->
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
		    
		
		
		
		    <table id="jqGrid"></table>
		    <div id="jqGridPager"></div>
		    <button id="createUser">등록</button>
		    <button id="deleteUser">삭제</button>

<!-- ################################# -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->



    

</body>

</html>
