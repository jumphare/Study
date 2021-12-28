package p2021_12_28;

public class ArrayEx05 {

	public static void main(String[] args) {
		// 확장(향상된) for문
		//형식 : for(변수 : 순차적인 자료구조(ex. 배열, 컬렉션))
		
		int[] score= {95,71,84,93,87};
		int sum1=0, sum2=0;
		
		//기본 for문 이용
		for(int i=0; i<score.length;i++)
			sum1+=score[i];
		
		//확장 for문 이용
		for(int i : score)
			sum2+=i;
		
		System.out.println(sum1+"\t"+sum2);
		
		

	}
	

}
