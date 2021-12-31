package Repo;

public class Repo_211231 {

	// 1~45사이의 숫자를 6개 추출 하는 프로그램
	// 단, 중복 없이

	class number{
		
		public static void random() {
			int[] num1 = new int[6]; // 숫자 6개 들어갈 배열
			int[] num2 = new int[6]; // 복사할 배열

			for (int i = 0; i < num1.length; i++) {
				num1[i] = (int) (Math.random() * 45) + 1; // 수 6개를 배열에 저장함
				num2[i] = num1[i]; // num2에 복사
			}

			for (int i = 0; i < num1.length - 1; i++) {
				for (int j = i + 1; j < num2.length; j++) {
					if (num1[i] == num2[j]) // 배열 비교해서 중복 있을 경우
						num2[j] = 0; // 해당 배열값을 0으로
				}
			}

			for (int i = 0; i < num2.length; i++) {
				if (num2[i] != 0)	//배열값이 0인 수 제외하고 출력
					System.out.print(num2[i] + " ");
			}
		}
	}
	
	public static void main(String[] args) {

		number.random();
		
		System.out.println();

	}

}
