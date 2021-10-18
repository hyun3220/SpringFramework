package yuhan.mvc.board.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import yuhan.mvc.board.dao.BoardDao;

public class BoardDeleteService implements IBoardService {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String b_no = request.getParameter("b_no");
		
		BoardDao dao = new BoardDao();
		dao.delete(b_no);
	}

}
