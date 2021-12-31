package p2021_12_31;

// 싱글톤: 하나의 어플리케이션 내에 하나만 생성되는 객체 -> 객체 생성을 한 번만 수행!
// 교재 244

class Singleton {

	private static Singleton s = new Singleton(); // 정적 필드

	public static Singleton getInstance() { // 정적 메소드
		return s; // 원래 private라 사용할 수 없는 s를 return시켜 공유 가능하게 만든 것
	}
	
	public void check() {
		System.out.println("호출 성공");
	}
	
	public void check1() {
		System.out.println("호출 성성공");
	}

}

public class SingletonEx {
	public static void main(String[] args) {

//		System.out.println(Singleton.s);		//static은 class.연산자로 접근 가능하지만 private 접근제어자 때문에 접근 불가->오류
		
		//Singleton class 호출 -> static 아니니까 객체 생성해야하지만 싱글톤으로 s라는 객체가 이미 만들어져 공유되고 있잖아
		Singleton obj1=Singleton.getInstance();		//getInstance()로 s라는 객체를 리턴받고
																//s라는 객체의 주소가 저장된 동일한 자료형(=Singleton)인 변수 obj1 생성한것
		//obj2 변수로 추가로 선언해도 두 변수에 담긴 주소는 같음 -> static 영역에 저장되었으므로 공유되고 있기 때문
				
	//원래 check(), check1()은 static이 아니라서 객체를 선언해 호출해야 하는데 싱글톤은 객체를 미리 하나 만들어서 그걸 공유해버리는 것임 
		obj1.check(); 	// 공유를 목적으로 배포할때 사용자마다 다 객체를 새로 선언시키면 메모리를 효율적으로 사용하지 못해서 싱글톤 쓰는것
		obj1.check1();

	}
}
