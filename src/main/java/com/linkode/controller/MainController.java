package com.linkode.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.linkode.service.AdService;
import com.linkode.service.PortfolioService;
import com.linkode.service.ProjectService;

@Controller
public class MainController extends BaseController {
	
	@Autowired
    private PortfolioService portfolioService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private AdService adService;
	
	@GetMapping("/home")
	String home(Model model) {
		model.addAttribute("portfolios", portfolioService.getAllPVM(null));
		model.addAttribute("projects",projectService.getAll());
		model.addAttribute("ads",adService.getAll());
		return View("/home");
	}
}
