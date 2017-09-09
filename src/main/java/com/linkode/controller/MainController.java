package com.linkode.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.linkode.service.AdService;
import com.linkode.service.PortfolioService;
import com.linkode.service.ProjectService;
import com.linkode.service.ReportService;
import com.linkode.service.UserService;

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
	@Autowired
	private ReportService reportService;
	
	@GetMapping("/home")
	String home(Model model) {
		model.addAttribute("portfolios", portfolioService.getAllPVM(null));
		model.addAttribute("projects",projectService.getUncontractedPVM());
		model.addAttribute("ads",adService.getAll());
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
}
