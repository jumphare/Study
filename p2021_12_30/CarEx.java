package p2021_12_30;

//클래스 하나 더 생성

class Car{		//컴파일은 되지만 독립적으로 실행될 수는 없음 메인이 없으니까
	//필드field
	String company="현대";
	String model="그랜저";
	String color="검정";
	int maxSpeed=350;
	int speed;
	
	public Car() {  //생성자 (필수는 아닌데 만들어도 됨) // 매개변수 없으므로 기본 생성자
		System.out.println("생성자 호출됨");
	}
	
}


public class CarEx { 		//main 메소드를 가지고 있는 class가 파일명과 동일한 클래스명을 가져야 함 (메인 클래스인 것이지)
									//그리고 이 클래스만 public을 앞에 달 수 있음
	public static void main(String[] args) {
		// 위의 car 클래스 실행하기 위해서는 메인메소드에 불러와야 함
		 
		Car mycar =new Car();	//클래스 Car의 인스턴스 변수를 선언 //생성자는 객체를 생성할때 '호출'함
		System.out.println("제작회사: "+mycar.company); //mycar 변수로 Car클래스의 company를 불러올 수 있음
		System.out.println("모델: "+mycar.model); 
		System.out.println("색: "+mycar.color); 
		System.out.println("최고속도: "+mycar.maxSpeed);
		System.out.println("현재속도: "+mycar.speed);  // 지정되지 않았으니 0
		
		// 필드값 변경
		mycar.speed=60; //main메소드 값을 Car 클래스의 speed 변수에 리턴시켜줌
		System.out.println("수정 속도: "+mycar.speed);

	}

}
