package mvc2.board.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc2.board.command.Command;
import mvc2.board.command.CommandDelete;
import mvc2.board.command.CommandException;
import mvc2.board.command.CommandList;
import mvc2.board.command.CommandNull;
import mvc2.board.command.CommandView;
import mvc2.board.command.CommandWrite;

/**
 * Servlet implementation class BoardControl
 */
public class BoardControl extends HttpServlet{
	
	private HashMap commandMap;
	private String jspDir = "/04_mvc_board_class/";
	private String  error = "error.jsp";
	
	public BoardControl() { // 생성자 함수
		super();
		initCommand();
	}
	
	private void initCommand() {
		commandMap = new HashMap();
		
		// 메인화면
		commandMap.put("main-page", new CommandNull("BoardMainMvc.jsp"));
		// 목록보기
		commandMap.put("list-page", new CommandList("BoardListMvc.jsp"));
		// 게시판 보기
		commandMap.put("view-page", new CommandView("BoardViewMvc.jsp"));
		// 입력
		commandMap.put("input-page", new CommandWrite("BoardSaveMvc.jsp"));
		// 입력 form
		commandMap.put("input-form", new CommandNull("BoardInputFormMvc.jsp"));
		// 삭제 form
		commandMap.put("delete-form", new CommandNull("BoardDeleteFormMvc.jsp"));
		// 삭제
		commandMap.put("delete-page", new CommandDelete("BoardDeleteMvc.jsp"));
	}
	
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	
	
	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		String nextPage = "";
		String cmdKey = request.getParameter("cmd");
		if(cmdKey==null) {
			cmdKey = "main-page";
		}
		
		Command cmd = null;
		
		try {
		if(commandMap.containsKey(cmdKey)) {
			cmd = (Command)commandMap.get(cmdKey); //new CommandList("BoardList.jsp") 클래스 객체 생성
			// 생성한 Command****클래스가 상속받은 인터페이스를 구현하는 곳
		}else {
			throw new CommandException("지정할 명령어가 존재하지 않음");
		}
		nextPage = cmd.execute(request, response); // 구현한 인터페이스에서 execute()메서드 호출
		} catch (CommandException e) {
			request.setAttribute("javax.servlet.jsp.jspException", e );
			nextPage = error;
			System.out.println("오류 : " + e.getMessage() );
			e.printStackTrace();
		}
		
		RequestDispatcher reqDp = getServletContext().getRequestDispatcher(jspDir + nextPage);
		reqDp.forward( request, response );
		
	}	
}
