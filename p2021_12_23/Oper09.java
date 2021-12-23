package p2021_12_23;

public class Oper09 {

	public static void main(String[] args) {
	
		//확장 대입 연산자 += -= *= /= %=
//			a+=b;		a = a + b;
//			a-=b;		a = a - b;
//			a*=b;		a = a * b;
//			a/=b;		a = a / b;
//			a%=b;	a = a % b;
		
		int a=10, b=3; //초기값 할당
		System.out.println(a+=b); //a=a+b=10+3=13
		System.out.println(a-=b); //a=a-b=13-3=10 
		System.out.println(a*=b); //a=a*b=10*3=30
		System.out.println(a/=b); //a=a/b=30/3=10
		System.out.println(a%=b);//a=a%b=10%3=1 ///이 시점에서 a=1 b=3가 됨
		
		System.out.println("a:"+a+" \tb:"+b); //a=1 b=3

	} //main

}//class
