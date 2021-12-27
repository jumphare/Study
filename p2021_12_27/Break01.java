package p2021_12_27;

public class Break01 {

	public static void main(String[] args) {
		// break: 루프를 빠져나오게 만듦
		
		for(int i=1;;i++)  {//조건 표시 않을 시 무한출력... (;;) 이런 형태 
			System.out.println(i+"무한 출력");
			
			if(i==100)
				break; //i=100이 되면 루프 끝 -> 100무한출력 에서 끝!
		}

	}

}
