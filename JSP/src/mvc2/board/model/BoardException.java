package mvc2.board.model;

public class BoardException extends Exception
{
  public BoardException(){
  		super();
  	}
  	
  public BoardException(String error){
  		super( error );
  	}
 		
}