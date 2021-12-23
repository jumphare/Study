package p2021_12_22;

public class Oper02 {

	public static void main(String[] args) {

		//문자열 연결 연산자 +
		String str1="JAVA";
		String str2=str1+"ORACLE";
		System.out.println("str1="+str1); //str1=JAVA
		System.out.println("str2="+str2); //str2=JAVAORACLE
		
		String str3="파이썬";
		String str4="스프링";
		System.out.println(str3+str4);
		
		int i=50;
		System.out.println(str3+i); //파이썬50
		
		String str5=str3+i;
		System.out.println("str5="+str5); //파이썬50
		//String은 데이터형 상관없이 다 연결해서 출력 가능, 단 연산은 X
		
	}//main

}//class
