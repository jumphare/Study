package p2021_12_27;

public class For04 {

	public static void main(String[] args) {
		
		//for문 1개+ if~else문으로 홀수합, 짝수합 한번에 구하기
		
		int odd=0, even=0;
		
		for(int i=1;i<=100;i++) {
			if(i%2==1) {//if문으로 홀수인 것만  골라냄
			odd+=i;
			} else { //홀수 아니면 짝수값이고 걔네만 골라서 더하기
				even+=i;
			}
		}
		System.out.println(odd);
		System.out.println(even
				);
		
		

	}

}
