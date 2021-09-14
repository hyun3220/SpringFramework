package yuhan.mvc.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	@RequestMapping("/list")
	public String list(Model model) {
		
		
		return "list";
	}
	
	@RequestMapping("write_view")
	public String write_view(HttpServletRequest request, Model model) {
		
		
		return "write_view";
	}
	
	@RequestMapping("content_view")
	public String content_view(HttpServletRequest request, Model model) {
		
		return "content_view";
	}
}
