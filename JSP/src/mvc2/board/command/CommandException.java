package mvc2.board.command;

public class CommandException extends Exception{
	  public CommandException(){
	  		super();
	  	}
	  	
	  public CommandException(String error){
	  		super( error );
	  	}

}
