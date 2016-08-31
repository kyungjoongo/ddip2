package blueberry.temp;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import blueberry.common.PageUtil;
import blueberry.user.UserVO;

@SuppressWarnings({ "rawtypes", "unused", "unchecked" })
@Controller
@RequestMapping(value = "/test")
public class TestController {

	@Autowired
	private TestService service;

	@RequestMapping(value = "/selectAdminUser.do", method = RequestMethod.GET)
	public ModelAndView listQuery(ModelMap model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		List arrList = new ArrayList();
		arrList = service.selectAdminUser();
		mav.setViewName("/temp/list");
		return mav;
	}

	@RequestMapping(value = "/jqgridsssideExam.do", method = RequestMethod.GET)
	public ModelAndView jqgridsssideExam(ModelMap model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		List arrList = new ArrayList();
		arrList = service.selectAdminUser();
		mav.setViewName("/temp/jqgridsssideExam");
		return mav;
	}
	
	@RequestMapping(value = "/list3.do", method = RequestMethod.GET)
	public ModelAndView list3(ModelMap model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		List arrList = new ArrayList();
		arrList = service.selectAdminUser();
		mav.setViewName("/temp/list3");
		return mav;
	}
	
	
	@RequestMapping(value = "/list.do")
	public @ResponseBody HashMap list(

			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
			@RequestParam(value = "sortOrder", defaultValue = "") String sortOrder,
			@RequestParam(value = "sortColumnName", defaultValue = "") String sortColumnName

	) {

		HashMap jsonObject = new HashMap();

		int totalRowCount = service.selectAdminUserTotCnt();

		PageUtil pu = new PageUtil(page, totalRowCount, pageSize, 10);
		HashMap pagemap = new HashMap();
		pagemap.put("startRow", (page - 1) * pageSize);
		// pagemap.put("endRow", pu.getEndRow());

		pagemap.put("pageSize", pageSize);
		pagemap.put("sortOrder", sortOrder);
		pagemap.put("sortColumnName", sortColumnName);

		String[] tempArr = null;

		String[] tempArr2 = { "test", "test2" };

		pagemap.put("tempArr", tempArr2);

		List<HashMap> arrList = service.selectAdminUserPaging(pagemap);

		for (HashMap mapone : arrList) {

			// mapone
		}

		jsonObject.put("pu", pu);
		jsonObject.put("rows", arrList);

		/*
		 * total = response.TotalPages, page = request.page, records =
		 * response.TotalRecords, rows = response.Rows
		 */

		jsonObject.put("page", page);
		int totalPageCnt = pu.getTotalPageCount();
		// 占쎈꽅占쎄퉱 占쎈읂占쎌뵠筌욑옙
		jsonObject.put("total", totalPageCnt);

		// 占쎈꽅占쎄퉱 占쎌쟿�굜遺얜굡占쎈뮞.
		jsonObject.put("records", totalRowCount);
		jsonObject.put("success", true);

		System.out.println("list==============================>");

		return jsonObject;
	}
	/*public Comparator<Map<String, String>> mapComparator = new Comparator<Map<String, String>>() {
	    public int compare(Map<String, String> m1, Map<String, String> m2) {
	        return m1.get("name").compareTo(m2.get("name"));
	    }
	}*/
	

	@RequestMapping(value = "/showTables.do")
	public @ResponseBody HashMap showTables(ModelMap model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HashMap jsonObject=new HashMap<>();
		// [{Field=id, Type=int(11), Null=YES, Extra=, Key=MUL}
		
		
		
		
		//ui에 보여줘야하는 테이블 리스트.
		List<String> showableTableList = compareTableProperies("test003", "test007");
		System.out.println("showableTableList-->" + showableTableList.toString());
		
		List<HashMap> colList2 =new ArrayList();
		List<HashMap> colList1 =new ArrayList();
		String tableNm = "";
		
		List<HashMap> newshowableTableList = new ArrayList();
		for ( String _tableNm : showableTableList){
			//tableNm
			colList2 = service.getColList(_tableNm);
			tableNm = _tableNm;
			HashMap tblPropertyMap = new HashMap();
			tblPropertyMap.put("tableNm", _tableNm);
			tblPropertyMap.put("colList", colList2);
			
			newshowableTableList.add(tblPropertyMap);
			
			System.out.println(_tableNm+ " ---->"+ colList2.toString());
		}
		
		
		colList1 = service.getColList("test003");
		
		colList2 = service.getColList("test007");
		ArrayList combineList = new ArrayList();
		
		ArrayList combielsit2 =new ArrayList<>();
		
		/*ArrayList<HashMap> category = new ArrayList<JRadioButton>();
		ArrayList<Integer> cat_ids = new ArrayList<Integer>();*/
		Iterator<HashMap> itrcolList1 = colList1.iterator();
		Iterator<HashMap> itrcolList2 = colList2.iterator();
		while(itrcolList1.hasNext() && itrcolList2.hasNext()) {
		    // put your logic here
			
			HashMap vmap1= itrcolList1.next();
			//vmap1{Field=name, Type=varchar(200), Null=YES, Extra=, Key=MUL}
			HashMap vmap2= itrcolList2.next();
			String Field= (String) vmap2.get("Field");
			String Type= (String) vmap2.get("Type");
			String Null= (String) vmap2.get("Null");
			String Extra= (String) vmap2.get("Extra");
			
			vmap1.put("Field2", Field);
			vmap1.put("Type2", Type);
			vmap1.put("Null2", Null);
			vmap1.put("Extra2", Extra);
			
			
			
			Iterator<String> treeMapIter = vmap1.keySet().iterator();
			 
	        while( treeMapIter.hasNext()) {
	 
	            String key = treeMapIter.next();
	            String value = (String) vmap1.get( key );
	 
	            System.out.println(key+" : "+value);
	 
	        }

	        combielsit2.add(vmap1);
		}
		
		
	 
		

		
		System.out.println(combielsit2);
		
		
		System.out.println("newshowableTableList-->"+ newshowableTableList);
		jsonObject.put("newshowableTableList", newshowableTableList);
		return jsonObject;
	}
	
	
	


