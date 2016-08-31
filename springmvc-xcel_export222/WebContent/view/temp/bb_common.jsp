<%@ page session="true" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
    <link rel="stylesheet" type="text/css" media="screen" href="${ctx}/resources/ui.jqgrid.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/resources/jquery-ui-1.11.4/jquery-ui.css" />
	
	<!-- multi-select.css -->
	
	multi-select.css
	<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/resources/multiselect/css/multi-select.css" />
    <script type="text/javascript" src='<c:url value="/resources/jquery-1.11.3.js"/>'></script>
    <script type="text/javascript" src='<c:url value="/resources/grid.locale-kr.js"/>'></script>
    <script type="text/javascript" src='<c:url value="/resources/jquery.jqGrid.js"/>'></script>
    <script src="${ctx}/resources/jquery-ui-1.11.4/jquery-ui.js"></script>
    <script src="${ctx}/resources/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src='<c:url value="/resources/jquery.autocomplete.js"/>'></script>
    <link rel="stylesheet" type="text/css" media="screen" href="${ctx}/resources/jquery.autocomplete.css" />
    
    <!-- resources\multiselect -->
    
    <script src="${ctx}/resources/multiselect/js/jquery.multi-select.js"></script>