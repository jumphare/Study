package p2021_12_22;

public class ExplicitConversion {

    public static void main( String[] args ) {
    	
	// int형 변수를 97로 초기화
	int intValue = 97;
	
	// char형 변수에 int형 변수 값을 할당
	char charValue = (char)intValue;
	System.out.println( "charValue = " + charValue );

	// float형 변수 초기화.
	float floatValue = 3.14F;
	
	// int형 변수에 float형 변수 값을 할당
	int intValue2 = (int)floatValue;
	System.out.println( "intValue2 = " + intValue2 );

	// float형 변수 초기화
	double doubleValue = 21.1234567890;
	
	// float형 변수에 double형 변수 값을 할당
	float floatValue2 = (float)doubleValue; //float형만큼 잘려서 나옴 -> 숫자 8개만 나오게 됨
	System.out.println( "floatValue3 = " + floatValue2 );
	
	int Va1=10;
	double Va2=5.5;
	
	double result=Va1+Va2;
	int result2=Va1+(int)Va2; //result를 int형으로 바꾸고 싶으면 double형을 int로 강제변환시키고 해야함
	System.out.println(result);
	System.out.println(result2);

    }
}