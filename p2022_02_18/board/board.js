	function check(){
		var writer = document.getElementById("writer");
		var passwd = document.getElementById("passwd");
		var subject=document.getElementById("subject");
		var content=document.getElementById("content");
		
		if(writer.value==""){
			alert("이름을 입력하세요");
			writer.focus();
			return false;
		}
		if(passwd.value==""){
			alert("비밀번호를 입력하세요");
			passwd.focus();
			return false;
		}
		if(passwd.value.length<2||passwd.value.length>8){
			alert("비밀번호는 2~8자 사이입니다");
			passwd.focus();
			return false;
		}
		if(subject.value==""){
			alert("제목이 없어도 괜찮겠습니까");
			subject.value="제목없음";
			subject.focus();
			return false;
		}
		if(subject.value.length>50){
			alert("제목은 50자 이내입니다");
			subject.value="";
			subject.focus();
			return false;
		}
		if(content.value==""){
			alert("내용이 없어도 괜찮겠습니까");
			content.value="내용없음";
			content.focus();
			return false;
		}
		if(content.value.length>200){
			alert("200자 이내로 입력하세요");
			content.focus();
			return false;
		}
		
	} 