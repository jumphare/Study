package p2021_12_30;

class MyDate06{   
  private int year;    
  private int month;    
  private int day;
 
//  public MyDate(){//default 생성자
//  }  
  /*
  public MyDate06(int new_year, int new_month, int new_day){
    year=new_year;  // 2017
	month=new_month;  // 7  
	day=new_day; // 19
  } */
  
  public MyDate06(int year, int month, int day) {
		this.year = year;
		this.month = month;
		this.day = day;
	}
  /*
  public void SetYear(int year){
	  this.year=year;  //필드로 값 전달하려면 이렇게 만들어야함
       //year=year; //필드로 값 전달되는게 아니고 그냥 매개변수가 매개변수로 가는 의미없는 식이 됨
  }
  public void SetMonth(int new_month){
	month=new_month; // month=8
 }*/
  
  
  
  
  
  public int getYear() {
	return year;
}
public int getMonth() {
	return month;
}
public int getDay() {
	return day;
}
public void setYear(int year) {
	this.year = year;
}
public void setMonth(int month) {
	this.month = month;
}
public void setDay(int day) {
	this.day = day;
}
public void print(){
	System.out.println(year+ "/" +month+ "/" +day); 
  }
}
public class ConstructorTest06 {     
  public static void main(String[] args) {	
    MyDate06 d=new MyDate06(2017, 7, 19);
    d.print();               
    // d.year=2018; //접근제어자가 private라 외부 클래스에서 접근할수 없음
    d.setYear(2018);   
    d.print();        	//연도만 수정된 상태
    d.setMonth(12);   //특정 필드값만 수정하고 싶으면 새로 생성자를 불러오는게 아니라 메소드(Set~)로 변경해야함
    d.print();    		// 월 수정
    d.setDay(31);
    d.print(); 		// 일 수정
    System.out.println(d.getMonth()); // get은 현재 필드값을 일부만 가져오고 싶을 때 사용
    
  }
}     