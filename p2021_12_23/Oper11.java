package p2021_12_23;

public class Oper11 {

	public static void main(String[] args) {

		//증감연산자 
		int a=10, b=10; //초기값
		
		System.out.println("a="+a++); //a를 후행처리해라 -> a값 출력시킨 뒤 +1해라 -> 출력은 10이 되고, 이후 a는 11이 됨
		System.out.println("a="+a); //위에서 출력 후 +1 되었으므로 현재 a값은 11이 출력됨
		
		System.out.println("b="+(++b)); //b를 선행처리해라 -> b를 먼저 +1한 뒤 출력
		System.out.println("b="+b); //b를 선행처리해라 -> 현재값 또한 11
		
		
		
		

	} //m

}//c
