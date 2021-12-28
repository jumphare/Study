package p2021_12_28;

import java.util.Scanner;

public class ArrayEx03 {

	public static void main(String[] args) {
		// 키보드로 배열에 정수를 입력받아 총점과 평균을 구한다
		
		System.out.println("점수 다섯 개 입력");
		int[] score=new int[5];
		Scanner sc=new Scanner(System.in);
		int sum=0;
		
		for(int i=0; i<score.length;i++) {
			score[i]=sc.nextInt();
			sum+=score[i];
		}
		
		double avg= sum/5.0;
		
		System.out.println("총점: "+sum);
		System.out.printf("평균: %.2f",avg); //%.0f <- 숫자만큼만 출력되게 하는것 //f:실수 d:정수 s:문자
		System.out.println();

	}

}
