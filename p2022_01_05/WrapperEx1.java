package p2022_01_05;

public class WrapperEx1 {

	public static void main(String[] args) {

		//Wrapper 클래스 선언 방법
		//기본 생성자 존재하지 않으므로 무조건 매개변수 하나가 있어야 함
		int a=10;		//지역변수(stack 영역에 저장)
		Integer num=new Integer(a);	//stack에는 num이라는 객체가 생성되고 heap 영역으로 값이 저장됨 -> 박싱boxing
		//박싱boxing: heap메모리를 박스로 생각하고, stack 메모리에 저장된 값을 박스에 저장시키는 것

		int a1=num.intValue();
		//언박싱unboxing: heap 메모리에 저장된 값을 stack 메모리로 가져오는 것
		
		
		Integer a2=new Integer("20"); 	//문자열이 박싱됨
		int a3=a2.intValue();		//정수형으로 변환되어 언박싱-저장됨

	}

}
