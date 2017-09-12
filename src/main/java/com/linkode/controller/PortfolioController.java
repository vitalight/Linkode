package com.linkode.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Writer;
import java.text.ParseException;
import java.util.Date;

import com.linkode.exception.CustomException;
import com.linkode.pojo.Portfolio;
import com.linkode.pojo.PortfolioCmt;
import com.linkode.pojo.PortfolioLike;
import com.linkode.pojo.Report;
import com.linkode.pojo.ViewModel.PortfolioViewModel;
import com.linkode.service.PortfolioCmtService;
import com.linkode.service.PortfolioLikeService;
import com.linkode.service.PortfolioService;
import com.linkode.service.ReportService;
import com.linkode.util.FileUploadUtil;

import org.apache.commons.fileupload.util.Streams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping("/portfolio")
public class PortfolioController extends BaseController {

    @Autowired
    private PortfolioService portfolioService;
    @Autowired
    private PortfolioCmtService portfolioCmtService;
    @Autowired
    private PortfolioLikeService portfolioLikeService;
    @Autowired
    private ReportService reportService;

    /*======== 查 ========*/
    @GetMapping("")
    public String exploreView(Model model, String type) {
    	model.addAttribute("type",type);
        return View("/portfolio/all", model, portfolioService.getAllPVM(type));
    }
    
    @GetMapping("/mine")
    public String myPortfolioView(Model model) {
    	Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
        return View("/portfolio/mine", model, portfolioService.getByUserId(userid));
}

    @GetMapping("/create")
    public String createView() {
        return View("/portfolio/create");
    }

    @GetMapping("/{id}")
    public String detailView(Model model, @PathVariable("id") Integer id) throws CustomException {
    	Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
    	PortfolioViewModel pvm = portfolioService.getPVMByPrimaryKey(id);
    	if (pvm.getStatus()!=null && pvm.getStatus()==0) {
    		return View("404");
    	}
        model.addAttribute("cmts", portfolioCmtService.getAllPCVMById(id));
        model.addAttribute("like",portfolioLikeService.getByUidPid(userid, id)?"hasLiked":"");
        return View("/portfolio/detail", model, pvm);
    }

    @GetMapping("/update/{id}")
    public String updateView(Model model, @PathVariable("id") Integer id) throws CustomException {
        Portfolio portfolio = portfolioService.findByPrimaryKey(id);
        if (!isAuthorized(portfolio.getUserId())) {
        	model.addAttribute("message", "无操作权限。");
        	return View("error");
        }
        return View("/portfolio/update", model, portfolio);
    }

    /*======== 改 ========*/
    @PostMapping("/update")
    public String updateAction(Model model, HttpServletRequest req, @Validated Portfolio newPortfolio, BindingResult bindingResult) throws CustomException, ParseException {
    	Portfolio portfolio = portfolioService.findByPrimaryKey(newPortfolio.getId());
    	if (!isAuthorized(portfolio.getUserId())) {
        	model.addAttribute("message", "无操作权限。");
        	return View("error");
        }
        portfolio.setContent(newPortfolio.getContent());
        portfolio.setType(newPortfolio.getType());
        portfolio.setTitle(newPortfolio.getTitle());
        portfolioService.updateByPrimaryKey(portfolio);
        return RedirectTo("/portfolio/"+newPortfolio.getId());
    }

    @GetMapping("/update/{id}/file")
    public String updateFileView(Model model, @PathVariable("id") Integer id) {
    	return View("/portfolio/updateFile");
    }
    
    @PostMapping("/update/{id}/file")
    public String updateFileAction(Model model, HttpServletRequest request, @PathVariable("id") Integer id, @RequestParam("file") MultipartFile file) {
    	String realPath = request.getSession().getServletContext().getRealPath("upload");
    	
    	Portfolio portfolio = portfolioService.findByPrimaryKey(id);
		String filename = id+file.getOriginalFilename();
        FileUploadUtil.upload(file, realPath+"/"+filename);
    	portfolio.setUrl(filename);
    	portfolioService.updateByPrimaryKey(portfolio);
    	
        return RedirectTo("/portfolio/"+id);
    }
    
    /*======== 增删 ========*/
    @PostMapping("/create")
    public String createAction(Model model, HttpServletRequest request, Portfolio portfolio, @RequestParam("file") MultipartFile file) {
    	String realPath = request.getSession().getServletContext().getRealPath("upload");
    	
    	Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
        portfolio.setUserId(userid);
        portfolio.setLikes(0);
        portfolio.setComments(0);
        portfolio.setTime(new Date());
        portfolioService.insert(portfolio);
        
		String filename = portfolio.getId()+file.getOriginalFilename();
        if (!FileUploadUtil.upload(file, realPath+"/"+filename)) {
        	portfolioService.deleteByPrimaryKey(portfolio.getId());
        }
        portfolio.setUrl(filename);
        portfolioService.updateByPrimaryKey(portfolio);
        
        return RedirectTo("/portfolio/mine");
    }
    
    @GetMapping("/{id}/like")
    public void like(@PathVariable("id") Integer id, Writer writer) throws IOException {
    	Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
    	Portfolio portfolio = portfolioService.findByPrimaryKey(id);
    	if (portfolioLikeService.getByUidPid(userid, id)) {
    		portfolioLikeService.deleteByUidPid(userid, id);
	    	portfolio.setLikes(portfolio.getLikes()-1);
    	} else {
	    	PortfolioLike portfolioLike = new PortfolioLike();
	    	portfolioLike.setPortfolioId(id);
	    	portfolioLike.setUserId(userid);
	    	portfolioLikeService.insert(portfolioLike);
	   
	    	portfolio.setLikes(portfolio.getLikes()+1);
    	}
    	portfolioService.updateByPrimaryKey(portfolio);
    	StringBuffer stringBuffer = new StringBuffer();
    	stringBuffer.append(portfolio.getLikes());
    	writer.write(stringBuffer.toString());
    }
    
    @PostMapping("/{id}/comment")
    public String comment(@PathVariable("id") Integer id, PortfolioCmt portfolioCmt) {
    	Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
        portfolioCmt.setUserId(userid);
        portfolioCmt.setPortfolioId(id);
        portfolioCmt.setTime(new Date());
        portfolioCmtService.insert(portfolioCmt);
        
        Portfolio portfolio = portfolioService.findByPrimaryKey(portfolioCmt.getPortfolioId());
        portfolio.setComments(portfolio.getComments()+1);
        portfolioService.updateByPrimaryKey(portfolio);
    	return RedirectTo("/portfolio/"+id);
    }
    
    @GetMapping("/delete/{id}")
    public String deleteAction(Model model, @PathVariable("id") Integer id) {
    	if (!isAuthorized(portfolioService.findByPrimaryKey(id).getUserId())) {
        	model.addAttribute("message", "无操作权限。");
        	return View("error");
        }
        portfolioService.deleteByPrimaryKey(id);
        return RedirectTo("/portfolio/mine");
    }
    
    @PostMapping("/report/{id}")
    public String reportAction(@PathVariable("id") Integer id, Report report) {
    	Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
    	report.setUserId(userid);
    	report.setTime(new Date());
    	report.setPortfolioId(id);
    	reportService.insert(report);
		return null;
    }

}