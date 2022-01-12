package p2022_01_12;

import java.util.*;

public class Infofinalex {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 객체 배열 : 객체의 주소를 저장하는 배열
		ArrayList<MemberInfo> list = new ArrayList<MemberInfo>();
		//Generic: 한가지 자료형의 자료만 저장하겠다는 선언
		//list에 memberInfo 객체만 저장할 수 있음
		boolean bb=true;
		String yn;
		Scanner sc = new Scanner(System.in);
		String name, email, address;
		int age;
		while(true) {
			System.out.print("성명을 입력하세요? ");
			name = sc.nextLine();
			System.out.print("나이를 입력하세요? ");
			try {
				age = sc.nextInt();		// 숫자를 입력받은후에 enter키를
				sc.nextLine();
			} catch (Exception e) {
				System.out.println("입력한 값이 숫자가 아닙니다.");
				bb=false;
				sc.close();
				break;
			}
			System.out.print("E-Mail을 입력하세요? ");
			email = sc.nextLine();
			System.out.print("주소를 입력하세요? ");
			address = sc.nextLine();

			MemberInfo m = new MemberInfo();
			m.setName(name);
			m.setAge(age);
			m.setEmail(email);
			m.setAddress(address);
			//생성자로 필드값 초기화시키거나 set Method로 초기화시키거나 <- 다음엔 set 메소드 써보는걸로
			//생성자로 넘겨주는건 초기값만 지정해주는? 스타일이라 다루기 좀 불편하니까
			//set 메소드 사용하는건 원하는 필드에 값을 하나씩 넣어줄 수 있다는 점에서 좀더 활용도가 높고.. 이걸 더 많이 쓴다고 함
			
			list.add(m);		//MemberInfo 생성자로 생성한 인포 정보가 든 객체 주소를 list에 저장?
			//루프마다 계속 새로운 객체가 선언되고 정보가 저장됨-> 그 정보 저장된 객체의 주소를 list에 저장
			//MemberInfo m을 Object형 list에 저장 -> 업캐스팅
			// list 자료형을 MemberInfo로.. 제네릭으로 한정하면 add(MemberInfo e)로 바뀌더라 이건 업캐스팅 아닌듯			
			
			System.out.print("계속할려면 y, 멈출려면 n을 입력?");
			yn = sc.nextLine();
			if (yn.equals("y") || yn.equals("Y")) {
				continue;
			} else if (yn.equals("n") || yn.equals("N")) {
				break;
			}

		} 

		
		for (int i = 0; i < list.size(); i++) {
			if(bb!=true)
				break;
			System.out.println();
			System.out.println((i+1)+"번 학생 정보");
			MemberInfo mm=list.get(i);	//list에 저장해둔 객체 주소를 MemberInfo 변수로 옮겨주고
			//위에 제네릭으로 범위 잡아둬서 굳이 여기서 강제형변환하지 않아도 되는거지
			//클래스 하나니까.. 여러개 저장할땐 그냥 object형으로 다 받게 하고 다운캐스팅하는게 나을지도요
			//i는 인덱스번호	-> list에 저장된 MemberInfo m의 정보가 담긴 각각의 주소를 다시 MemberInfo 객체로 옮겨주고..
			System.out.println("성명:" + mm.getName());	//mm 변수로 MemberInfo 정보 저장된 객체 주소로 접근해서 값 가져오기
			System.out.println("나이:" + mm.getAge());
			System.out.println("E-Mail:" + mm.getEmail());
			System.out.println("주소:" + mm.getAddress());


		}
	}

}

// DTO(Data Transfer Object)
class MemberInfo extends Object{ 	//최상위 클래스 Object는 자동으로 상속받는 것.. 생략해도 문제없음 디폴트임
	private String name;
	private int age;
	private String email;
	private String address;
	
	//private 필드 초기화 시키는 방법
	//1. 생성자 매개변수를 통해
	//2, setName() 메소드를 통해

	public void setName(String name) {
		this.name = name;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public int getAge() {
		return age;
	}

	public String getEmail() {
		return email;
	}

	public String getAddress() {
		return address;
	}
	

}
