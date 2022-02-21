function idcheck(){
	var id=document.getElementById("id");
	if(id.value==""){
		alert("ID를 입력하세요");
		id.focus();
		return false;
	}else{		//id를 입력한 경우 팝업창 생성
		var ref="idcheck.jsp?id="+id.value;  //idcheck.jsp(서버)로 id 값을 넘김
		window.open(ref,"idcheck","width=200, height=200"); //값 넘긴 파일을 팝업창으로 띄울것
	}
}
function move(){
	var num1=document.getElementById("num1");
	var num2=document.getElementById("num2");
	
	if(num1.value.length==6) num2.focus();   //앞자리 6자 입력하면 뒷자리로 커서 넘어가게
}

function sel()  {
	var domain=document.getElementById("domain");
	var email=document.getElementById("email");
	domain.value=email.value;
	if(domain.value=="")	{
		domain.focus();
		domain.readOnly=false; 
	}else{
		domain.readOnly=true;   //readOnly로 써야햇다 얘들아...
	}   
}  
function tel(){
	pnum2.focus();
}
function openDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
//			document.getElementById('join_zip1').value = data.postcode1;
//			document.getElementById('join_zip2').value = data.postcode2;
			document.getElementById('post').value = data.zonecode;
			document.getElementById('address1').value = data.address;
			address1.readOnly=true;
			address2.focus();
		} 
	}).open();
}
function counter(){
	  document.getElementById("counting").innerHTML = document.getElementById("intro").value.length+"/100"; 
}
//submit 전 전체 유효성 검사
function check(){
	var id=document.getElementById("id");
	var passwd=document.getElementById("passwd");
	var name=document.getElementById("name");
	var num1=document.getElementById("num1");
	var num2=document.getElementById("num2");
	var mailid=document.getElementById("mailid");
	var domain=document.getElementById("domain");
	var phone=document.getElementById("phone");
	var pnum2=document.getElementById("pnum2");
	var pnum3=document.getElementById("pnum3");
	var post=document.getElementById("post");
	var address1=document.getElementById("address1");
	var address2=document.getElementById("address2");
	var female=document.getElementById("female");
	var male=document.getElementById("male");
	var h1=document.getElementById("h1");
	var h2=document.getElementById("h2");
	var h3=document.getElementById("h3");
	var h4=document.getElementById("h4");
	var intro=document.getElementById("intro");
	
	if(id.value==""){
		alert("ID를 입력하세요");
		id.focus();
		return false;
	}
	if(passwd.value==""){
		alert("PW를 입력하세요");
		passwd.focus();
		return false;
	}
	if(name.value==""){
		alert("이름을 입력하세요");
		name.focus();
		return false;
	}
	if(num1.value==""){ //1. 주민번호 입력되지 않았을 때
		alert("주민번호를 입력하세요");
		num1.focus();
		return false;
	} 
	if(num1.value.length!=6){ //2. 앞자리가 6자리가 아닐 경우
		alert("주민번호 6자리를 입력하세요");
		num1.value=""; //값 초기화시켜버리기~
		num1.focus();
		return false;
	}
	if(isNaN(num1.value)==true){ //3. 숫자 외의 다른 문자가 들어간 경우
		alert("주민번호는 숫자만 입력하세요");
		num1.value="";
		num1.focus();
		return false;
	} 
	if(num2.value==""){ //1. 주민번호 입력되지 않았을 때
		alert("주민번호를 입력하세요");
		num2.focus();
		return false;
	} 
	if(num2.value.length!=7){ //2. 앞자리가 7자리가 아닐 경우
		alert("주민번호 7자리를 입력하세요");
		num2.value=""; //값 초기화시켜버리기~
		num2.focus();
		return false;
	}
	if(isNaN(num2.value)==true){ //3. 숫자 외의 다른 문자가 들어간 경우
		alert("주민번호는 숫자만 입력하세요");
		num2.value="";
		num2.focus();
		return false;
	} 
	if(mailid.value==""){
		alert("이메일을 입력하세요");
		mailid.focus();
		return false;
	} 
	if(domain.value==""){
		alert("도메인을 입력하세요");
		domain.focus();
		return false;
	} 
	if(phone.value==""){
		alert("전화번호를 선택하세요");
		phone.focus();
		return false;
	} 
	if(pnum2.value==""){
		alert("전화번호를 입력하세요");
		pnum2.focus();
		return false;
	} 
	 //순서 주의! pnum2 유효성 다 끝나고 pnum3으로 넘어가야함
	if(isNaN(pnum2.value)==true){ 
		alert("숫자만 입력하세요");
		pnum2.value="";
		pnum2.focus();
		return false;
	}  
	if(pnum3.value==""){
		alert("전화번호를 입력하세요");
		pnum3.focus();
		return false; 
	} 
	if(isNaN(pnum3.value)==true){ 
		alert("숫자만 입력하세요"); 
		pnum3.value="";
		pnum3.focus();
		return false;
	} 
	if(post.value==""){
		alert("주소를 입력하세요");
		post.focus();
		return false;
	}  
	//라디오&체크박스는 checked 여부로 유효성 검사
	if(female.checked==false&&male.checked==false){
		alert("성별을 체크하세요");
		return false;
	}
	//두 개 이상 체크했는지 확인하는 검사
	var cnt=0;
	if(h1.checked) cnt++;
	if(h2.checked) cnt++;
	if(h3.checked) cnt++;
	if(h4.checked) cnt++;
	if(cnt<2){
		alert("취미는 두 개 이상 선택해야 합니다");
		return false;
	}
	if(intro.value==""){
		alert("자기소개를 입력하세요");
		intro.focus();
		return false;
	}
	
	if(intro.value.length>100){
		alert("100자 이내로 입력하세요");
		intro.focus();
		return false;
	}
} 
