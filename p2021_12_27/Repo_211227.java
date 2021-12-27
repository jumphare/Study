package p2021_12_27;

public class Repo_211227 {

	public static void main(String[] args) {
		// 		1.구구단(2~9단)을 열방향(세로방향)으로 출력하는 프로그램을 작성 하세요?
		
		int i,j;
		
		for(i=2; i<=9;i++) {
		System.out.print("["+i+"단]\t\t");
		}
		System.out.println();
		
		for(j=1;j<=9;j++) { //구구단 뒷자리 1~9
			for(i=2; i<=9;i++) { //구구단 앞자리 2~9
				System.out.print(i+"*"+j+"="+(i*j)+"\t");
			}
			System.out.println();
		}
		
		
	}

}
