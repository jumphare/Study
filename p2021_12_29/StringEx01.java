package p2021_12_29;

public class StringEx01 {

	public static void main(String[] args) {
		// 교재 148
		//String 객체

		String str1="자바";
		String str2="자바";
		
		/////////////stack에 저장되어있는 '주소'를 비교함//////////////
		if(str1==str2) { 
			System.out.println("같은주소");
		} else
			System.out.println("다른주소");
		// 같은 주소가 출력됨. 문자열을 바로 입력->리터럴 동일한 경우 heap 메모리 주소값을 공유하기 때문
		// heap 메모리 내 "자바"라는 값이 한곳에 저장되어 있고 이것을 가져오는 주소를 str1,str2이 공유하는 것
		
		String str3=new String("자바");
		String str4=new String("자바");
		
		if(str3==str4) {
			System.out.println("같은주소");
		} else
			System.out.println("다른주소");
		// 다른 주소가 출력됨. 각자 heap 메모리에 new 연산자로 새 영역을 선언해 값을 집어넣은 것이기 때문
		// heap 메모리 내 "자바"라는 값이 저장된 공간이 둘 있고 각 공간의 주소를 str3,str4이 가지고 있는 것
		
		if(str1==str3) {
			System.out.println("같은주소");
		} else
			System.out.println("다른주소");
		//다른 주소가 출력됨. str3는 new 연산자로 heap에 새 영역을 선언해 값을 집어넣었기 때문에 str1의 값이랑 주소가 다름
		
		////////////heap에 저장되어있는 '값'을 비교함////////////
		if(str1.equals(str2)) {		
			System.out.println("같은값");
		} else
			System.out.println("다른값");
		
		if(str3.equals(str4)) {		
			System.out.println("같은값");
		} else
			System.out.println("다른값");
		
		if(str1.equals(str3)) {		
			System.out.println("같은값");
		} else
			System.out.println("다른값");
		
		boolean b="자바".equals("파이썬"); // b=false
		
		if(b) {
			System.out.println("같은값");
		} else System.out.println("다른값");
		
		
	}//

}//
