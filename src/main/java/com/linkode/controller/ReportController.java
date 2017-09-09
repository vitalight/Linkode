package com.linkode.controller;

import java.io.IOException;
import java.io.Writer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.linkode.service.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController extends BaseController {
	
	@Autowired
	ReportService reportService;
	
	@GetMapping("")
	String report(Model model) {
		Integer userid = (Integer)session().getAttribute("LOGIN_USER_ID");
		model.addAttribute("id1", userid);
		return View("/report/report", model, reportService.getNew());
	}
	
	@GetMapping("/{id}/pass")
	void passAction(Model model,@PathVariable("id") Integer id, Writer writer) throws IOException {
		reportService.pass(id);
		writer.write("success");
	}
	
	@GetMapping("/{id}/fail")
	void failAction(Model model,@PathVariable("id") Integer id, Writer writer) throws IOException {
		reportService.fail(id);
		writer.write("success");
	}
}