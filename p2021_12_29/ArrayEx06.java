package p2021_12_29;

public class ArrayEx06 {

	public static void main(String[] args) {
		// 교재 154 예제
		
		int[] scores; //heap 메모리에 새로운 공간이 생성되지 않아 주소값을 가지지 않은 상태, 이것만 가지고는 에러가 날 것
		scores=new int[] {83,90,87}; //배열 크기와 값을 지정 -> 공간 생성됨 -> scores에 주소값이 할당됨!
		int sum1=0;
		
		for(int i=0; i<scores.length;i++) {
			sum1+=scores[i];
		}
		
		System.out.println("총합: "+sum1);
		
		int sum2=add(scores); //add메소드를 호출 -> add의 리턴값이 들어가게 됨
		System.out.println("총합: "+sum2);

	}

	public static int add(int[] scores) {
		//괄호 안에 기본자료형이 아니라 배열이 와있으므로 값이 아니라 배열의 '주소'를 전달하는것 -call by reference
		//많은 값을 하나하나 전달하는건 비효율적이기 때문에! 주소로 heap메모리 값을 호출하는 방식을 사용
		int sum=0;
		for(int i=0; i<scores.length;i++) {
			sum+=scores[i];
		}
		return sum; //값이 위의 sum2로 들어가게됨
	}
	
}
