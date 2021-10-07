package yuhan.mvc.board.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import yuhan.mvc.board.dao.BoardDao;

public class BoardWriteService implements IBoardService {

	@Override
	public void execute(Model model) {
		
		Map<String, Object>map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String b_name = request.getParameter("b_name");
		String b_subject = request.getParameter("b_subject");
		String b_content = request.getParameter("b_content");
		
		BoardDao dao = new BoardDao();
		dao.write(b_name, b_subject, b_content);
	}

}
