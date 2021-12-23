package p2021_12_23;

import java.util.Scanner;

public class If05 {

	public static void main(String[] args) {
		
		//조건문 if -5
		//키보드로 입력한 점수가 어느 학점에 해당되는지 판별
		//~90:A		~80 B		~70 C		~60 D		이하 F
		
		System.out.println("점수 입력");
		
		Scanner sc=new Scanner(System.in);
		
		int n=sc.nextInt();
		char a;
		
		if(n>=90) {
			a='A';
		} else if(n>=80) {
			a='B';
		} else if(n>=70) {
			a='C';
		} else if(n>=60) {
			a='D';
		} else {
			a='F';
		}
		
		System.out.println(n+"점은 "+a+"입니다");
		
		
		
		
		
		
		
		

	} //m

}//c
