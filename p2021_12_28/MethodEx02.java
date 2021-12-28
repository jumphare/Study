package p2021_12_28;

import java.util.Scanner;

public class MethodEx02 {

	//1~n까지 합을 구하는 메소드
	static void sum(int n) {
		int s=0; //메소드 sum의 지역변수-> 초기값 지정
		for(int i=1;i<=n;i++) {
			s+=i;
		}
		System.out.println("1~"+n+"= "+s);
	}
	
	
	public static void main(String[] args) {
		
		System.out.print("수를 입력하세요: ");
		Scanner sc=new Scanner(System.in);
		int n=sc.nextInt();
		
		//Call by Value (자료형의 값을 올려줘야 하니까)
		sum(n); //입력받은 값을 sum의 int n에 올려주고 계산 후 출력되도록 함
		sum(5);
		sum(50);
		//메소드 하나를 여러 번 재사용 가능, 효율적
	}

}
