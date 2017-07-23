package com.linkode.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

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
	
	@GetMapping("/user/{id}")
	String test(Model model, @PathVariable("id") Integer id) {
		return View("/user/main");
	}
	
	@GetMapping("/home")
	String home(Model model) {
		model.addAttribute("portfolios", portfolioService.getAllPVM(null));
		model.addAttribute("projects",projectService.getUncontractedPVM());
		model.addAttribute("ads",adService.getAll());
		return View("/home");
	}
}
