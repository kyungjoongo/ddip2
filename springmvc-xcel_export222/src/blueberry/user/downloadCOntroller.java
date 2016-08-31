/*package blueberry.user;


import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
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
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;

import blueberry.common.PageUtil;




@SuppressWarnings({
	"rawtypes", "unchecked"
})@Controller
@RequestMapping("/user")
public class downloadCOntroller {

	@Autowired
	private UserService userService = null;


	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
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

		//logined ï¿½ì‘€ï¿½ï¿½ ï¿½ê½­ï¿½ë€¡ ï§£ì„Žâ”�
		mav.addObject("loginedUserSesMap", (HashMap) request.getSession().getAttribute("userSes"));
		return mav;
	}

	@RequestMapping(value = "/form.do", method = RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("/user/form");
		mv.addObject("loginedUserSesMap", (HashMap) request.getSession().getAttribute("userSes"));

		return mv;
	}
	
	
	
	sdfsdf


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


}*/