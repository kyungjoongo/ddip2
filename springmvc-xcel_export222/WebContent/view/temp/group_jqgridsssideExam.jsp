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
		
		var mydata = [
		      		{id:"1",invdate:"2010-05-24",name:"test",note:"note",tax:"10.00",total:"2111.00"} ,
		      		{id:"2",invdate:"2010-05-25",name:"test2",note:"note2",tax:"20.00",total:"320.00"},
		      		{id:"3",invdate:"2007-09-01",name:"test3",note:"note3",tax:"30.00",total:"430.00"},
		      		{id:"4",invdate:"2007-10-04",name:"test",note:"note",tax:"10.00",total:"210.00"},
		      		{id:"5",invdate:"2007-10-05",name:"test2",note:"note2",tax:"20.00",total:"320.00"},
		      		{id:"6",invdate:"2007-09-06",name:"test3",note:"note3",tax:"30.00",total:"430.00"},
		      		{id:"7",invdate:"2007-10-04",name:"test",note:"note",tax:"10.00",total:"210.00"},
		      		{id:"8",invdate:"2007-10-03",name:"test2",note:"note2",amount:"300.00",tax:"21.00",total:"320.00"},
		      		{id:"9",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
		      		{id:"11",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
		      		{id:"12",invdate:"2007-10-02",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
		      		{id:"13",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
		      		{id:"14",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
		      		{id:"15",invdate:"2007-10-05",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
		      		{id:"16",invdate:"2007-09-06",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
		      		{id:"17",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
		      		{id:"18",invdate:"2007-10-03",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
		      		{id:"19",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
		      		{id:"21",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
		      		{id:"22",invdate:"2007-10-02",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
		      		{id:"23",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
		      		{id:"24",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
		      		{id:"25",invdate:"2007-10-05",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
		      		{id:"26",invdate:"2007-09-06",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
		      		{id:"27",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
		      		{id:"28",invdate:"2007-10-03",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
		      		{id:"29",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"}
		      	];
		
		
		var gridId= 'list48';
		
		      jQuery("#list48").jqGrid({
		    	  url: './data.json',
		      	datatype: "json",
		      	height: 'auto',
		      	rowNum: 30,
		      	rowList: [10,20,30],
		         	colModel:[
		         		{name:'role',index:'id', width:150, sorttype:"int"},
		         		{name:'user_id',index:'invdate', width:150, sorttype:"date", formatter:"date"},
		         		{
		         			name:'name'
		         			,index:'name'
		         			, width:150
		         			, hidden:true
		         		},
		         		{name:'user_password',index:'user_password', width:150, align:"right",sorttype:"float",  editable:true},
		         	],
		         	pager: "#plist48",
		         	viewrecords: true,
		         //	sortname: 'name',
		         	grouping:true,
		         	groupingView : {
		         		groupField : ['name']
		      			,groupColumnShow: [false]	
		      			,groupText:['<a style="color:red">{0}</a>']
		         	},
		         	onSelectRow: function(id){ 
		         	    /*   if(id && id!==lastSel){ 
		         	         jQuery(this).restoreRow(lastSel); 
		         	         lastSel=id; 
		         	      } 
		         	      jQuery(this).editRow(id, true);  */
		         	      
		         	      
		         	      alert("sdlfksdflk");
		         	   }
		         	
		         	,gridComplete: function(){ 
		         	    
		         	   $( "tr[id^='"+ gridId+  "ghead'] a" ).click(function() {
		         	
		         		  
		         		  alert(this.textContent);
		         		   
		         	   });
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
    user_id:<c:out value="${sessionScope.loginSession.USER_ID}" />
    role:<c:out value="${sessionScope.loginSession.ROLE}" />


	<input type="text" id="page">
	<input type="text" id="sortOrder">
	<input type="text" id="sortColumnName">
	<c:out value=""></c:out>
    <table id="list48"></table>
    <div id="jqGridPager"></div>
    <button id="createUser">등록</button>
    <button id="deleteUser">삭제</button>
</body>
</html>

