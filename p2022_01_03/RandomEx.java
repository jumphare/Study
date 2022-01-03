package p2022_01_03;

import java.util.Random;

public class RandomEx {

	//난수 발생 방법 1 Math.random()
	//					 2 random 클래스
	public static void main(String[] args) {
		
		Random r=new Random();		//정수 형태의 난수를 발생
		int n1=r.nextInt(10);		//nextInt(int bound) ->  0~9까지 범위 (10미만)
		
		int n2=r.nextInt(45)+1;		//1~45 범위
		System.out.println(n1+"\t"+n2);
		
		for(int i=0; i<6;i++) {
			int n3=r.nextInt(45)+1;
			System.out.print(n3+" ");
		}

	}

}
