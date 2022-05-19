function checkValue(){
    if(!document.deleteform.password.value){
        alert("비밀번호를 입력하지 않았습니다.");
        return false;
    }
}