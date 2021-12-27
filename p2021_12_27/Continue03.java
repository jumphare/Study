package p2021_12_27;

public class Continue03 {

	public static void main(String[] args) {
		// continue문으로 1~100 중 5의 배수만 출력
		
		for(int i=1;i<=100;i++) {
			if(i%5!=0) // 5로 나눈 나머지가 0이 아닌 것-> 5의 배수가 아닌 것 
				continue;
			System.out.print(i+" ");
		}
		System.out.println();
		
	}

}
