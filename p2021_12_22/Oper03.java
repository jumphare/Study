package p2021_12_22;

public class Oper03 {

	public static void main(String[] args) {

		//비교 연산자: >,<,>=,<=,==,!=
		//비교 연산 결과가 참이면 true, 거짓이면 false
		
		int num1=10, num2=10;
		
		boolean result1=(num1==num2); //t
		boolean result2=(num1!=num2); //f
		boolean result3=(num1>=num2); //t
		boolean result4=(num1<num2); //f
		boolean result5=(num1>5); //t
		boolean result6=(num1<10); //f
		System.out.println(result1+" "+result2+" "+result3+" "+result4+" "+result5+" "+result6);
		//이거 결과값을 배열로 만들면 for문으로 출력할 수 있으니까 좀더 쉽지 않을까...
		
		char c1='A', c2='B';
		boolean result10=(c1<c2); //A=65, B=66 아스키코드 십진값 기준으로 비교함
		System.out.println(result10); //t
		
		
		
		
	}//main

}//class
