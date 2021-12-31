package p2021_12_31;

// Math 클래스
// Math class = 정적 필드+정적 메소드

public class MathEx {

	public static void main(String[] args) {

//		Math m=new Math(); //생성자가 없어서(제공하지 않아서) 객체를 생성하는 방식은 사용할 수 없음
		
		//static이 붙어있는건! 위처럼 굳이 객체 생성하지 않고 바로 쓰면 됨
		
		System.out.println(Math.E);			//이런식으로 클래스.연산자 형태로 불러오면 끗!
		System.out.println(Math.PI);

		System.out.println(Math.random());	//0<=N<1.0 난수 발생
		System.out.println(Math.abs(-3));		//절대값
		
		System.out.println(Math.ceil(Math.PI)); //double형 Math.ceil()-> 소수점 첫째에서 올림 -> 3.14에서 올려서 실수형 4.0 출력
		System.out.println(Math.round(Math.PI)); //long형 Math.round() -> 첫째에서 반올림 -> 3.14에서 반올림 정수형 3 출력
		System.out.println(Math.floor(Math.PI));  //내려서 실수형 3.0 출력

		System.out.println(Math.max(5.4, 10)); // Math.max() -> 5.4, 10 중 큰 값을 실수형으로 출력
		System.out.println(Math.min(5, 10));		//Math.min() -> 5, 10 중 작은 값을 정수형으로 출력 // 넣는 숫자 따라 출력 형식 다름
		
		System.out.println(Math.pow(2, 3));	//Math,pow(a,b) ->a^b 를 실수형으로 출력 // 2^3=8.0 
		System.out.println(Math.sqrt(9));		//Math.sqrt() -> 3^2=9이므로 9의 제곱근=3
		
		
	}//

}//
