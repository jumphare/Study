package p2021_12_27;

public class While02 {

	public static void main(String[] args) {
		// while문을 이용해 1~100까지 홀수, 짝수합 구하기
		// while문 1개, if~else문으로 구하기
		
		
		int num=1;
		int odd=0, even=0;
		while(num<=100) { //100까지
			if(num%2==1) { //num이 홀수인 경우
				odd+=num;		// odd에 값을 더함
			} else {			//num이 짝수인 경우
				even+=num; // even에 값을 더함
			}
			num++; //while문 내부에 증감식
		}
	
		System.out.println("odd="+odd+"\t\teven="+even); //while 루프 끝나면 값 출력
		
		
		
		
	}

}
