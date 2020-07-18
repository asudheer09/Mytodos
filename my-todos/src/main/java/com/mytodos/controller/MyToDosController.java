package com.mytodos.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mytodos.model.MyToDos;
import com.mytodos.service.MyToDosService;

@Controller
@RequestMapping("Mytodos")
public class MyToDosController {

	@Autowired
	private MyToDosService service;

	@RequestMapping("welcome")
	public String welcome() {
		return "welcome";
	}

	@RequestMapping("mytodos")
	public ModelAndView mytodos() {
		ModelAndView mv = new ModelAndView("mytodos", "mytodos", new MyToDos());
		return mv;
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String addMytodos(@ModelAttribute("mytodos") MyToDos todos) {
		Random objGenerator = new Random();
		Long n = objGenerator.nextLong();
		todos.setId(n);
		service.createMyToDos(todos);
		return "redirect:/Mytodos/allTodos";
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String editMytodos(@ModelAttribute("mytodos") MyToDos todos) {
		service.editMyToDos(todos);
		return "redirect:/Mytodos/allTodos";
	}

	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String searchMytodos(@RequestParam("id") String id, ModelMap map) {
		Long id1 = Long.parseLong(id);
		MyToDos todo = service.findMyToDos(id1);
		List<MyToDos> todos = new ArrayList<>();
		todos.add(todo);
		map.addAttribute("todos", todos);
		return "allTodos";
	}

	@RequestMapping("allTodos")
	public String allTodos(ModelMap map) {
		List<MyToDos> todos = service.findAll();
		map.addAttribute("todos", todos);
		return "allTodos";
	}

	@RequestMapping("deleteTodos/{id}")
	public String deleteTodos(@PathVariable Long id) {
		service.deleteMyToDos(id);
		return "redirect:/Mytodos/allTodos";
	}

	@RequestMapping("editTodos/{id}")
	public ModelAndView editTodos(@PathVariable Long id) {
		MyToDos todos = service.findMyToDos(id);
		ModelAndView mv = new ModelAndView("editTodos", "mytodos", todos);
		return mv;
	}

	@ModelAttribute("statusList")
	public List<String> statusList() {
		List<String> statusList = new ArrayList<String>();
		statusList.add("Not selected");
		statusList.add("Todo");
		statusList.add("Inprogress");
		statusList.add("Done");
		return statusList;
	}

}
