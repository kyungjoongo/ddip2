 - jqGrid 함수(참고)
 http://www.trirand.com/jqgridwiki/doku.php?id=wiki:methods 

// 전체 행의 ID 가져오기(배열)
var rowIds = $("#list").jqGrid('getDataIDs');
 

// 선택된 행의 ID 가져오기
var rowIds = $("#list").jqGrid('getGridParam','selrow');
            = $("#list").getGridParam('selrow');

// 선택된 행의 ID 가져오기 ( multiselect: true 일 때)
var rowIds = $("#list").jqGrid('getGridParam' ,"selarrrow");  
   = $("#list").getGridParam('selarrrow'); 

// 전체 rowData 가져오기(배열)
var rowDatas = $("#list").jqGrid('getRowData');
   = $("#list").getRowData(); 

// 선택된 행의 rowData 가져오기
var rowData = $("#list").jqGrid('getRowData', rowId)
   = $("#list").getRowData(rowId); 


// 컬럼(optionName / optionValue) 가져오기
var colModels = $('#list').jqGrid('getGridParam', 'colModel'); 
          = $('#list').getGridParam('colModel');  

// 선택된 행 취소
$("#list").resetSelection(); 

// 컬럼 숨기기
$("#list").jqGrid('hideCol',["colName"]); 

// 그리드 영역 비우기
$("#list").jqGrid('clearGridData'); 

// 그리드 영역 새로고침
$("#list").trigger('reloadGrid'); 

// 그리드 영역 사이즈 변경
$("#list").setGridWidth(변경할 width ,true); 

// 그리드의 행을 추가
$("#list").jqGrid("addRow", {
           rowID  : rowid,        // rowID값은 중복되면 안됨
           initdata  : {},
           position  :"first",  // first, last
           useDefValues : false,
           useFormatter : false,
           addRowParams : {extraparam:{}}
}); 

// 그리드의 행을 삭제
$("#gridId").delRowData(rowId); 

// 그리드의 영역의 기본 버튼 설정
$("#list").jqGrid('navGrid', '#pager'
  ,{edit:false, add:false, del:false, search:false, refresh:false}
  ,{} // Edit Option
  ,{} // Add Option
  ,{} // Delete Option
  ,{} // search Option
  ,{} // View Parameter
);

//datatype    : 'local' 일경우 조회.
$( "#list" ).jqGrid( 'loadGridData' );