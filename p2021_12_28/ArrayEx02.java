package p2021_12_28;

public class ArrayEx02 {

	public static void main(String[] args) {
		// 교재 152~3 예제
		
		int[] score= {83,90,87};
		System.out.println("Score[0]= "+score[0]);
		System.out.println("Score[1]= "+score[1]);
		System.out.println("Score[2]= "+score[2]);

		int sum=0;
		for(int i=0;i<score.length;i++)
			sum+=score[i];
		
		double avg= sum/3.0; //자동형변환 int형이 double형으로~ 소수점 살리려면 집어넣는 값 자체를 실수로 넣어야함
		System.out.println(avg);
		//숫자 총 16개가 나오는데 셋째자리에서 반올림-> 둘쨰자리까지 출력되게 하려면
		System.out.printf("%.2f",avg); //%.0f <- 숫자만큼만 출력되게 하는것 //f:실수 d:정수 s:문자
		

	}

}
