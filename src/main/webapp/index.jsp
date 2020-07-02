<%--
  Created by IntelliJ IDEA.
  User: Li
  Date: 2020/6/30
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <%
        /*定义项目路径，为以后引用静态资源备用*/
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link href="${APP_PATH}/static/fj.ico" rel="shortcut icon" type="image/x-icon"/>
    <jsp:include page="WEB-INF/view/config.jsp"></jsp:include>
    <style type="text/css">
        .container{
            width:100%
        }
        #container{
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            margin: auto;
        }
        form{
            margin-left: 26%;
            margin-top: 2%;
        }
    </style>
</head>
<body  style="background:#3CA993;">
<div class="container" id="container">
    <div class="row  col-lg-12 ">
        <div id="middle">
            <form class="form-horizontal" action="${APP_PATH}/logins" method="post">
                <div class="form-group">
                    <label class="col-sm-1"></label>
                    <img class="col-sm-9" style="width:500px;margin-left:3%" src="${APP_PATH}/static/log.png">
                </div>
                <div class="form-group">
                    <label class="col-sm-5 control-label" style="font-size: 30px;color: red">${requestScope.msg==null?"":requestScope.msg}</label>
                </div>
                <div class="form-group">
                    <label for="userName" class="col-sm-2 control-label">UserName</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="userName" value="${sessionScope.userName==null?"":sessionScope.userName}" style="width: 400px" onkeyup="rememberCheck(this.value)" id="userName" placeholder="UserName">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">Password</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control" name="userPassword" style="width: 400px" id="password"
                               placeholder="Password">
                    </div>
                </div>
                <div class="form-group">
                    <label for="code_input" class="col-sm-2 control-label">verify</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" style="width: 220px" id="code_input" placeholder="请输入验证码">
                    </div>
                    <div id="v_container" class="col-sm-2" style="width: 110px;height: 30px;"></div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2">
                        <div class="checkbox checkbox-inline col-sm-4">
                            <label>
                                <input type="checkbox" name="rememb" id="rememb">记住密码
                            </label>
                        </div>
                        <div class="checkbox checkbox-inline col-sm-5">
                            <label>
                                <input type="checkbox" name="autoSubmit" id="autoSubmit">自动登录
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div  class="col-sm-offset-2 col-sm-3" style="padding-left:10%">
                        <button type="submit" id="my_button" class="btn btn-default btn-block">Sign in</button><br>
                        <a href="${APP_PATH}/regin" style="color: #122b40" class="text-center">&nbsp; &nbsp;Create your account  </a>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
</body>
<script>
    $(function(){
        setTimeout("autoSubmit()",3000)
    })
    var verifyCode = new GVerify("v_container");
    document.getElementById("my_button").onclick = function () {
        var code_input=document.getElementById("code_input");
        var res = verifyCode.validate(code_input.value);
        if (!res) {
            alert("验证码错误!");
            code_input.value="";
            return false;
        }
    }

    /*用来做记住密码*/
    function rememberCheck(string){
        $("#rememb").attr("checked","");
        $("#autoSubmit").attr("checked","")
        $.ajax({
            type:"POST",
            url: "${APP_PATH}/getCookie",
            dataType:"json",
            data:{
                userName:string,
            },
            success:function(data){
                $("#userName").val(data.userName);
                $("#password").val(data.password);
                $("#rememb").attr("checked","checked");
            },
            error:function() {
                $("#userPassword").val("");
            }
        });
    };

    /*用来做自动登录*/
    function autoSubmit(){
        $.ajax({
            type:"POST",
            url: "${APP_PATH}/getAutoSubmit",
            dataType:"json",
            success:function(data){
                $("#userName").val(data.userName);
                $("#password").val(data.password);
                $("#rememb").attr("checked","checked");
                $("#autoSubmit").attr("checked","checked");
                $("#code_input").html("");
                $("#v_container").html("");
                $("form").submit();
            },
            error:function() {
                return false;
            }
        });
    };
</script>
</html>
