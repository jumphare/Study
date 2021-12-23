package p2021_12_22;

import java.util.ArrayList;
import java.util.List;

public class Variable {

	public static void main(String[] args) {
//변수: 메모리 상에 데이터를 저장하기 위한 기억 공간
		//자료형 변수
		//1 정수형 변수
		byte b1=10; // -128~127 사이만 가능
//		byte b2=130; //오버플로우 발생
		short s=100; //-32768~32767
		int i=1000; //+-21억
		long l=10000;// 얘도 2200000000같은 큰숫자.. int로 안되는 크기는 L 붙여야 인식됨
		
		System.out.println("b1="+b1); //변수 연결할땐 앞에 +를 붙인다
		System.out.println("s="+s); //변수 연결할땐 앞에 +를 붙인다
		System.out.println("i="+i); //변수 연결할땐 앞에 +를 붙인다
		System.out.println("l="+l); //변수 연결할땐 앞에 +를 붙인다
		
		//2 실수형 변수
//		int f=3.14; //정수형에 실수형 넣으면 오류남
		float f1=3.14f; //float형은 뒤에 대문자나 소문자 F를 꼭 붙여야 함
		float f2=3.14F;
		float f=(float)3.14; //기본적으로 f가 안붙은 디폴트=더블 형이라서 float라고 형변환시키는 것
		double d=42.195;
		
		System.out.println("f1="+f1);
		System.out.println("f2="+f2);
		System.out.println("f="+f);
		System.out.println("d="+d);
		
		System.out.printf("%.1f\n",d); //소수점 첫째자리(1f)까지 출력- 둘째자리에서 반올림함, \n:줄바꿈
		System.out.printf("%.2f\n",d);
		
		//3 문자형 변수
		char c1='A'; //반드시 '' 안에 문자 하나씩만 가능
		char c2='안';
		
		System.out.println("c1="+c1);
		System.out.println("c2="+c2);
		
		//4 논리형 변수
		boolean bn1=true;
		boolean bn2=false;
		System.out.println("bn1="+bn1);
		System.out.println("bn2="+bn2);
		
		//참조형 변수 : 클래스, 배열, 인터페이스: 데이터 아닌 주소값을 받는거라 자유롭게 넣을 수 있는것
		String s1="자바"; //문자 넣는 클래스.. "" 안에 넣어야함
		String s2= new String("자바"); //new 연산자 이용해서 넣는 것도 됨
		
		System.out.println("s1="+s1);
		System.out.println("s2="+s2);
		
		if(s1==s2) {
			System.out.println("같은주소");
		} else {
			System.out.println("다른\t주소");
		} //다른주소가 나올 것 -> 같은 "자바"라는 데이터는 가지고 있지만, 각 데이터가 저장되는 주소가 다르기 때문!
		
		if(s1.equals(s2)) { //데이터값을 비교 (주소 말고 데이터!)
			System.out.println("같은값");
		} else {
			System.out.println("다른값");
		} //같은값이 나옴 -> 당연함 데이터값이 "자바"로 동일함
		
		//참조형변수 - 배열 : "동일한" 자료형의 데이터를 저장하는 정적인 자료구조
		int[] score= {80,90,100}; //3.14 안됨
		//stack 에 score 주소가 저장 + heap 에 배열에 할당된 데이터 80,90,100이 저장된 상태
		
		for(int j=0; j<score.length; j++) {
			System.out.print(score[j]+"\t"); //변수 뒤에 문자 붙이는거라 + 붙인것임 잊지말것
			// print는 줄바꿈이 없음! \t은 tab !!!!!!!println 이 줄바꿈 포함된것!!
			}
		System.out.println();
		/*참조형변수 - 인터페이스(List)
		1. 순차적 자료구조
		2. 여러가지 자료형 데이터를 모두 저장 가능
		3. 동적으로 공간의 크기를 늘릴 수 있음
		import 해줘야함 컨+쉬+O -> java.until.list
 		*/
		List list=new ArrayList(); //import로 빼줘야함 이거를
		list.add(30);
		list.add(3.14);
		list.add('j');
		list.add(true);
		list.add("자바");
		//공간을 계속 늘려가며 새로 뒤에 저장해나갈 수 있음
		
		for(int k=0; k<list.size();k++) {
			System.out.print(list.get(k)+"\t");
		}
		
		
		
		
		
		
		
		
		
	} //main end

}//class end
