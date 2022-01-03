package p2022_01_03;

public class SubStringEx {

	public static void main(String[] args) {
		//주민번호가 남자인지 여자인지 판별하는 프로그램\
		
		String min="900101-2234567";
		String gender=min.substring(7,8); //뒷자리 첫번째 숫자 하나 뽑아냄
		
		if(gender.equals("1")||gender.equals("3")){
			System.out.println("남자");
		} else if(gender.equals("2")||gender.equals("4"))
			System.out.println("여자");

	}

}
