package p2021_12_23;

public class If01 {

	public static void main(String[] args) {

		//조건문 if -1
		
		if(10>5) { //조건식 만들 때 ()괄호 안에 집어넣어야 함
			System.out.println("true");
		}
		if(10>5) System.out.println("T"); //실행 문장이 한줄인 경우 {} 생략 가넝
		if(true) System.out.println("실행"); //true=참이기 때문에 무조건 출력
		if(false) System.out.println("실행불가"); //false=거짓이라 출력 ㄴ
		if(10>30)
			System.out.println("ccc"); //중괄호 없을 때 if문 바로 아래 1줄만 적용됨
		System.out.println("if문 영향 x");
		
		

	} //m

}//c
