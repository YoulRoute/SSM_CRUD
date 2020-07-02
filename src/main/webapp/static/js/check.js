$(
    function(){
        $("#userName").blur(
            function(){
                checkUser();
            }
        )
    }
)
$(
    function(){
        $("#userPassword").blur(
            function(){
                checkUser();
            }
        )
    }
)

$(
    function(){
        $("#userPhone").blur(
            function(){
                checkUser();
            }
        )
    }
)

function checkUser(){
    var result = document.getElementById("userName").value;
    var password = document.getElementById("userPassword").value;
    var phone = document.getElementById("userPhone").value;
    var email =document.getElementById("userEmail").value;
    var nu= /^(?=.*[a-zA-Z])(?=.*\d)[^]{8,16}$/;
    var reg=/^[1-9]+[0-9]*$/;
    var phoneVi=/^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;

    var emailVi=/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;

    $("#DivAcn").html("");
    $("#DivPwd").html("");
    $("#DivPhone").html("");
    $("#DivEmail").html("");
    if(result == "" ){
        $("#DivAcn").html("�˺Ų���Ϊ�գ�");
        return false;
    }
    if(!reg.test(result)){
        $("#DivAcn").html("�˺���ҪΪ10λ�����֣�");
        return false;
    }
    if (result.length!=10) {
        $("#DivAcn").html("�˺���ҪΪ10λ�����֣�");
        return false;
    }
    if(password == "" ){
        $("#DivPwd").html("���벻��Ϊ�գ�");
        return false;
    }
    if(!nu.test(password))
    {
        $("#DivPwd").html("������Ҫ����ĸ��������ɣ�");
        return false;
    }
    if(email == "" ){
        $("#DivEmail").html("���䲻��Ϊ��");
        return false;
    }
    if(!emailVi.test(email))
    {
        $("#DivEmail").html("������Ϸ����䣡");
        return false;
    }
    if(phone == "" ){
        $("#DivPhone").html("�ֻ����벻��Ϊ�գ�");
        return false;
    }
    if(!phoneVi.test(phone)){
        $("#DivPhone").html("������Ϸ����ֻ����룡");
        return false;
    }else{
        return true;
    }
}
