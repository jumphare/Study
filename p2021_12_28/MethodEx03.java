package p2021_12_28;

import java.util.Scanner;

public class MethodEx03 {
	
	//키보드로 입력한 두 개의 정수 중 최대값과 최소값을 구하는 프로그램
	//단, 메소드를 이용해 작성
	
	//최대값
	static int max(int a, int b) { //static 정적 메소드: 공유를 목적으로 누구나 쉽게 호출할 수 있도록 하는 메소드
		if(a>b) 
			return a;
		else
			return b;
	}
	//최소값
	static int min(int a, int b) {
		if(a<b)
			return a;
		else
			return b;
	}	

	public static void main(String[] args) {

		System.out.print("두 수를 입력하세요: ");
		
		Scanner sc=new Scanner(System.in);
		
		int a=sc.nextInt();
		int b=sc.nextInt();
		
		int max= max(a,b); //같은 클래스 정적 메소드는 클래스명 생략 가능 MethodEx03.max(a,b);에서 클래스부분 안 써도 된다는 뜻
		int min= min(a,b); // 물론 클래스 써버릇하는게 좋긴 할것임 나중에는 꼭 써야만 하는 상황이 많이 오니까
		
		System.out.println("max= "+max+"\tmin= "+min);
		
		
	}

}
