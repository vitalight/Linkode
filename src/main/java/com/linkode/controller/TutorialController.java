package com.linkode.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import com.linkode.exception.CustomException;
import com.linkode.pojo.Tutorial;
import com.linkode.service.TutorialService;
import com.linkode.pojo.ViewModel.TutorialViewModel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping("/tutorial")
public class TutorialController extends BaseController {
	
	@Autowired
	TutorialService tutorialService;
	
	@GetMapping("")
	public String check() {
		return RedirectTo("/tutorial/1");
	}
	
	/*======== 编辑导航栏 =========*/
	@GetMapping("/updateNavigator")
	public String edit(Model model) {
		List<Tutorial> tutorials = tutorialService.selectAllTutorial();
		model.addAttribute("id",0);
		return View("/tutorial/updateNavigator",model,tutorials);
	}
	
	@GetMapping("/updateNavigator/{id}")
	public String editFrom(Model model, HttpServletRequest req, @PathVariable("id") Integer id) throws CustomException {
		List<Tutorial> tutorials = tutorialService.selectAllTutorial();
		model.addAttribute("id",id);
		return View("/tutorial/updateNavigator",model,tutorials);
	}
	
	@GetMapping("/updateNavigator/{id1}/{id2}")
	public String editFromTo(Model model, HttpServletRequest req, @PathVariable("id1") Integer id1, @PathVariable("id2") Integer id2) {
		req.removeAttribute("tutNum1");
		if (id1 == id2)
			return RedirectTo("/tutorial/edit");
		List<Tutorial> tutorials = tutorialService.selectAllTutorial();
		int start = 0, end = 0;
		if (id2 == 0) {
			end = 0;
			id2 = tutorials.get(0).getId();
		} else {
			for (int i = 0; i < tutorials.size(); i++)
				if (tutorials.get(i).getId() == id2) {
					if (id2 < id1) {
						end = i + 1;
					} else {
						end = i;
					}
					id2 = tutorials.get(end).getId();
					break;
				}
		}
		for (int i = 0; i < tutorials.size(); i++)
			if (tutorials.get(i).getId() == id1) {
				start = i;
				break;
			}
		if (start == end)
			return RedirectTo("/tutorial/updateNavigator");
		
		/*======== then swap the tutorials ========*/
		tutorialService.swapTutorial(id1, id2);
		if (start > end + 1) {
			for (int i = start; i > end + 1; i--)
				tutorialService.swapTutorial(tutorials.get(i).getId(), tutorials.get(i-1).getId());
		} else if (start < end - 1) {
			for (int i = start; i < end - 1; i++)
				tutorialService.swapTutorial(tutorials.get(i).getId(), tutorials.get(i+1).getId());
		}
		return RedirectTo("/tutorial/updateNavigator");
	}
	
	/*======== 查 ========*/
	@GetMapping("/{id}")
	public String show(Model model, HttpServletRequest req, @PathVariable("id") Integer id) throws CustomException {
		Tutorial tutorial = tutorialService.findByPrimaryKey(id);
		List<Tutorial> tutorials = tutorialService.selectAllTutorial();
		int lastId = 0, nextId = 0;
		for (int i = 0; i < tutorials.size(); i++) {
			if (tutorials.get(i).getId() == id) {
				lastId = i == 0 ? 0 : tutorials.get(i-1).getId();
				nextId = i == tutorials.size() - 1 ? 0 : tutorials.get(i+1).getId();
			}
		}
		TutorialViewModel TVM = new TutorialViewModel();
		TVM.setTutorial(tutorial);
		TVM.setTutorials(tutorials);
		TVM.setSize(tutorials.size());
		TVM.setLastId(lastId);
		TVM.setNextId(nextId);
		req.setAttribute("tutNum", id.toString());
		return View("/tutorial/main", model, TVM);
	}
	
	/*======== 删 ========*/
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		tutorialService.deleteByPrimaryKey(id);
		return RedirectTo("/tutorial");
	}
	
	/*======== 改 ========*/
	@GetMapping("/update/{id}")
	public String update(Model model, @PathVariable("id") Integer id) throws CustomException {
		Tutorial tutorial = tutorialService.findByPrimaryKey(id);
		return View("/tutorial/update", model, tutorial);
	}
	
	@PostMapping("/update/{id}")
	public String modify(Model model, @PathVariable("id") Integer id, @Validated Tutorial tutorial, BindingResult bindingResult) throws CustomException {
		tutorialService.updateByPrimaryKey(tutorial);
		return RedirectTo("/tutorial/"+id);
	}
	
	/*======== 增  ========*/
	@GetMapping("/create")
	public String create() {
		return View("/tutorial/create");
	}
	
	@PostMapping("/create")
	public String createTutorial(Model model, @Valid Tutorial tutorial, BindingResult bindingResult) throws CustomException {
		int id=tutorialService.insert(tutorial);
		return RedirectTo("/tutorial/"+id);
	}
	
}