

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; //시리얼 번호 지워도 상관 없음
       
    public HelloServlet() {
        super(); //부모의 생성자 함수를 부른다아아
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사용자가 서버로 보내는 것을 request
		//서버가 사용자에게 보내는 것을 response
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter(); // 문자형으로 출력하는 스트림을 얻어옴
		
		out.write("<html><body>");
		out.write("<h2>나의 첫 웹서버</h2>");		
		out.write("</body></html>");
		out.close();
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
