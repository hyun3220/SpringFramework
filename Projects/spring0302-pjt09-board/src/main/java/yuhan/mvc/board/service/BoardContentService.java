package yuhan.mvc.board.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import yuhan.mvc.board.dao.BoardDao;
import yuhan.mvc.board.dto.BoardDto;

public class BoardContentService implements IBoardService{

	@Override
	public void execute(Model model) {
		Map<String, Object>map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String b_no = request.getParameter("b_no");
		
		BoardDao dao = new BoardDao();	// DAO 호출, 데이터 처리
		BoardDto dto = dao.contentView(b_no);	// DAO에서 처리한 데이터를 객체화 시킨다.
		
		model.addAttribute("content_view", dto);
		
	}

}
