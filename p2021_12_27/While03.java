package p2021_12_27;

import java.util.Scanner;

public class While03 {

	public static void main(String[] args) {
		// 키보드로 입력받은 값의 구구단을 while문으로 출력
		
		System.out.println("숫자를 입력");
		Scanner sc=new Scanner(System.in);
		
		int num=sc.nextInt();
		int i=1;
		
		while(i<=9) { //총 9까지 곱해야 하니까
			System.out.println(num+"*"+i+"="+(num*i));
			i++; //마지막에 증감식 필수. 단 sop 아래 가장 마지막에 추가함
		}
		

	}

}
