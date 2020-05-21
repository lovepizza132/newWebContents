package mvc2.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board2.service.DeleteArticleService;
import mvc2.board.model.BoardDao;
import mvc2.board.model.BoardException;

public class CommandDelete implements Command {
	private String next;

	public CommandDelete( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request, HttpServletResponse response  ) throws CommandException {

		try{
				
			String articleId = request.getParameter("articleId");
			String password = request.getParameter("password");
			
			int resultCnt = DeleteArticleService.getInstance().delete(articleId, password);
			request.setAttribute("result", resultCnt);
		}catch( BoardException ex ){
			throw new CommandException("CommandDelete.java < 삭제시 > " + ex.toString() ); 
		}
		
		return next;			
	}

}
