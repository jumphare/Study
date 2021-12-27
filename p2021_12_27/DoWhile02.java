package p2021_12_27;

public class DoWhile02 {

	public static void main(String[] args) {
		// do while문으로 1~100까지 홀수합 짝수합

		int i=1, odd=0, even=0;
		
		do {
			if(i%2==1) { //홀수일 때
				odd+=i;
			} else even+=i; //짝수일 때
			i++; // 반복문 괄호 아래 마지막에 꼭! 붙여줘야 함!!
		} while (i<=100);
		
		System.out.println("odd="+odd+"\t\teven="+even);

		
	}

}
