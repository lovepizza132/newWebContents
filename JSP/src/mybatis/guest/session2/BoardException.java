package mybatis.guest.session2;

public class BoardException extends Exception
{
  public BoardException(){
  		super();
  	}
  	
  public BoardException(String error){
  		super( error );
  	}
 		
}