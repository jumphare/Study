package p2021_12_27;

public class Continue01 {

	public static void main(String[] args) {
		// continue문
		// 1. 다시 위의 반복문으로 돌아가라는 명령
		// 2. 즉 continue문이 실행되면 그 아래는 실행되지 않고 다시 반복문이 수행됨
		
		for(int i=1; i<=10; i++) {
			if(i==5)
				continue; //i=5일 경우 아래의 출력 없이 다시 위로 올라감 -> 즉 5만 출력 안 함!
			
			System.out.println(i);
		}
		

	}

}
