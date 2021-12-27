package p2021_12_27;

import java.util.Scanner;

public class DoWhile03 {

	public static void main(String[] args) {
		// 
		
		System.out.println("메시지를 입력하세요");
		System.out.println("프로그램을 종료하려면 q를 입력하세요");

		Scanner sc=new Scanner(System.in);
		String input;
		
		do {
			System.out.print(">");
			input=sc.nextLine();
			System.out.println("입력문자:"+input);
		}while (!input.equals("q")); //input이 string값을 메소드로 받은 변수이므로 string의 값을 괄호()와 비교하는 것이 .equals임
											// !는 not -> 즉 input에 받은 값이 q와 같지 않으면 조건이 true가 된다.
		
		System.out.println("종료");
		sc.close(); //스캐너 끔
		
		
		
	}

}
