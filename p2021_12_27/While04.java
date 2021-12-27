package p2021_12_27;

public class While04 {

	public static void main(String[] args) {
		// while문 이용해 구구단 2~9단 출력하는 프로그램
		
		int i=1,num=2;
		
		while(num<=9) { //구구단 앞부분 2~9
			while(i<=9) { //앞부분에 곱하는 수 1~9
				System.out.println(num+"*"+i+"="+(num*i));
				i++;
			}
			i=1; // 위의 while문이 다 돌고 내려오면 i=10인 상태이므로, num이 증가해도 while문이 동작하지 않음 -> 2단만 나오고 끝난다
			// 따라서 바깥 while문에서 다시 i=1로 바꿔주면 num가 증가함에 따라 안쪽 while도 다시 9번씩 동작 -> 9단까지 나오게 됨
			num++;
			System.out.println(); //단마다 한칸씩 벌리기
		}

	}

}
