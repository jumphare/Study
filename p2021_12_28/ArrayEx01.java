package p2021_12_28;

public class ArrayEx01 {

	public static void main(String[] args) {

		//배열: 동일한 자료형의 데이터를 저장하기 위한 정적인 자료구조
		//변수를 확장시킨 개념		변수->배열->자료구조(List)
		
/////////1차원 배열 값이 정해져 있지 않을 때////////////
		int[] 		score		= new 	int[3]; //정적 구조이므로 배열 크기가 정해져있음
	// 자료형		배열변수	   연산자	자료형[배열 크기](변수의 자료형과 동일해야 함)
		
		//위와 같이 배열을 선언한 시점에서 각 배열의 초기값(in heap)은 모두 0인 상태
		System.out.println(score[0]);
		System.out.println(score[1]);
		System.out.println(score[2]);
		
		score[0]=80;
		score[1]=90;
		score[2]=100;
		//각 배열에 할당해준 값이 출력됨
		System.out.println(score[0]);
		System.out.println(score[1]);
		System.out.println(score[2]);
		
		
		double[] d=new double[3];
		//각 배열의 초기값은 0.0
		System.out.println(d[0]);
		System.out.println(d[1]);
		System.out.println(d[2]);
		
		char[] c=new char[3];
		//배열 출력 시 공백 (공백이 초기값인.. 아무것도 들어있지 않아서)
		System.out.println(c[0]);
		System.out.println(c[1]);
		System.out.println(c[2]);
		
		boolean[] b=new boolean[3];
		//초기값 0=false
		System.out.println(b[0]);
		System.out.println(b[1]);
		System.out.println(b[2]);
		
		String[] str=new String[3];
		//초기값 null 
		System.out.println(str[0]);
		System.out.println(str[1]);
		System.out.println(str[2]);
		
		str[0]="java";
		str[1]="jsp";
		str[2]="oracle";
		System.out.println(str[0]);
		System.out.println(str[1]);
		System.out.println(str[2]);
		
		
/////////1차원 배열 값이 정해져 있을 때////////////
		//배열 선언과 동시에 초기화를 할 때 사용
		
		int[] s1= {80,90,100};
		//초기값 80,90,100 바로 설정
		System.out.println(s1[0]);
		System.out.println(s1[1]);
		System.out.println(s1[2]);
		
		System.out.println("배열 크기: "+s1.length); //80,90,100 세 개 쓰니까 3 length는 배열의 '속성' 관련이라 괄호 없음
		
		for(int i=0;i<s1.length;i++) //0,1,2까지 루프시켜야--->  i<3 쓰거나 s1.length 쓰거나...
			System.out.print(s1[i]+"\t"); //배열 한 번에  출력하기			
		System.out.println();
		
		double[] d1= {3.14, 10.5, 42.1, 50}; //50은 자동으로 50.0이 된다
		for(int i=0;i<d1.length;i++)
			System.out.print(d1[i]+"\t");
		System.out.println();
		
		char[] c1= {'A','b','사','바'};
		for(int i=0;i<c1.length;i++)
			System.out.print(c1[i]+"\t");
		System.out.println();
		
		boolean[] b1= {true, false, true};
		for(int i=0;i<b1.length;i++)
			System.out.print(b1[i]+"\t");
		System.out.println();
		
		String[] str1= {"abc","def","ghi","jkl"};
		String[] str2= new String[] {"가나다","라마바","사아자","차카타파하"};
		
		for(int i=0;i<str1.length;i++)
			System.out.print(str1[i]+"\t");
		System.out.println();
		for(int i=0;i<str2.length;i++)
			System.out.print(str2[i]+"\t\t");
		System.out.println();
		
		
		
	}//m

}//c