	/**
	 * 두테이블 속성을 비교해 다를경우 해당 리스트를 반환.
	 * @param tableNm1
	 * @param tableNm2
	 * @return
	 */
	public List compareTableProperies(String tableNm1, String tableNm2) {

		// desc table002;
		List<HashMap> colList1 = service.getColList(tableNm1);

		// desc table003;
		List<HashMap> colList2 = service.getColList(tableNm2);
		// [{Field=id, Type=int(11), Null=YES, Extra=, Key=MUL}
		boolean bTablePropCompareResultSame = false;
		List showableTableList = new ArrayList();

		// 컬럼 비교..
		bTablePropCompareResultSame = equalLists(colList1, colList2);
		System.out.println("bTableCompareResultSame-->" + bTablePropCompareResultSame);

		// 컬럼이 동일하지 않은 경우 테이블을 보여주기 위해 테이블리스트에 더한다.
		if (!bTablePropCompareResultSame) {

			showableTableList.add(tableNm1);
			showableTableList.add(tableNm2);

		}
		return showableTableList;
	}

	public boolean equalLists(List<HashMap> a, List<HashMap> b) {
		// Check for sizes and nulls
		if ((a.size() != b.size()) || (a == null && b != null) || (a != null && b == null)) {
			return false;
		}
		if (a == null && b == null)
			return true;
		return a.equals(b);
	}

	

	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	public @ResponseBody HashMap add(@ModelAttribute TestVO vo) {

		ModelAndView mv = new ModelAndView();
		HashMap jsonObject = new HashMap();

		int result = service.add(vo);

		jsonObject.put("result", result);
		return jsonObject;
	}

	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public @ResponseBody HashMap delete(@RequestParam(value = "selectedRows") String selectedRows

	) {

		ModelAndView mv = new ModelAndView();
		HashMap jsonObject = new HashMap();

		String[] arrSelectedRows = selectedRows.split(",");

		int result = 0;
		for (int i = 0; i < arrSelectedRows.length; i++) {

			result = service.delete(arrSelectedRows[i]);
		}

		jsonObject.put("result", result);
		return jsonObject;
	}

	@RequestMapping(value = "/selectOne.do", method = RequestMethod.POST)
	public @ResponseBody HashMap selectOne(@RequestParam(value = "id") String id

	) {

		ModelAndView mv = new ModelAndView();
		HashMap jsonObject = new HashMap();
		HashMap map = service.selectOne(id);

		jsonObject.put("result", map);
		return jsonObject;
	}

	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public @ResponseBody HashMap update(@ModelAttribute TestVO vo) {

		ModelAndView mv = new ModelAndView();
		HashMap jsonObject = new HashMap();
		int result = service.update(vo);
		jsonObject.put("result", result);
		return jsonObject;
	}

	@RequestMapping(value = "/updateCells.do", method = RequestMethod.POST)
	public @ResponseBody HashMap updateCells(@RequestParam(value = "id") Integer id,
			@RequestParam(value = "cellName") String cellName, @RequestParam(value = "cellValue") String cellValue) {

		ModelAndView mv = new ModelAndView();
		HashMap jsonObject = new HashMap();
		HashMap valueMap = new HashMap();
		valueMap.put("id", id);
		valueMap.put("colNm", cellName);
		valueMap.put("value", cellValue);

		int result = service.updateCell(valueMap);
		jsonObject.put("result", result);

		return jsonObject;

	}

	@RequestMapping(value = "/getGrid.do")
	public @ResponseBody HashMap getGrid(
	// @RequestParam(value = "id") String id

	) {

		ModelAndView mv = new ModelAndView();
		HashMap JsonObject = new HashMap();
		HashMap valueMap = new HashMap();
		List arrList = new ArrayList();
		/*
		 * 'Author', 'Title', 'Manufacturer', 'ProductGroup', 'DetailPageURL'
		 */
		valueMap.put("Author", "고경준");
		valueMap.put("Title", "고경준은 천재인가");
		valueMap.put("Manufacturer", "고경사");
		valueMap.put("ProductGroup", "geniusGroup");
		valueMap.put("DetailPageURL", "http://kyungjoongo.com");

		arrList.add(valueMap);

		HashMap valueMap2 = new HashMap();

		valueMap2.put("Author", "고경준2");
		valueMap2.put("Title", "고경준은 천재인가123");
		valueMap2.put("Manufacturer", "고경사23");
		valueMap2.put("ProductGroup", "geniusGrou2323p");
		valueMap2.put("DetailPageURL", "http://kyungjoongo.com2323");

		arrList.add(valueMap2);

		JsonObject.put("resultList", arrList);
		JsonObject.put("total", arrList.size());

		return JsonObject;
	}

}