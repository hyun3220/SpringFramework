package yuhan.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import yuhan.mvc.board.service.BoardListService;
import yuhan.mvc.board.service.BoardWriteService;
import yuhan.mvc.board.service.IBoardService;

@Controller
public class BoardController {
	
	IBoardService service;
	
	@RequestMapping("/list")
	public String list(Model model) {
		
		service = new BoardListService();
		service.execute(model);
		
		return "list";
	}
	
	@RequestMapping("/write_view")
	public String write_view(HttpServletRequest request, Model model) {
		
		
		return "write_view";
	}
	

	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		service = new BoardWriteService();
		service.execute(model);
		
		return "redirect:list";
	}
}
