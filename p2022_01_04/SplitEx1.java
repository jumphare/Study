package p2022_01_04;

public class SplitEx1 {

	public static void main(String[] args) {
		// Split() 예제
		
		String text="홍길동&이수홍,박연수,김자바-최명호";
		
		String[] names=text.split("&|,|-");
		for(String s: names)
			System.out.println(s);

	}

}
