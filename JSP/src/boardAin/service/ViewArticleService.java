package boardAin.service;

import java.util.List;

import boardAin.model.BoardDao;
import boardAin.model.BoardException;
import boardAin.model.BoardRec;

public class ViewArticleService {
	private static ViewArticleService instance;
	public static ViewArticleService getInstance()  throws BoardException{
		if( instance == null )
		{
			instance = new ViewArticleService();
		}
		return instance;
	}
	
	public BoardRec getArticleById(String id) throws BoardException
	{
		int article_id = 0; // 혹시라도 id값이 안넘어오면 0 값으로 대체 왜냐면 null값 exception 방지
		if( id != null ) article_id = Integer.parseInt(id);
		BoardDao dao = BoardDao.getInstance();
		BoardRec rec = dao.selectById(article_id);		
		dao.increaseReadCount(article_id); // view화면 open시 마다 조회수 증가
		return rec;
	}
		
}

