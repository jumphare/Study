package p2021_12_27;

public class For02 {

	public static void main(String[] args) {
		// 1~10까지 합 구하는 프로그램
		
		int sum=0; //main메소드 안에서 정의되는변수=지역변수(local variable)
		for(int i=1;i<=10;i++) { //for문 안에서 정의한 i-> for문 안에서만 사용 가능
			sum+=i; //연산을 해야 할 땐 sum에 초기값을 반드시 설정해야함
			System.out.println("1부터"+i+"까지 합 sum= "+sum);
		}
		
		System.out.println(sum); 

	}

}
