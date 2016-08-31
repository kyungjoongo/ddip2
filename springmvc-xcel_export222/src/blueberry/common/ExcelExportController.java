package blueberry.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;


@Controller
public class ExcelExportController  {

    @RequestMapping(value = "/test/excelExport.do")
    public ModelAndView excelExport(ModelMap model, HttpServletRequest request) {
	ModelAndView mav = new ModelAndView();
	// dummy data
	Map valueMap = new HashMap();
	valueMap.put("Jan-2010", "$100,000,000");
	valueMap.put("Feb-2010", "$110,000,000");
	valueMap.put("Mar-2010", "$130,000,000");
	valueMap.put("Apr-2010", "$140,000,000");
	valueMap.put("May-2010", "$200,000,000");

	
	mav.setViewName("ExcelRevenueSummary");
	
	mav.addObject("valueMap", valueMap);
 
	return mav;
    }

    /*
     * @Override protected ModelAndView handleRequestInternal(HttpServletRequest
     * request, HttpServletResponse response) throws Exception {
     * 
     * String output = ServletRequestUtils.getStringParameter(request,
     * "output");
     * 
     * 
     * }
     */
}