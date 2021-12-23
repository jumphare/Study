package p2021_12_22;

public class Oper04 {

	public static void main(String[] args) {

		//String의 비교 -> 데이터값이 아니라, 주소값을 비교한다!

		String n1="자바";
		String n2=new String("자바"); //명시적으로 heap에 새 공간을 생성해 그 안에 값을 넣으라는 의미->다른주소!
		String n3="자바";
		String n4="JAVA";
		String n5=new String("자바");
		
		boolean r1=(n1==n2); //F 나옴 다른 주소라서
		boolean r2=(n1==n3); //T 나옴 new 연산자 사용한게 아니라 같은 주소임!
		boolean r3=(n1==n4); //F 나옴 다른 값이니까 다른 주소인것...
		boolean r4=(n2==n5); //F 나옴 둘 다 새 공간을 생성해 값을 따로 집어넣은 거니까 다른 주소인 것임
		System.out.println(r1+", "+r2+", "+r3+", "+r4);
		
		//값을 비교하고 싶을 땐 equals를 이용한다
		System.out.println(n1.equals(n2)); //T
		System.out.println(n1.equals(n3)); //T
		System.out.println(n1.equals(n4)); //F
		
	} //main

}//class
