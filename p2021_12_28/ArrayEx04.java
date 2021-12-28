package p2021_12_28;

public class ArrayEx04 {

	public static void main(String[] args) {
		// 배열 값끼리 비교해 최대값 최소값 구하기
		
		double[] data= {9.5, 7.0, 13.6, 7.5, 10.5};
		
		double max=data[0],min=data[0];
		
		for(int i=0; i<data.length;i++) {
			if(data[i]>max) max=data[i];
			if(data[i]<min)	min=data[i];
		}
		
		System.out.println("max= "+max+"\tmin= "+min);

	}

}
