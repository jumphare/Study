package p2022_01_14;

import java.io.*;

public class result_0114 {

	public static void main(String[] args) {
		// 키보드로 입력한 문장을 result.txt 파일로 저장하는 프로그램

		System.out.println("저장할 문장을 입력하세요");
		try {
//			InputStreamReader isr = new InputStreamReader(System.in);
			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

			FileWriter fw = new FileWriter("result.txt");

			int inValue = 0;

			while ((inValue = br.read()) != -1) {
				fw.write(inValue);
				fw.flush();
				System.out.print((char) inValue);
			}
			fw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
