package p2021_12_27;

public class Continue02 {

	public static void main(String[] args) {
		// continue문
		// continue문을 이용해 1~100 중 짝수만 출력하는 프로그램
		
		for(int i=1;i<=100;i++){
			if(i%2==1) //홀수인 경우 출력하지 않고 i++ 후 다시 반복문 돌리기
				continue;
			System.out.print(i+" ");
		}
		System.out.println();

	}

}
