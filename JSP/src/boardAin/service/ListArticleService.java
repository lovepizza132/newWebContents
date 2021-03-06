package boardAin.service;

import java.util.List;

import boardAin.model.BoardDao;
import boardAin.model.BoardException;
import boardAin.model.BoardRec;

public class ListArticleService {
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 5;	// 한페이지당 레코드 수
	
	
	private static ListArticleService instance;
	public static ListArticleService getInstance()  throws BoardException{
		if( instance == null )
		{
			instance = new ListArticleService();
		}
		return instance;
	}
	
	public List <BoardRec> getArticleList(String pNum) throws BoardException
	{
		// 넘어오는 pNum이 null값이라 null값 exception이 발생할 것을 대비 
		int pageNum=1;
		if(pNum != null) pageNum = Integer.parseInt(pNum);
		/*
		 *	pageNum		firstRow	endRow
		 *		1			1			5
		 *		2			6			10
		 *		3			11			15
		 *
		 */
		int firstRow = (pageNum-1)*countPerPage+1;
		int endRow = pageNum*countPerPage;
		
		List <BoardRec> mList = BoardDao.getInstance().selectList(firstRow, endRow);			
		return mList;
	}
	
	public int getTotalCount() throws BoardException{
		BoardDao dao = BoardDao.getInstance();
		int totalRecCount = dao.getTotalCount();
		pageTotalCount = (int)Math.ceil((double)totalRecCount/countPerPage);
		return pageTotalCount;
	}
		
}
