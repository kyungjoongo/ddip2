package blueberry.user;


import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;

import blueberry.common.PageUtil;




@SuppressWarnings({
	"rawtypes", "unchecked"
})

@Controller
public class UserController {

	@Autowired
	private UserService userService = null;
	
	

	@RequestMapping(value = "/upload.do", headers = "content-type=multipart/*", method = RequestMethod.POST)
	public ModelAndView importProject( @RequestParam(value = "uploadfile") MultipartFile  uploadfile) {
	    

		ModelAndView mav = new ModelAndView("form");
		HashMap vmap = new HashMap();

		//vmap.put("id", id);

		mav.addObject("user", userService.getUser(vmap));


		mav.setViewName("/user/modifyform");


		return mav;
	}



	@RequestMapping(value = "/user/list.do", method = RequestMethod.GET)
	public ModelAndView list(ModelMap model, HttpServletRequest request, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {

		ModelAndView mav = new ModelAndView();
		
		String restOfTheUrl = (String) request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
		mav.addObject("restOfTheUrl", restOfTheUrl);

		int totalRowCount = (int) userService.getUserCount();
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 10, 10);
		HashMap pagemap = new HashMap();
		pagemap.put("startRow", pu.getStartRow());
		pagemap.put("endRow", pu.getEndRow());
		List <? > arrList = (List) userService.getAllUser(pagemap);
		mav.addObject("pu", pu);


		mav.addObject("users", arrList);
		mav.setViewName("/user/list");

		//logined 챦쩔쩍챙�섃궗챦쩔쩍챦쩔쩍 챦쩔쩍챗쩍짯챦쩔쩍챘�궗징 챦짠짙챙�왙시™�앾옙
		mav.addObject("loginedUserSesMap", (HashMap) request.getSession().getAttribute("userSes"));
		return mav;
	}
	
	
	@RequestMapping(value = "/user/list2.do", method = RequestMethod.GET)
	public ModelAndView list2(ModelMap model, HttpServletRequest request, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {

		ModelAndView mav = new ModelAndView();
		
		String restOfTheUrl = (String) request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
		mav.addObject("restOfTheUrl", restOfTheUrl);
		
		HashMap valueMap=new HashMap();

		//List <? > arrList = (List) userService.getAllUser(pagemap);
		
		List <? > arrList = (List) userService.getCommentList(valueMap);



		mav.addObject("users", arrList);
		mav.setViewName("/user/list");

		return mav;
	}
	
	
	@RequestMapping(value = "/user/getCommentList.do")
	public @ResponseBody HashMap getCommentList(
		
		 @RequestParam(value = "parent_seq", defaultValue = "") String parent_seq
		
		) {

		HashMap JsonObject =new HashMap();
		HashMap valueMap=new HashMap();
		
		valueMap.put("parent_seq", parent_seq);
		
		List <? > arrList = (List) userService.getCommentList(valueMap);

		JsonObject.put("result", arrList);
		
		return JsonObject;

	}
	
	  private static final String[] COUNTRIES = new String[] {
	          "Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra","怨좉꼍以�", "怨좉꼍以�泥쒖옱",
	          "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina",
	          "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan",
	          "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium",
	          "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia",
	          "Bosnia and Herzegovina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory",
	          "British Virgin Islands", "Brunei", "Bulgaria", "Burkina Faso", "Burundi",
	          "Cote d'Ivoire", "Cambodia", "Cameroon", "Canada", "Cape Verde",
	          "Cayman Islands", "Central African Republic", "Chad", "Chile", "China",
	          "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo",
	          "Cook Islands", "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czech Republic",
	          "Democratic Republic of the Congo", "Denmark", "Djibouti", "Dominica", "Dominican Republic",
	          "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea",
	          "Estonia", "Ethiopia", "Faeroe Islands", "Falkland Islands", "Fiji", "Finland",
	          "Former Yugoslav Republic of Macedonia", "France", "French Guiana", "French Polynesia",
	          "French Southern Territories", "Gabon", "Georgia", "Germany", "Ghana", "Gibraltar",
	          "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau",
	          "Guyana", "Haiti", "Heard Island and McDonald Islands", "Honduras", "Hong Kong", "Hungary",
	          "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy", "Jamaica",
	          "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kuwait", "Kyrgyzstan", "Laos",
	          "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg",
	          "Macau", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands",
	          "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia", "Moldova",
	          "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia",
	          "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand",
	          "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "North Korea", "Northern Marianas",
	          "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru",
	          "Philippines", "Pitcairn Islands", "Poland", "Portugal", "Puerto Rico", "Qatar",
	          "Reunion", "Romania", "Russia", "Rwanda", "Sqo Tome and Principe", "Saint Helena",
	          "Saint Kitts and Nevis", "Saint Lucia", "Saint Pierre and Miquelon",
	          "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Saudi Arabia", "Senegal",
	          "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands",
	          "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "South Korea",
	          "Spain", "Sri Lanka", "Sudan", "Suriname", "Svalbard and Jan Mayen", "Swaziland", "Sweden",
	          "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "The Bahamas",
	          "The Gambia", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey",
	          "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Virgin Islands", "Uganda",
	          "Ukraine", "United Arab Emirates", "United Kingdom",
	          "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan",
	          "Vanuatu", "Vatican City", "Venezuela", "Vietnam", "Wallis and Futuna", "Western Sahara",
	          "Yemen", "Yugoslavia", "Zambia", "Zimbabwe"
	        };

	
	
    @RequestMapping(value = "/user/get333.do", method = RequestMethod.GET)
    public @ResponseBody HashMap get333(
    	@RequestParam(value = "term", defaultValue = "") String term
    
    ) {
    
    	HashMap JsonObject = new HashMap();
    	HashMap valueMap = new HashMap();
    
    	//JSONArray arrayObj = new JSONArray();
    	
    	List arrList=new ArrayList();
    	
    
    	String query = term;
    	System.out.println(query);
    	query = query.toLowerCase();
    	for (int i = 0; i < COUNTRIES.length; i++) {
    	    String country = COUNTRIES[i].toLowerCase();
    	    if (country.contains(query)) {
    		arrList.add(COUNTRIES[i]);
    	    }
    	}
    	
    	JsonObject.put("result", arrList);
    
    	return JsonObject;

    }
	
	

	@RequestMapping(value = "/form.do", method = RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("/user/form");
		mv.addObject("loginedUserSesMap", (HashMap) request.getSession().getAttribute("userSes"));

		return mv;
	}
	
	


	@RequestMapping(value = "/addUser.do", method = RequestMethod.POST)
	public ModelAndView add(@ModelAttribute(value = "user") UserVO user, HttpServletRequest request, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {

		ModelAndView mv = new ModelAndView();
		userService.addUser(user);

		mv.addObject("user", user);

		int totalRowCount = (int) userService.getUserCount();
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 10, 10);
		HashMap pagemap = new HashMap();
		pagemap.put("startRow", pu.getStartRow());
		pagemap.put("endRow", pu.getEndRow());
		List <? > arrList = (List) userService.getAllUser(pagemap);
		mv.addObject("pu", pu);

		mv.addObject("users", arrList);



		mv.setViewName("/user/list");

		//logined  User ssession
		mv.addObject("loginedUserSesMap", (HashMap) request.getSession().getAttribute("userSes"));
		return mv;
	}

	
	@RequestMapping(value = "/modifyForm.do", method = RequestMethod.GET)
	public ModelAndView modifyForm(@RequestParam("id") String id) {



		ModelAndView mav = new ModelAndView("form");
		HashMap vmap = new HashMap();

		vmap.put("id", id);

		mav.addObject("user", userService.getUser(vmap));


		mav.setViewName("/user/modifyform");


		return mav;
	}

	@RequestMapping(value = "/updateUser.do", method = RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute(value = "user") UserVO user, HttpServletRequest request, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {

		ModelAndView mv = new ModelAndView("/user/list");
		userService.updateUser(user);


		int totalRowCount = (int) userService.getUserCount();
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 10, 10);
		HashMap pagemap = new HashMap();
		pagemap.put("startRow", pu.getStartRow());
		pagemap.put("endRow", pu.getEndRow());
		List <? > arrList = (List) userService.getAllUser(pagemap);
		mv.addObject("pu", pu);

		mv.addObject("users", arrList);

		mv.addObject("loginedUserSesMap", (HashMap) request.getSession().getAttribute("userSes"));
		return mv;
	}

	
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public ModelAndView delete(@RequestParam("id") String id, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {



		ModelAndView mv = new ModelAndView("/user/list");

		userService.deleteUser(id);

		int totalRowCount = (int) userService.getUserCount();
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 10, 10);
		HashMap pagemap = new HashMap();
		pagemap.put("startRow", pu.getStartRow());
		pagemap.put("endRow", pu.getEndRow());
		List <? > arrList = (List) userService.getAllUser(pagemap);
		mv.addObject("pu", pu);

		mv.addObject("users", arrList);
		return mv;
	}

	
	@RequestMapping(value = "/download.do", method = RequestMethod.GET)
	public void download(
		HttpServletRequest request, HttpServletResponse response) 
		            throws ServletException, IOException {



	    try {
	            //
	            // The path below is the root directory of data to be
	            // compressed.
	            //
	            String path = "C:\\LG\\LGFlashTool";
	 
	            File directory = new File(path);
	            String[] files = directory.list();
	 
	            //
	            // Checks to see if the directory contains some files.
	            //
	            if (files != null && files.length > 0) {
	 
	                //
	                // Call the zipFiles method for creating a zip stream.
	                //
	                byte[] zip = zipFiles(directory, files, path);
	 
	                //
	                // Sends the response back to the user / browser. The
	                // content for zip file type is "application/zip". We
	                // also set the content disposition as attachment for
	                // the browser to show a dialog that will let user 
	                // choose what action will he do to the sent content.
	                //
	                ServletOutputStream sos = response.getOutputStream();
	                response.setContentType("application/zip");
	                response.setHeader("Content-Disposition", "attachment; filename='DATA.ZIP'");
	 
	                sos.write(zip);
	                sos.flush();
	            }
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	}
	
	 private byte[] zipFiles(File directory, String[] files, String path) throws IOException {
	     
	     
	        ByteArrayOutputStream baos = new ByteArrayOutputStream();
	        ZipOutputStream zos = new ZipOutputStream(baos);
	        byte bytes[] = new byte[2048];
	 
	        for (String fileName : files) {
	            FileInputStream fis = new FileInputStream(path +"\\" + fileName);
	            BufferedInputStream bis = new BufferedInputStream(fis);
	 
	            zos.putNextEntry(new ZipEntry(fileName));
	 
	            int bytesRead;
	            while ((bytesRead = bis.read(bytes)) != -1) {
	                zos.write(bytes, 0, bytesRead);
	            }
	            zos.closeEntry();
	            bis.close();
	            fis.close();
	        }
	        zos.flush();
	        baos.flush();
	        zos.close();
	        baos.close();
	 
	        return baos.toByteArray();
	    }


}