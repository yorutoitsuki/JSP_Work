/**
 * 
 */
 
 function check() { //function = 함수 = 메서드
		/* 방법 2, type = "submit", type = "button"인 경우*/
		/* if(!f.memno.value){//JavaScript "" '' 둘다 문자열 취급
			alert("회원번호를 입력해주세요");//알림창
			f.memno.focus();
			return false;//false로 주면 데이터 전송이 안됨
		}
		else if(f.name.value == ""){//JavaScript "" '' 둘다 문자열 취급
			alert("회원이름을 입력해주세요");//알림창
			f.name.focus();
			return false;//false로 주면 데이터 전송이 안됨
		}
		else if(f.address.value == ""){//JavaScript "" '' 둘다 문자열 취급
			alert("주소를 입력해주세요");//알림창
			f.address.focus();
			return false;//false로 주면 데이터 전송이 안됨
		}
		else if(f.gender[0].checked == false && f.gender[1].checked){//JavaScript "" '' 둘다 문자열 취급
			alert("성별을 입력해주세요");//알림창
			//f.gender.focus();
			return false;//false로 주면 데이터 전송이 안됨
		}
		else if(f.tel1.value == ""){
			alert("전화번호를 입력해주세요");
			f.tel1.focus();
			return false;
		}
		else if(f.tel2.value == ""){
			alert("전화번호를 입력해주세요");
			f.tel2.focus();
			return false;//false로 주면 데이터 전송이 안됨
		}
		else if(f.tel3.value == ""){
			alert("전화번호를 입력해주세요");
			f.tel3.focus();
			return false;
		}
		else {
			f.submit();
			//return true;//type = "submit" 또는 "reset"인 경우 true값을 리턴하면 데이터 전송됨
			//즉, 리턴값을 false로 주면 데이터 전송이 안되고 true를 줘야 전송됨
		} */
	
	
		/* 방법 2, type = "submit", type = "button"인 경우*/
		if(!f.memno.value){//JavaScript "" '' 둘다 문자열 취급
			alert("회원번호를 입력해주세요");//알림창
			return f.memno.focus();//false로 주면 데이터 전송이 안됨
		}
		if(f.name.value == ""){//JavaScript "" '' 둘다 문자열 취급
			alert("회원이름을 입력해주세요");//알림창
			return f.name.focus();//false로 주면 데이터 전송이 안됨
		}
		if(f.address.value == ""){//JavaScript "" '' 둘다 문자열 취급
			alert("주소를 입력해주세요");//알림창
			return f.address.focus();//false로 주면 데이터 전송이 안됨
		}
		if(f.gender[0].checked == false && f.gender[1].checked){//JavaScript "" '' 둘다 문자열 취급
			alert("성별을 입력해주세요");//알림창
			//f.gender.focus();
			return false;//false로 주면 데이터 전송이 안됨
		}
		if(f.tel1.value == ""){
			alert("전화번호를 입력해주세요");
			return f.tel1.focus();
		}
		if(f.tel2.value == ""){
			alert("전화번호를 입력해주세요");
			return f.tel2.focus();//false로 주면 데이터 전송이 안됨
		}
		if(f.tel3.value == ""){
			alert("전화번호를 입력해주세요");
			return f.tel3.focus();
		}
		f.submit();
		//return true;//type = "submit" 또는 "reset"인 경우 true값을 리턴하면 데이터 전송됨
		//즉, 리턴값을 false로 주면 데이터 전송이 안되고 true를 줘야 전송됨
	}//check()끝
	
	function reWrite() {
		var x = confirm("다시 작성 하시겠습니까?");
		if(x == true) {
			f.reset();
			f.name.select();
		}
		//f.name.focus();
		
		//f.reset();
		//f.name.focus();//글자는 그대로 있고 커서가 깜빡거림
		//f.name.select();//글자에 블럭이 설정되어 입력하면 바로 덮어씌워짐
	}