package p2021_12_27;

public class For03 {

	public static void main(String[] args) {
		// 1~100 홀수합, 짝수합
		
		int result1=0;
		int result2=0;

		/*첫번째 방법
		for(int i=1;i<=100;i++) {
			if(i%2==1) //if문으로 홀수인 것만  골라냄
			result1+=i;
		}
		System.out.println(result1);

		for(int j=1;j<=100;j++) {
			if(j%2==0) //짝수인 것만 골라냄
			result2+=j;
		}
		System.out.println(result2);
		*/
		
		/*두번째 방법*/
		for(int i=1;i<=100;i+=2) //1부터 2씩 증가- 홀수 합
			result1+=i;
				System.out.println(result1);
				
		for(int i=0;i<=100;i+=2) //0부터 2씩 증가- 짝수 합
			result2+=i;
				System.out.println(result2);
				
		


	}

}
