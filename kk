<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
</head>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style>
    #errmsg{
        color: red;
        font-size: 16px;
    }
    #liu{
        width: 350px;
        height: 400px;
        margin: 100px auto;
        font-size: 20px;
        text-align: center;
    }
</style>
<body>
<div id="liu">
    <b id="errmsg"></b><br>
    <span>账号：</span><input type="text" id="name" name="name" placeholder="请输入自定义的账号"><br>
    <span>密码：</span><input type="password" id="pwd" name="pwd" placeholder="请输入密码"><br>
    <input onclick="zhuCe()" type="button" value="注册">
</div>
<script>
    //获取提示错误信息的标签
    var err = document.getElementById("errmsg");
    function zhuCe() {
    //获取账户密码的值
        var count = document.getElementById("name").value;
        var password = document.getElementById("pwd").value;
        //判断name是否为空
        if (count.length<3) {
            alert("账号不能为空且最低3个字符！！")
            return;
        }
        if (password.length!=6) {
            alert("密码不能为空且只能是6位字符！！")
            return;
        }

        //使用axios像后端接口请求数据
        axios({
            method:'post',
            url:'http://localhost:8080${pageContext.request.contextPath}/register',
            params:{
                name:count,
                pwd:password
            }
        }).then(function (rs) {
            //得到json数据
            var data = rs.data;
            //判断封装的状态码
            if(data.code!='200'){
                err.innerText=data.msg;
                return;
            }
            //状态码为200时
            alert(data.msg);
            //跳转到登陆页面
            location.href='http://localhost:8080${pageContext.request.contextPath}/login'
            return;
        });
    }
</script>
</body>
</html>
