package p2021_12_29;

public class ArrayEx07 {

	//절대값 구해주는 메소드 (|a|)
	static int abs(int data) {
		if(data<0)
			data=-data;
		return data; //int형으로 메소드를 선언했으므로 반드시 리턴값 필요. void인 경우는 생략 가능
	}
	
	public static void main(String[] args) {
		
		args[0]="-10";
		System.out.println("args[0]: "+args[0]);
		
		int num= Integer.parseInt(args[0]); //문자형 string 배열 속 값 "-10"을 Int형 값 -10으로 변환 (자료형변환)
		System.out.println("절대값: "+abs(num)); //abs() 메소드 호출, 자료형이므로 call by value임
		

	}

}
