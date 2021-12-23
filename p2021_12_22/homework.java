package p2021_12_22;

import java.util.Scanner;

public class homework {

	public static void main(String[] args) {
		
		System.out.println("정수 세 개를 입력하세요");
		
		Scanner sc= new Scanner(System.in);
		
		int n1=sc.nextInt(), n2=sc.nextInt(), n3=sc.nextInt();
		/* 두줄
		//최대값
		int middle=(n1>n2)?n1:n2;
		int max=(n3>middle)?n3:middle;
		System.out.println("max:"+max);
		//최소값
		middle=(n1>n2)?n2:n1;
		int min=(n3>middle)?middle:n3;
		System.out.println("min:"+min);
		*/
		 // middle이라는 변수를 굳이 선언할 것 없이 그때그때 더 큰 값을 max값에 대입하는 형태로 최대값 추출 가능!
		
		//한줄
		int max=(n1>n2)?((n1>n3)?n1:n3):((n2>n3))?n2:n3; // 참, 거짓 값 부분에 각각 n3를 비교하게 만드는건 비효율적임
		int min=(n1<n2)?((n1<n3)?n1:n3):((n2<n3))?n2:n3; // 첫 번째 조건에 && 연산자를 이용해 후보 하나를 빼버리는게 나음 (report 참고)
		
		System.out.println("max:"+max);
		System.out.println("min:"+min);
		
		

	} //main

}//class
