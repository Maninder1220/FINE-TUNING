// Scanner Class


import java.util.Scanner;
import java.util.InputMismatchException;

class even_odd {

public static void main(String args[]){
System.out.println("Welcome to my App");


Scanner s = new Scanner(System.in);

try{
	System.out.println("Enter an Integer");
	int num = s.nextInt();
	String res = num % 2 == 0 ? "even" : "odd";
	System.out.println(res);
} catch(InputMismatchException e) {
	System.out.println("U Should Enter Integers Only");
	System.out.println(e);

}
System.out.println("Thank You for Using Our App");
}


}