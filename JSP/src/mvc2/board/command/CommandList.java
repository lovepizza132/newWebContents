package mvc2.board.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board2.service.ListArticleService;
import mvc2.board.model.BoardDao;
import mvc2.board.model.BoardException;
import mvc2.board.model.BoardRec;

public class CommandList implements Command{

	private String next;
	
	public CommandList(String next) {
		this.next = next;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		try {
			String pNum = request.getParameter("page");
			List<BoardRec> mList = ListArticleService.getInstance().getArticleList(pNum);
			int pageTotalCount = ListArticleService.getInstance().getPageTotalCount();
			request.setAttribute("param", mList ); // 속성에 저장
			request.setAttribute("page", pageTotalCount ); // 속성에 저장
			
		} catch (BoardException e) {
			e.printStackTrace();
		}
		
		return next;
	}

}