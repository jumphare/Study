package p2021_12_23;

import java.util.Scanner;

public class Homework {

	public static void main(String[] args) {

		//키보드를 이용해 입력한 정수의 팩토리얼을 구하는 프로그램
		
		System.out.println("정수 입력");
		
		Scanner sc=new Scanner (System.in);
		
		int result=1;
		
		for(int num=sc.nextInt(); num>0; num--) {
			result*=num;					// result에 num이 0이 되기 전까지 하나씩 감소하며 계속 더하다 num=0이 되면 계산 끝
		}
		System.out.println("팩토리얼 값: "+result); //끝난 값 출력

	}

}
