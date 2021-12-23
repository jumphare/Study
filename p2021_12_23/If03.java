package p2021_12_23;

import java.util.Scanner;

public class If03 {

	public static void main(String[] args) {
		
		
		//조건문 if -3
		//키보드로 정수 2개를 입력받아 큰값과 작은값을 나눠 출력
		
		System.out.println("정수 두 개를 입력하세요");
		
		Scanner sc=new Scanner(System.in);
		
		int n1=sc.nextInt(), n2=sc.nextInt();
		int max,min;
		
		if(n1>n2) {
			max=n1;
			min=n2;
		} else {
			max=n2;
			min=n1;
		}

		
		System.out.println("max:"+max+"\tmin:"+min);

		
		

	} //m

}//c
