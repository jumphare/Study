package p2021_12_27;

public class Break03 {

	public static void main(String[] args) {
		// break
		
		// Math.random(); //난수 발생 범위 0.0<=m<1.0
		
		int i=1;
		while(true) {
			int num=(int) (Math.random()*45)+1; // 난수 범위 1~45
			System.out.println(num);
			if(num==6) //랜덤으로 6 나올때까지 돌리고 6 나오면 끝
				break;	//만약 if 조건에 i를 넣으면 루프 6번 돌고 끝
			i++; 
		}
		System.out.println("루프횟수:"+i);

	}

}
