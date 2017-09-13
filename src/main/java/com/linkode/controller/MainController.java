package com.linkode.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.linkode.pojo.Ad;
import com.linkode.pojo.Portfolio;
import com.linkode.service.AdService;
import com.linkode.service.PortfolioService;
import com.linkode.service.ProjectService;
import com.linkode.service.ReportService;
import com.linkode.service.UserService;
import com.linkode.util.FileUploadUtil;

@Controller
public class MainController extends BaseController {
	
	@Autowired
    private PortfolioService portfolioService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private AdService adService;
	@Autowired
	private UserService userService;
	/**
     * 此类用于将Jsp上的java.sql.Date转为java.util.Date并解决时区问题。
     * 若不setTimeZone，则存入数据库中的日期会缺一天。
     */
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    dateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	@GetMapping("/home")
	String home(Model model) {
		model.addAttribute("portfolios", portfolioService.getAllPVM(null));
		model.addAttribute("projects",projectService.getUncontractedPVM());
		model.addAttribute("ads",adService.getRandom());
		return View("/home");
	}
	
	@GetMapping("/search")
	String search(Model model, String keyword) {
		model.addAttribute("keyword",keyword);
		model.addAttribute("projects", projectService.search(keyword));
		model.addAttribute("portfolios", portfolioService.search(keyword));
		model.addAttribute("users", userService.search(keyword));
		return View("/search");
	}
	
	@GetMapping("/ad/{id}/edit")
	String adEditView(Model model, @PathVariable("id") Integer id) {
		return View("/crud/adEdit", model, adService.getById(id));
	}
	
	@PostMapping("/ad/{id}/edit")
	String adEditAction(Model model, @PathVariable("id") Integer id, Ad newAd) {
		Ad ad = adService.getById(id);
		newAd.setFilename(ad.getFilename());
		adService.update(newAd);
		return RedirectTo("/admin");
	}
	
	@GetMapping("/ad/{id}/editFile")
	String adEditFileView(Model model, @PathVariable("id") Integer id) {
		return View("/crud/adEditFile", model, adService.getById(id));
	}
	
	@PostMapping("/ad/{id}/editFile")
	String adEditFileAction(Model model, HttpServletRequest request, @PathVariable("id") Integer id, @RequestParam("file") MultipartFile file) {
		String realPath = request.getSession().getServletContext().getRealPath("static/img/ad");
    	
    	Ad ad = adService.getById(id);
		String filename = "ad"+id+file.getOriginalFilename();
        FileUploadUtil.upload(file, realPath+"/"+filename);
    	ad.setFilename(filename);
    	adService.update(ad);
    	
        return RedirectTo("/admin");
	}
	
	@GetMapping("/ad/{id}/delete")
	String adDeleteView(Model model, @PathVariable("id") Integer id) {
		adService.deleteById(id);
		return RedirectTo("/admin");
	}
	
	@GetMapping("/ad/create")
	String adCreateView(Model model){
		return View("/crud/adCreate");
	}
	
	@PostMapping("/ad/create")
	String adCreateAction(Model model,  HttpServletRequest request, Ad ad, @RequestParam("file") MultipartFile file) {
		String realPath = request.getSession().getServletContext().getRealPath("static/img/ad");
    	
        adService.insert(ad);
        
		String filename = "ad"+ad.getId()+file.getOriginalFilename();
        if (!FileUploadUtil.upload(file, realPath+"/"+filename)) {
        	portfolioService.deleteByPrimaryKey(ad.getId());
            return RedirectTo("/admin");
        }
        ad.setFilename(filename);
        adService.update(ad);
        
        return RedirectTo("/admin");
	}
}
