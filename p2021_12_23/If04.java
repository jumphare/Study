package p2021_12_23;

import java.util.Scanner;

public class If04 {

	public static void main(String[] args) {
		
		//조건문 if -4
		//키보드로 세개의 값을 입력받아 최대, 최소값 구하기
		
		System.out.println("정수 세 개 입력");
		
		Scanner sc=new Scanner(System.in);
		
		int n1,n2,n3,max, min;
		n1=sc.nextInt();
		n2=sc.nextInt();
		n3=sc.nextInt();
		//int형 변수 한번에 다 선언하는게 int 여러번 안써도 되고 훨씬 낫다
		
		if(n1>=n2&&n1>=n3) {
			max=n1;
		} else if (n2>=n1&&n2>=n3) {
			max=n2;
		}	else {
			max=n3;
		}
		
		if(n1<=n2&&n1<=n3) {
			min=n1;
		} else if (n2<=n1&&n2<=n3) {
			min=n2;
		}	else {
			min=n3;
		}
		//max, min 변수 굳이 선언한 이유...... if문 나와서 sop 한번만 쓸라구
		
		System.out.println("max:"+max+"\tmin:"+min);

	} //m

}//c
