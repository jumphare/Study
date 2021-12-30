package p2021_12_30;

class MyDate05{   
  private int year;    
  private int month;    
  private int day;

  public MyDate05(){
  }
  //////////중요///////
  //선언된 생성자가 아무것도 없을 때는 객체 생성시 기본생성자가 자동으로 만들어지는데
  //만약 매개변수를 가진 생성자가 존재하는 경우엔 만들어지지 않으므로, 기본생성자가 필요하다면 따로 선언시켜줘야함
  /////////////////////
  public MyDate05(int new_year, int new_month, int new_day){
    year=new_year;
    month=new_month;
    day=new_day;
  }  
  //생성자의 매개변수명과 필드명이 동일할 경우 매개변수의 값이 전달되지 않음 인식이 안됨 그냥
  
  public void print(){
    System.out.println(year+ "/" +month+ "/" +day); 
  }
}
public class ConstructorTest05 {     
  public static void main(String[] args) {
    MyDate05 d=new MyDate05();  //따로 지정하지 않았으니 기본적으로 할당된 값 0으로 초기화된 상태
    d.print();
 //   System.out.println(d.year); 	//private상태라 year를 바로 가져올 수 없음

    MyDate05 d2=new MyDate05(2017, 7, 19);	//지정된 값으로 멤버변수 초기화하고 싶은 경우 이런 생성자를 사용함
    d2.print();
  }
}      