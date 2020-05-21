package guest.service;

import guest.model.Message;
import guest.model.MessageDao;
import guest.model.MessageException;

public class WriteMessageService {

	private static WriteMessageService instance;
	
	//싱글톤:메모리에 단 1개를 올리기 위해
	public static WriteMessageService getInstance() throws MessageException
	{
		if( instance == null )
		{
			instance = new WriteMessageService();
		}
		return instance;
	}
	
	private WriteMessageService()
	{
		
	}
	
	public void write( Message rec ) throws MessageException
	{
		MessageDao mDao = MessageDao.getInstance();
		mDao.insert(rec);
	
	}
}
