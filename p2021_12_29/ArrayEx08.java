package p2021_12_29;

public class ArrayEx08 {

	public static void main(String[] args) {
		// 교재 167~8
		//배열 복사: for문으로 배열 복사
		
		int[] oldArray= {10,20,30}; //원본 배열
		int[] newArray= new int[5]; //새 배열
		
		for(int i=0; i<oldArray.length;i++) {
			newArray[i]=oldArray[i];		// 새 배열에 원본 배열 복사
		}
		
		for(int i:newArray) {
			System.out.println(i+"\t"); //향상된 for문은 특성 상 i 자체가 newArray[i]를 나타낸다고 생각하면 된다
		}

	}

}
