package p2021_12_23;

public class If06 {

	public static void main(String[] args) {


	//	난수 발생 	Math.random() 0.0<=n<1.0
	//	발생 공식 	난수=(int)(Math.random()*(상한값-하한값+1))+하한값;
		
		System.out.println(Math.random());
		System.out.println(Math.E);
		System.out.println(Math.PI);
		
		
		//주사위 -> Math.random의 범위를 1<=n<=6으로 지정해야 하는것이다
		
		int num=(int)(Math.random()*6)+1; // 최소값 0.0*6+1=1, 최대값 0.9999...*6+1=5.XXX+1=6.XXX ->int형으로 바꿀 시 6 됨

		System.out.println(num);
		
		if(num==1) {
			System.out.println("주사위 1");
		} else if(num==2) {
			System.out.println("주사위 2");
		} else if(num==3) {
			System.out.println("주사위 3");
		} else if(num==4) {
			System.out.println("주사위 4");
		} else if(num==5) {
			System.out.println("주사위 5");
		}  else {
			System.out.println("주사위 6");
		}
		
		//1~45 난수 발생
		
		int lotto=(int)(Math.random()*45)+1; 
		System.out.println(lotto);

		
	}//m

}//c
