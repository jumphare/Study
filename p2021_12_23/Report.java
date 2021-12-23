package p2021_12_23;

import java.util.Scanner;

public class Report {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.print("3개의 정수를 입력 하세요?");
		int n1, n2, n3, max, min;

		Scanner sc = new Scanner(System.in);
		n1 = sc.nextInt(); // n1=20;
		n2 = sc.nextInt(); // n2=10;
		n3 = sc.nextInt();

		// 최대값
		max = (n1 > n2) ? n1 : n2; //max에 n1과 n2 중 큰 값을 대입함
		max = (max > n3) ? max : n3;		 // 기존 max값과 n3 중 큰 값을 max에 다시 대입함
		//굳이 다른 변수 입력할 필요 없이 max 변수에 그때그때 큰 값을 넣어가며 최종적으로 가장 큰 값이 들어가도록 하는 방식이 좀더 효율적
		
		
//		max = (n1>n2 && n1>n3) ? n1 : (n2>n3) ? n2: n3;
		//첫번째 조건에서 n1이 제일 클 경우 n1값이 max로 들어감
		//단, n1이 제일 크지 않은 경우 얜 max가 될 수 없고 남은 n2와 n3을 비교해 둘중 큰 값이 max가 되는 것
		
		// 최소값		
		min = (n1 < n2) ? n1 : n2;
		min = (min < n3) ? min : n3;		
//		min = (n1<n2 && n1<n3) ? n1 : (n2<n3) ? n2: n3;
		
		System.out.println("max=" + max);
		System.out.println("min=" + min);		
		
	}

}
