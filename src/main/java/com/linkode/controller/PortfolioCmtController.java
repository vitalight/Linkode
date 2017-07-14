package com.linkode.controller;

import java.text.ParseException;
import java.util.Date;

import com.linkode.pojo.Portfolio;
import com.linkode.pojo.PortfolioCmt;
import com.linkode.service.PortfolioCmtService;
import com.linkode.util.DataPage;
import com.linkode.pojo.ViewModel.PortfolioCmtViewModel;
import com.linkode.pojo.ViewModel.PortfolioViewModel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/portfolioCmt")
public class PortfolioCmtController extends BaseController {

    @Autowired
    private PortfolioCmtService PortfolioCmtService;

    /*======== 查 ========*/
    @GetMapping("")
    public String exploreView(Model model,HttpSession httpSession, Integer p,HttpServletRequest request, @Valid PortfolioViewModel PortfolioVM, BindingResult bindingResult) {  	
        p = p == null ? 1 : (p < 1 ? 1 : p);
        DataPage<PortfolioCmtViewModel> page = PortfolioCmtService.selectPCVMPageById(p, 10, 6,	PortfolioVM.getId());
        System.out.println(PortfolioVM.getContent());
        httpSession.setAttribute("portfolioVM",PortfolioVM );  
        return View("/portfolio/cmt", model, page);
    }
   
    @GetMapping("/refresh")
    public String refresh(Model model,HttpSession httpSession, Integer p) {  	
        p = p == null ? 1 : (p < 1 ? 1 : p);
        PortfolioViewModel PortfolioVM=(PortfolioViewModel) httpSession.getAttribute("portfolioVM");
        DataPage<PortfolioCmtViewModel> page = PortfolioCmtService.selectPCVMPageById(p, 10, 6,	PortfolioVM.getId());
        return View("/portfolio/cmt", model, page);
    }

    /*======== 增删 ========*/
    @PostMapping("/create")
    public String createAction(Model model, HttpSession httpSession,HttpServletRequest request, @Valid PortfolioCmt PortfolioCmt, BindingResult bindingResult) throws ParseException {
    	Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
        PortfolioCmt.setUserId(userid);
        PortfolioCmt.setPortfolioId(((PortfolioViewModel)httpSession.getAttribute("portfolioVM")).getId());
        Date time=new Date();
        PortfolioCmt.setTime(time);
        PortfolioCmtService.insert(PortfolioCmt);
        return RedirectTo("/portfolioCmt/refresh");
    }

    @GetMapping("/delete/{id}")
    public String deleteAction(@PathVariable("id") Integer id) {
        PortfolioCmtService.deleteByPrimaryKey(id);
        return RedirectTo("/portfolioCmt/refresh");
    }

}