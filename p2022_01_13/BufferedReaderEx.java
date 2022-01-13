package p2022_01_13;

import java.io.*;

public class BufferedReaderEx {

	public static void main(String[] args) {
		//Scanner로 처리한걸 이걸로 바꿀것임
		//키보드로 숫자 1개 입력받아 구구단  출력
		BufferedReader bf=new BufferedReader(new InputStreamReader (System.in));
		
		System.out.print("단을 입력하세요: ");
		try {
			String str=bf.readLine();	//입력받은걸 읽어서 String형으로 반환
			int intValue= Integer.parseInt(str);	// String형을 int형으로 변환 (Integer)
			System.out.println(intValue+"단");
			for(int i=1;i<10;i++)
				System.out.println(intValue+"*"+i+"="+(intValue*i));		//구구단 출력
			
		} catch(Exception e) {	//readLine()은 예외처리 필수
			System.out.println("숫자만 입력하세요");
			e.printStackTrace();
		}

	}

}
