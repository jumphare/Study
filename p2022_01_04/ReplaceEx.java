package p2022_01_04;

public class ReplaceEx {

	public static void main(String[] args) {
		//예제 506
		// String 클래스의 replace() 메소드
		//old.replace("A","B") ->old에 저장된 문자열에서 A 문자를 B 문자로 치환시킴
		
		String oldStr="자바는 객체지향 언어이다.";
		
		String newStr=oldStr.replace("자바","JAVA");
		
		System.out.println(oldStr);
		System.out.println(newStr);
		

		
		
		
	}//

}//
