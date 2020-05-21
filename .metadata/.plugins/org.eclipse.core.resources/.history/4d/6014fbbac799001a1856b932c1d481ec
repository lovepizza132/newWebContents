package mvc2.board.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board2.service.ViewArticleService;
import mvc2.board.model.BoardDao;
import mvc2.board.model.BoardException;
import mvc2.board.model.BoardRec;

public class CommandView implements Command{
	private String next;
	
	public CommandView(String next) {
		this.next = next;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		String aid = request.getParameter("aid");
		try {
			BoardRec rec = ViewArticleService.getInstance().getArticleById(aid); // 아이디와 같은 vo를 끌어옴
			request.setAttribute("param", rec ); // 속성에 저장
		} catch (BoardException e) {
			e.printStackTrace();
		}
		
		return next;
	}

}
