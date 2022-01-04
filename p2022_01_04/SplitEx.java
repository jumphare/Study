package p2022_01_04;

public class SplitEx {

	public static void main(String[] args) {
		// split(): 
		String jumin="900101-1234567";
		String[] j=jumin.split("-");	//-로 구분해 앞뒤를 배열에 각각 넣음
		System.out.println("앞자리"+j[0]);
		System.out.println("뒷자리"+j[1]);
		
		for(String s:j)
			System.out.println(s);
		
		String tel="010-1234-5678";
		String[] t=tel.split("-");
		
		for(String s:t)
			System.out.println(s);
		

	}

}
