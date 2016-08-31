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
<script type="text/javascript" src='<c:url value="/resources/mustache.js"/>'></script>
<script>

$(document).ready(function () {
	console.log("ready!");

	$("table tr td #btnDelete").click(function () {

		var _id = $(this).attr("val");

		//alert($(this).attr("val"));

		$.ajax({
			url : '${ctx}/user/delete.do',
			type : "POST",
			data : {
				id : _id
			},
			success : function (data) {

				alert("삭제 성공");
				location.href = "${ctx}/user/list.do"
			}
		})

	});

	$("table tr td #btnModify").click(function () {

		var _id = $(this).attr("val");

		var pageNum = $("#pageNum").val();

		location.href = "${ctx}/user/modifyForm.do?id=" + _id + "&pageNum=" + pageNum;

	});

	$("#btnInsertForm").click(function () {

		var pageNum = $("#pageNum").val()

			location.href = "${ctx}/user/form.do?pageNum=" + pageNum;
	});

	$("#btnLogout").click(function () {

		alert("로그아웃합니다!");
		location.href = "${ctx}/logout.do";
	});

	/* 	var person = {
	firstName: "Christophe",
	lastName: "Coenraets",
	blogURL: "http://coenraets.org"
	};
	var template = "<h1>{{firstName}} {{lastName}}</h1>Blog: {{blogURL}}";
	var html = Mustache.to_html(template, person);
	$('#sampleArea').html(html);
	 */

	$.getJSON('${ctx}/user/getCommentList.do', function (data) {
		var template = $('#personTpl').html();
		
		var tree = unflatten( data.result );
		
		obj={};
		
		obj.root = tree;
		
		var html = Mustache.to_html(template, obj);

		$('#sampleArea').html(html);
	});
	 /*
	  * 
	  * 트리메이크 자바스크립트 tree
	  */
		 obj = [
				{id: 1, parent_id: null, title: "Row 1"},
		        {id: 2, parent_id: null, title: "Row 2"},
		        {id: 3, parent_id: 2, title: "Row 2-1"},
		        {id: 4, parent_id: 2, title: "Row 2-2"},
		        {id: 5, parent_id: 2, title: "Row 2-3"},
		        {id: 6, parent_id: 2, title: "Row 2-4"}
		        
		    ];
		 
		 
		 function unflatten(arr) {
			  var tree = [],
			      mappedArr = {},
			      arrElem,
			      mappedElem; 

			  // First map the nodes of the array to an object -> create a hash table.
			  for(var i = 0, len = arr.length; i < len; i++) {
			    arrElem = arr[i];
			    mappedArr[arrElem.id] = arrElem;
			    mappedArr[arrElem.id]['children'] = [];
			  }


			  for (var id in mappedArr) {
			    if (mappedArr.hasOwnProperty(id)) {
			      mappedElem = mappedArr[id];
			      // If the element is not at the root level, add it to its parent array of children.
			      if (mappedElem.parent_id) {
			        mappedArr[mappedElem['parent_id']]['children'].push(mappedElem);
			      }
			      // If the element is at the root level, add it to first level elements array.
			      else {
			        tree.push(mappedElem);
			      }
			    }
			  }
			  return tree;
			} 
		 
		 var tree = unflatten( obj );
		 
		 console.log(tree);

	   
	    
	    
	   /* var parent_obj =[];
	    
	    for ( var i=0; i<obj.length ; i++){
	    
	    	
	    	if(obj[i].parent_id == null ) {
	    	//	parent_obj.push(obj[i]);
	    		
	    	
	    		 parent_obj.push({id: obj[i].id, parent_id: obj[i].parent_id, title: obj[i].title, child : ''});
		
	    	
	    	} 
	    	
	    }
	    
	    console.log("parent_obj:"+ JSON.stringify(parent_obj));
	    
		var children_obj =[];
		for ( var j=0; j<parent_obj.length ; j++){
			
			for ( var i=0; i<obj.length ; i++){

				
				 {"id":1,"parent_id":null,"title":"Row 1"},{"id":2,"parent_id":null,"title":"Row 2"}] 
				//자식의  parent_id가 부모의id하고 같은경우.
				 if(parent_obj[j].id == obj[i].parent_id  ) {
					 
					 alert(obj[i].title);
					 var obj2 = {};

					 obj2[title] = obj[i].title;
					 obj2[id] = obj[i].id;

					 //ary.push(obj2);
					 
			
					 parent_obj.push({id: parent_obj[j].id
						 , parent_id: parent_obj[j].parent_id
						 , title: parent_obj[j].title
						 , child : obj2
						 
					 });
	    	
			     } 
				
		    }
		}*/
		
	

});


</script>
    
   </head>
   <body>
   
<script id="personTpl" type="text/template">
{{#root}}
	<h1>{{contents}} {{parent_seq}}</h1>
		{{#children}}
				{{contents}} {{parent_seq}}
		{{/children}}
{{/root}}	
</script>
   <div id="sampleArea">
   
   
   </div>
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