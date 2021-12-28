package p2021_12_28;

import java.util.Scanner;

public class Repo_211228 {

	public static void main(String[] args) {
		// 키보드로 정수 5개 입력받은 후 int형 배열에 저장
		// 배열에 저장된 값에서 최대, 최소값을 구하는 프로그램
		//for문 두 번
		
		System.out.println("수를 다섯 개 입력하세요");
		
		Scanner sc=new Scanner(System.in);
		
		int[] data= new int[5];
		
		for(int i=0; i<data.length;i++)
			data[i]=sc.nextInt();
		
		int max=data[0],min=data[0];
		
		for(int i=0; i<data.length;i++) {
			if(data[i]>max) max=data[i];
			if(data[i]<min)	min=data[i];
		}
		
		System.out.println("max= "+max+"\tmin= "+min);

	}

}
