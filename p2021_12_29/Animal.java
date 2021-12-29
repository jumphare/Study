package p2021_12_29;

public class Animal {
			//	 사용자 정의 클래스(자료형)
	
	int age; // 멤버변수, 필드(field), 전역변수 -> class에 선언된 것(메소드 말고!) -> heap 메모리에 저장됨!
				// 메소드 내 지역변수는 stack에 저장되고, 그 메소드 동작이 끝나면 사라지는 휘발성인데
				// 멤버변수는 메소드 바깥에 정의되어 heap에 저장되고 메소드 동작이 끝나도 사라지지 않음 당연함 메소드에 선언된게 아님
	
	public Animal() {	//생성자 : 괄호 필요, 반드시 클래스명과 같아야 함, 앞에 접근제어자 있을 수 있음
							//기본 생성자(Default Constructor) : 매개변수 없는 생성자
		// String str= new String(); <- 여기서 String()이 생성자인 것임 클래스 String이랑 동일한 이름의...
		
		System.out.println("생성자 호출 성공");
	}
	public static void main(String[] args) {
		
		int a=10; 	//지역변수 (stack에 저장)

		String		 str			= new String("자바"); //new로 heap 영역에 새 String 영역을 선언하면 String()이 "자바"라는 값이
				//레퍼런스 변수								//들어간 영역의 주소를 변수 str로 리턴해 할당시켜줌
		Animal a1= new Animal();		//생성자 정의를 따로 안 해둬도 실행시 기본 생성자 자동으로 만들어주긴 함 대신 아무것도 없는 빈걸루
		//클래스 접근하기 위해 레퍼런스 변수 a1을 선언한 거고, 이걸로 Animal 클래스에 선언한 멤버변수 age를 메인메소드로 가져올수 있음
		
		//멤버변수 age를 그냥 데려오려면 오류가 남
		//System.out.println(age);
		System.out.println(a1.age); //이렇게 클래스의 레퍼런스 변수 a1의 age로 불러와야 받아올 수 있음
		a1.age=5; //메인 메소드 내에 age 값을 초기값0에서 5로 변경
		System.out.println(a1.age);
		
		Animal a2=new Animal(); // 생성자 호출, heap 메모리 상에 또다른 공간이 할당되고 그 주소가 a2로 리턴됨
		System.out.println(a2.age); // 새로 클래스의 age 변수를 불러오는 것이므로 초기값 0이 출력
		
		if(a1==a2) { //a1과 a2의 주소값을 비교
			System.out.println("같은 주소");
		}
			else System.out.println("다른 주소"); //당연히 다른 주소임 서로 다른 heap 영역을 새로 할당했기 때문에.
		
		
	}

}
