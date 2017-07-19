package com.linkode.controller;

import java.text.ParseException;
import java.util.Date;

import com.linkode.exception.CustomException;
import com.linkode.pojo.Portfolio;
import com.linkode.pojo.PortfolioCmt;
import com.linkode.pojo.ViewModel.PortfolioViewModel;
import com.linkode.service.PortfolioCmtService;
import com.linkode.service.PortfolioService;
import com.linkode.util.DataPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
        Portfolio portfolio = portfolioService.findByPrimaryKey(id);
        model.addAttribute("cmts", portfolioCmtService.getAllPCVMById(id));
        return View("/portfolio/detail", model, portfolio);
    }

    @GetMapping("/update/{id}")
    public String updateView(Model model, @PathVariable("id") Integer id) throws CustomException {
        Portfolio portfolio = portfolioService.findByPrimaryKey(id);
        return View("/portfolio/update", model, portfolio);
    }

    /*======== 改 ========*/
    @PostMapping("/update")
    public String updateAction(Model model, HttpServletRequest req, @Validated Portfolio newPortfolio, BindingResult bindingResult) throws CustomException, ParseException {
    	Portfolio portfolio = portfolioService.findByPrimaryKey(newPortfolio.getId());
        portfolio.setContent(newPortfolio.getContent());
        portfolio.setType(newPortfolio.getType());
        portfolio.setTitle(newPortfolio.getTitle());
        portfolioService.updateByPrimaryKey(portfolio);
        return RedirectTo("/portfolio/"+newPortfolio.getId());
    }

    /*======== 增删 ========*/
    @PostMapping("/create")
    public String createAction(Model model, HttpServletRequest request, Portfolio portfolio) {
    	Integer userid = (Integer) session().getAttribute("LOGIN_USER_ID");
        portfolio.setUserId(userid);
        portfolio.setLikes(0);
        portfolio.setComments(0);
        portfolio.setTime(new Date());
        portfolioService.insert(portfolio);
        return RedirectTo("/portfolio/mine");
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
    public String deleteAction(@PathVariable("id") Integer id) {
        portfolioService.deleteByPrimaryKey(id);
        return RedirectTo("/portfolio/mine");
    }

}