package p2022_01_05;

public class WrapperEx {

	public static void main(String[] args) {
		// Wrapper 클래스 - Integer (90%이상 얘만 씀)
		
		System.out.println("max= "+Integer.MAX_VALUE);
		System.out.println("min= "+Integer.MIN_VALUE);
		
		// Integer 클래스는 기본생성자가 존재하지 않으므로 무조건 매개변수를 하나 넣어줘야 함
		//Integer i=new Integer(); // 오류
		
		//String형을 int형으로 변환    "20" -> 20
		int n=Integer.parseInt("20"); //문자 20을 변환
		System.out.println(n+10);	//연산 가능!
		
		System.out.println(Integer.toBinaryString(10)); 		//10진수->2진수
		System.out.println(Integer.toOctalString(10));		//10진수->8진수
		System.out.println(Integer.toHexString(15));		//10진수->16진수
		

	}

}
