package p2021_12_27;

public class For06 {

	public static void main(String[] args) {
		// 구구단 2~9단 출력하는 프로그램
		
		for(int i=2;i<=9;i++) {//2~9단
			for(int j=1;j<=9;j++) { //1~9까지 곱해줌
				System.out.println(i+"*"+j+"="+(i*j));
			}
		 System.out.println(); //각 단 한칸 띄우기
		
		}
			
			
			

	}

}
