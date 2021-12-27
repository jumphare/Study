package p2021_12_27;

import java.util.Scanner;

public class For05 {

	public static void main(String[] args) {
		//키보드로 입력한 값의 구구단을 출력
		
		
		System.out.println("숫자를 입력하세요");
		
		Scanner sc=new Scanner(System.in);
		int num=sc.nextInt();
		int result;
		
		for(int i=1;i<=9;i++) {
			result=i*num;
			System.out.println(num+"*"+i+"="+result);
		}

	}

}
