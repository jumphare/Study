package p2021_12_30;

import java.util.Scanner;

public class Repo_211230 {

	public static void main(String[] args) {
		// 구구단 연산결과를 2차원 배열에 저장하고 그 결과를 이용해 구구단을 출력
		
		//배열 선언
		int[][] num= new int [8][9];
		
		//구구단 값 대입
		for(int i=0; i<num.length;i++) { //2~9단
			for(int j=0; j<9;j++) //1~9까지 곱하기
				num[i][j]=(i+2)*(j+1);
		}
		
		System.out.println("1~9의 수 중 하나를 입력하세요 (1: 구구단 전체 2~9: 해당 단 출력)");
		Scanner sc= new Scanner(System.in);
		int dan=sc.nextInt();
		if(dan==1) {//1 입력 시 구구단 전체 출력
			
			for(int i=2; i<=9; i++)	//단 제목
				System.out.print("["+i+"단]\t\t");
			System.out.println();
			
			for(int j=0; j<9;j++) { //구구단 전체
				for(int i=0; i<num.length;i++) {
					System.out.print((i+2)+"*"+(j+1)+"= "+num[i][j]+"\t");
				}
				System.out.println();
			}
		}else	{// 2~9 입력 시 그 단만 출력
			System.out.println("["+dan+"단]");
			for(int j=0;j<9;j++) {
				System.out.println(dan+"*"+(j+1)+"= "+num[dan-2][j]);
			}
		}
		

	}//

}//
