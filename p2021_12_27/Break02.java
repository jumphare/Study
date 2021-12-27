package p2021_12_27;

public class Break02 {

	public static void main(String[] args) {
		// while에서 break 사용
		
		int i=1;
		while(true) {
			System.out.println(i+"무한출력");
			if (i==100)
				break;
			i++;
		}

	}

}
