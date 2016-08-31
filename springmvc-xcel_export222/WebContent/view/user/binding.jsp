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
<script type="text/javascript" src='<c:url value="/resources/jquery-1.11.3.js"/>'></script>
<title>Data Binding Example</title>
<link rel="stylesheet" type="text/css" href="${ctx}/extjs2/examples/classic/shared/examples.css" />
<!-- GC -->
<script type="text/javascript" src="${ctx}/extjs2/examples/classic/shared/include-ext.js"></script>
<script type="text/javascript" src="${ctx}/extjs2/examples/classic/shared/options-toolbar.js"></script>


    <!-- Include the translations -->
    <script type="text/javascript" src="${ctx}/extjs2/ext/classic/locale/overrides/ko/ext-locale-ko.js"></script>
<!-- page specific -->
<script>

	Ext.require([ 'Ext.grid.*', 'Ext.data.*', 'Ext.panel.*', 'Ext.layout.container.Border' ]);

	Ext.onReady(function() {
		
		
		
		//그리드 모델 정의 
		Ext.define('Book', {
			extend : 'Ext.data.Model',
			proxy : {
				type : 'ajax',
				reader : 'json'
			},
			fields : [
			'Author',
			 'Title', 'Manufacturer', 'ProductGroup', 'DetailPageURL' ]
		});

		
		
		// create the Data Store
		var store = Ext.create('Ext.data.ArrayStore', {
			model : 'Book',
			proxy : {
				// load using HTTP
				type : 'ajax',
				url : '${ctx}/test/getGrid.do',
				
				reader : {
					type : 'json',
					root : 'resultList',
					totalProperty : 'total'
				}
			}
		});

		// create the grid
		var grid = Ext.create('Ext.grid.Panel', {
			bufferedRenderer : false,
			store : store,
			columns : [ {
				text : "작가",
				width : 120,
				dataIndex : 'Author',
				sortable : true
			}, {
				text : "제목",
				flex : 1,
				dataIndex : 'Title',
				sortable : true
			}, {
				text : "Manufacturer",
				width : 125,
				dataIndex : 'Manufacturer',
				sortable : true
			}, {
				text : "Product Group",
				width : 125,
				dataIndex : 'ProductGroup',
				sortable : true
			} ],
			forceFit : true,
			height : 210,
			split : true,
			region : 'north'
		});

		// define a template to use for the detail view
		var bookTplMarkup = [ 'Title: <a href="{DetailPageURL}" target="_blank">{Title}</a><br/>', 'Author: {Author}<br/>',
				'Manufacturer: {Manufacturer}<br/>', 'Product Group: {ProductGroup}<br/>' ];
		var bookTpl = Ext.create('Ext.Template', bookTplMarkup);

		Ext.create('Ext.Panel', {
			renderTo : 'binding-example',
			frame : true,
			title : 'Book List',
			width : 580,
			height : 400,
			layout : 'border',
			items : [ grid, {
				id : 'detailPanel',
				region : 'center',
				bodyPadding : 7,
				bodyStyle : "background: #ffffff;",
				html : 'Please select a book to see additional details.'
			} ]
		});

		// update panel body on selection change
		grid.getSelectionModel().on('selectionchange', function(sm, selectedRecord) {
			if (selectedRecord.length) {
				var detailPanel = Ext.getCmp('detailPanel');
				detailPanel.update(bookTpl.apply(selectedRecord[0].data));
			}
		});

		store.load();
		
		
	});//extonready End
</script>
</head>
<body>
    <h1>Data Binding Example</h1>
    <p>This example expands upon the <a href="xml-grid.html">XML Grid example</a> and shows how to implement data binding for a master-detail view.</p>
    <p>Note that the js is not minified so it is readable. See <a href="binding.js">binding.js</a>.</p>
    <div id="binding-example"></div>
</body>
</html>
