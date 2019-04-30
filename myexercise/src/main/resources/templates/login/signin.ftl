<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <link rel="icon" href="images/favicon.ico">
    <title>MyExercise登录</title>
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.min.js"></script>
</head>

<body>
<div class="m-login-bg">
    <div class="m-login">
        <h3>My Exercise + </h3>
        <h3>登录</h3>
        <div class="m-login-warp">
            <form class="layui-form">
                <div class="layui-form-item">
                    <input type="text" name="username" required lay-verify="required" placeholder="用户名"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <input type="password" name="password" required lay-verify="required" placeholder="密码"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <input type="text" name="verify" required lay-verify="required" placeholder="验证码"
                               autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-inline">
                        <img class="verifyImg" onclick="this.src=this.src+'?c='+Math.random();"
                             src="/myexercise/kaptcha/render"/>
                    </div>
                </div>
                <div class="layui-form-item m-login-btn">
                    <div class="layui-inline">
                        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="login">登录
                        </button>
                    </div>
                    <div class="layui-inline">
                        <a href="/myexercise/signup" class="layui-btn layui-btn-warm" style="width: 100%">注册</a>
                    </div>
                </div>
            </form>
        </div>
        <p class="copyright">Copyright 2019 by C4pta1n</p>
    </div>
</div>
<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form(),
            layer = layui.layer;


        //自定义验证规则
        // form.verify({
        // 	// username: [/^[a-zA-Z0-9_-]{6,10}$/,'用户名必须是6到10位，可以为：大小写字母，数字，下划线，减号'],
        // 	// password: [/(.+){6,18}$/, '密码必须6到18位'],
        //
        // });


        //监听提交
        form.on('submit(login)', function (data) {
            // console.log(data.elem);
            // console.log(data.form);
            // console.log(data.field);
            var code = $("input[name='verify']").val();
            $.post("/myexercise/kaptcha/validTime", {code: code}, function (res) {
                if (res != 200) {
                    layer.msg(res, {
                        icon: 5,
                        anim: 6,
                        time: 1500,
                    }, function () {
                        $(".verifyImg").click();
                    });
                } else {
                    $.post("/myexercise/ifSignin", data.field, function (res) {
                        if (res == 100) {
                            window.location.href = "/myexercise/index";
                        } else if (res == 101) {
                            layer.msg('用户名或密码错误', {
                                icon: 5,
                                anim: 6,
                                time: 1500,
                            }, function () {
                                $(".verifyImg").click();
                            });
                        } else {
                            layer.msg('服务器异常！', {
                                icon: 5,
                                time: 1500,
                            }, function () {
                                $(".verifyImg").click();
                            });
                        }
                    });
                }
            });
            return false;
        });
    });
</script>
</body>

</html>