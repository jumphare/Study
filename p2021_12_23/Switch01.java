package p2021_12_23;

import java.util.Scanner;

public class Switch01 {

	public static void main(String[] args) {
		
		//조건문 Switch 
		//키보드로 입력한 점수가 어느 학점에 해당하는지

		System.out.println("점수 입력");

		Scanner sc=new Scanner(System.in);

		int s=sc.nextInt();

		
	     switch(s/10) { 								//점수대로 나누는 거니까 /10 하면 앞자리만 남아서 가능함
	     		case 10:									// !!100점인 경우 바로 아래로 내려서 9랑 같은 결과 나오게 하고 break로 연산 끝냄!!
	     		case 9: System.out.println("A");
	     	 			break;								//break 만나면 거기서 처리가 끝남 아래로 안내려가고
	     	 	case 8: System.out.println("B");
	     	 			break;
	     	 	case 7: System.out.println("C");
	     	 			break;
	     	 	case 6: System.out.println("D");
	     	 			break;
	     	 	default: System.out.println("F"); //default 뒤에는 break 안 씀 어차피 끝나니까......
	      }
		

		
		
	}//m

}//c
