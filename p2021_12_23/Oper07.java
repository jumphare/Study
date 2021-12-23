package p2021_12_23;

import java.util.Scanner;

public class Oper07 {

	public static void main(String[] args) {

		 //논리연산자 : ||(OR) &&(AND) !(NOT)
		
		//다섯 과목 점수를 키보드로 입력받아 합불 여부를 판별
		//과목 당 과락 40점, 평균 60점 이상 합격
		
		int n1,n2,n3,n4,n5,total;
		double avg;
		
		System.out.println("점수 다섯 개를 입력하세요");
		Scanner sc=new Scanner(System.in);
		n1=sc.nextInt();
		n2=sc.nextInt();
		n3=sc.nextInt();
		n4=sc.nextInt();
		n5=sc.nextInt();

		total=n1+n2+n3+n4+n5;
		avg=total/5.0;  //자동 형변환-정수형이 실수형으로.
		//이때 연산 결과가 int형으로 나와 double형 변수에 들어감-> 소수점이 .0으로 떨어짐 -> 데이터 손실
		//방법 두 가지 1. total을 (double)total로 강제형변환시킴 2. 나누는 값을 5.0 double형으로 나눔 -> 소수점까지 계산돼 avg에 대입
		
		System.out.println("평균: "+avg);
		
		if(n1>=40&&n2>=40&&n3>=40&&n4>=40&&n5>=40&&avg>=60) { //합격 기준: 모든 과목 40점 이상& 평균 60점 이상
			System.out.println("합격");
		} else {
			System.out.println("불합격");
		}
		
		

	}//main

}//class
