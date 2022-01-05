package p2022_01_05;

public class WrapperEx4 {

	public static void main(String[] args) {
		// Double형
		
		Double d1=new Double(3.14);	//박싱
		Double d11=3.14; //자동박싱
		
		double n1=d1.doubleValue();	//언박싱
		double n11=d11;		//자동언박싱
		
		Double d2=new Double("42.195");	//박싱
//		Double d22="42.195";					//오류 -> 자료형이 서로 맞지 않음 Double-String
		
		double n2=d2.doubleValue();	//언박싱
		double n22=d2;				//자동언박싱은 됨 d2에서 더블형으로 값이 heap에 저장된걸 불러오는거라서
		
		
		//자료형변환 String->double
		double num=Double.parseDouble("42.195");
		System.out.println(num);

	}

}
