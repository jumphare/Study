package p2021_12_28;

public class MethodEx01 {
	//메소드: 1. 여러가지 코드를 모아놓은 것 2.코드를 재활용하기 위해 사용
	
	//사용자 정의 메소드 : 사용자가 직접 호출해야 한다 // 자바의 경우(객체지향) 메소드 위치가 main 아래에 있어도 괜찮음 (C, python은 안됨)
	static void check() {
		//public: 접근제어자, 현재 시점에서는 넣어도 안 넣어도(default) 괜찮음
		//static: 정적메소드-같은 클래스 내 호출시 클래스명 생략 가능
		//void 또는 자료형이 와야 하는데, void인 경우 return 생략 가능, 자료형 넣은 경우 반드시 같은 자료형 값을 return시켜줘야 함
		System.out.println("호출 성공");
	}
	
	//값 전달에 의한 메소드 호출(Call by Value) 
	//중요!
	static void check(int a) {	//int a: 매개변수(parameter)
		System.out.println("전달된 값: "+a);
	}
	static void check(int a, double d) {
		double result=a+d;
		System.out.println("전달된 값의 합: "+result);
	}
	static void check(char c) {
		System.out.println("전달된 값: "+c);
	}
	static void check(boolean b) {
		System.out.println("전달된 값: "+b);
	}
	
	//주소값 전달에 의한 메소드 호출 (Call by reference)
	//클래스, 배열 등 자료형 말고 주소 호출해야 하는 변수가 들어간 경우
	//중요!
	static void check(String s) { //String: 자료형이 아니라 클래스->클래스는 값이 아니라 주소를 호출해야 함! (String은 둘다 되지만 예외적)
		System.out.println("전달된 값: "+s);
	}
	
	static int check01() { 
		// void인 경우 return 생략 가능하지만 자료형 넣은 경우 반드시 같은 자료형 값을 return시켜줘야 함!
		return 50; // void가 아니기 때문에 반드시 int형 값을 리턴해야 함
		//rerturn: 메소드를 호출한 곳에 값을 돌려주는 역할, 메소드의 가장 마지막에 들어가야 함
	}
	static double check02(int a, double d) {
		double result=a+d;
		return result; //double형으로 리턴해야 함!
	}
	
	//main 메소드는 JVM에 의해 자동으로 호출되어 실행된다
	public static void main(String[] args) {
		check(); //메소드 호출, 같은 클래스 내에 있어 클래스명 생략 가능 (MethodEx01.check();로 호출하는게 기본)
		//main 아닌 메소드는 따로 사용자가 main 내부에 호출시켜줘야 JVM이 인식할 수 있음 - JVM은 기본적으로 main만 호출하기 때문
		
		check(30); //매개변수 a에 30을 전달해주고 위의 메소드가 한 번 호출되고 나면 메모리에서 사라짐 (일회용)
		check(10,10.5);
		check('A');
		check(true);
		check("자바"); //String 클래스만! 값으로 호출할 수 있음
		check(new String("자바")); //일반적인 클래스는 new 연산자를 통해 s에 "자바"가 저장된 String 객체의 주소값을 호출함
		//같은 check 메소드여도 괄호 안 자료형이 다르다면 각자 다른 메소드임. 호출 시 주의!
		
		check01(); //값을 받긴 했는데 출력 코드가 없어서 출력 못 함
		//return받은 값을 출력하는 방법 1
		int result=check01();
		System.out.println("리턴값1: "+result);
		//출력 방법2
		System.out.println("리턴값2: "+check01());
		
		double result2=check02(50,3.14);
		System.out.println("리턴값3: "+result2);
		System.out.println("리턴값4: "+check02(50,3.14));

	}//m

}//c
