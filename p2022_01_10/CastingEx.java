package p2022_01_10;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

public class CastingEx {

	public static void main(String[] args) {
		// 업캐스팅 예

		// ex 1: Calendar
//		Calendar c= new Calendar(); //오류남 Calendar 클래스엔 매개변수없는 생성자가 없기 때문에
		Calendar c1=Calendar.getInstance();	// 이거는 캘린더 클래스 객체 얻는 방법
		Calendar c2 = new GregorianCalendar();	//	-> 자동 형변환 업캐스팅
		GregorianCalendar c3=new GregorianCalendar(); // -> 자기 자신의 객체를 만드는 것도 물론 가능
		
		// ex 2: List
//		List li =new List(); 	//오류남 List는 인터페이스 -> 자체적으로 객체를 생성할 수 없기 때문에
		List list= new ArrayList();		// 상속관계 활용해 List 인터페이스 객체 생성 -> 자동 형변환 업캐스팅
		
		// ex 3: 자료형 혼용 (여기서 자주 사용)
		// 위의 List에 이어서~
		list.add(10);			//자료형 관계없이 리스트에 저장 가능 (자료구조에서 배울 것)
		list.add(3.14);		//순차적으로 공간에 저장 가능
		list.add(true);		//동적인 자료구조 -> 미리 크기 지정 안 해도 원하는 만큼 저장이 가능함
		list.add('A');			// 왜냐면 -----> add(Object e) 매개변수가 Object 임
		list.add("java program"); //  -> 즉 최상위 클래스이기 때문에 매개변수 다 Object로 업캐스팅
		
		// add(Object e); 형태여서 리스트에 저장할 때
		// Object e= new Integer(10); -> 박싱+업캐스팅
		// Object e= 3.14; -> 오토박싱+업캐스팅
		// ...
		
		//ex 4: boolean equals(Object an)
		if("java".equals(new String("java"))) { // Object an=new String("java") -> 박싱+업캐스팅
			System.out.println("같은 값");
		} else if ("java".equals("자바")){		 //Object an="자바" -> 오토박싱+업캐스팅
			System.out.println("다른 값");
		}
		
		if(new Integer(30).equals(new Integer(30))) { //Object an= new Integer(30); -> 박싱+업캐스팅
			System.out.println("같은 값");		
		} else if (new Integer(30).equals(50))	//Object an=50; ->오토박싱+업캐스팅
				System.out.println("다른 값");
		
		
		//다운캐스팅 예
		
		//ex 1: 자료형이 Object일 때 				(매개변수가 Object->업캐스팅)
		List lt=new ArrayList();		//List는 인터페이스라 생성자 없어서 객체 생성할 때 자식클래스 이용해야함 
//		add(Object e)
		lt.add(new String("자바"));		//다운은 일단 업캐스팅 먼저 해야함
		lt.add(3.14);
		lt.add('A');
		
//		Object get(int index) 	// -> Object 클래스에 있는, 인덱스 번호로 리스트 값 불러오는 메소드 get() 
//		Object obj=lt.get(0); // -> 리스트 0번에 저장된 값 "자바" 를 Object형 변수 obj에 저장
		
		//보통 ↓아래 방식으로 많이 사용함
		String s1=(String) lt.get(0); 		//리스트 0번에 저장된 "자바"를 String형 변수 s1에 저장
		Double d1=(Double) lt.get(1);	//리스트 1번에 저장된 3.14를 double형 변수 d1에 저장		
// Object형 List로 저장된 값을 자식클래스 자료형인 String, Double형 등으로 형변환해 저장-> 다운캐스팅
		
		//ex 2: Wrapper
		List ls=new ArrayList();	//업캐스팅 먼저 ㄱㄱ
		ls.add(new Integer(10));		//new Wrapper -> 박싱
		ls.add(200);						//오토박싱
		ls.add(50000);					// 어쨌든 이런 애들 다 박싱+업캐스팅
		
		for(int i=0;i<ls.size();i++) { 			//ls.size() -> 동적 자료구조라 저장하는 만큼 크기가 늘어남
			Integer it =(Integer)ls.get(i);	//Wrapper의 Integer class -> Object형 값을 integer로 다운캐스팅
			int n=it.intValue();					//heap에 저장된 값을 int형으로 변환후 n에 할당해 stack으로-> 언박싱
		//				┌ 다운캐스팅은 강제형변환 반드시 필요!
			int n1=((Integer)ls.get(i)).intValue();	// 변수로 지정하지 않으면 이런 형태 -> 언박싱+다운캐스팅
		}	// 같은 자료형 값만 list에 저장된 경우 그 자료형으로만 다운캐스팅해야함!
		

	}//

}//
