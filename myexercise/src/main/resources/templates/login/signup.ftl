<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="icon" href="images/favicon.ico">
    <title>MyExercise注册</title>
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="css/signup.css">
    <script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.min.js"></script>
</head>

<body>
<div class="m-login-bg">
    <div class="m-login">
        <h3>My Exercise + </h3>
        <h3>注册 </h3>
        <div class="m-login-warp">
            <form class="layui-form">
                <div class="layui-form-item">
                    <input type="text" name="username" required lay-verify="required|username" placeholder="请输入一个用户名" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <input type="password" id="password" name="password" required lay-verify="required|password" placeholder="请创建您的密码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <input type="password" required lay-verify="required|cpassword" placeholder="请确认您的密码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <input type="text" name="tel"  lay-verify="phone" placeholder="手机号码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <input type="text" name="email"  lay-verify="email" placeholder="邮箱" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-inline" style="width: 145px;margin-right: -15px;">
                        <input type="checkbox" title="我已阅读并同意" lay-skin="primary" lay-verfy="required" lay-filter="agree">
                    </div>
                    <div class="layui-form-mid layui-word-aux"><span id="agreement">《用户注册协议》</span></div>
                </div>
                <div class="layui-form-item m-login-btn">
                    <div class="layui-inline">
                        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="signup">注册</button>
                    </div>
                    <div class="layui-inline">
                        <a href="/myexercise/signin" class="layui-btn layui-btn-warm" style="width: 100%">返回登录</a>
                    </div>
                </div>
            </form>
        </div>
        <p class="copyright">Copyright 2019 by C4pta1n</p>
    </div>
</div>
<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script>
    $().ready(function(){
        //获取协议
        $("#agreement").click(function () {
            $.get('/myexercise/getLastAgreement', function(res){
                layer.open({
                    type: 0,
                    content: res.content,
                    area: ['50%', '80%'],
                    btnAlign: 'c',
                    closeBtn: 2,
                    resize: false,
                    scrollbar: false
                });
            });
        });
    });
    layui.use(['form', 'layedit', 'laydate'], function() {
        var form = layui.form(),
            layer = layui.layer;


        //自定义验证规则
        form.verify({
            username: [/^[a-zA-Z0-9_-]{6,10}$/,'用户名必须是6到10位，可以为：大小写字母，数字，下划线，减号'],
            password: [/(.+){6,18}$/, '密码必须6到18位'],
            cpassword: function (value, item) {
                if (value != $("#password").val()) {
                    return '输入的两个密码不一致';
                }
            }
        });

        //判断是否同意协议
        var ifAgree = false;
        form.on('checkbox(agree)',function (data1) {
            // console.log(data1.elem.checked);
            ifAgree = data1.elem.checked;
        });

        //监听提交
        form.on('submit(signup)', function(data) {
            // console.log(data.elem);
            // console.log(data.form);
            // console.log(data.field);
            if (ifAgree) {
                //commit
                $.post("/myexercise/doSignup",data.field,function (res) {
                    if (res == 100) {
                        layer.msg('注册成功，正在为您登录',{
                            icon: 1,
                            time: 1500,
                            },function () {
                                window.location.href = "/myexercise/index";
                        });
                    } else if (res == 101) {
                        layer.msg('该用户名已存在',{
                            icon: 5,
                            anim: 6,
                            time: 1500,
                        });
                    } else if (res == 102) {
                        layer.msg('该手机号码已被注册',{
                            icon: 5,
                            anim: 6,
                            time: 1500,
                        });
                    } else if (res == 103) {
                        layer.msg('该邮箱已被注册',{
                            icon: 5,
                            anim: 6,
                            time: 1500,
                        });
                    } else if (res == 104) {
                        layer.msg('系统繁忙，请稍后重试',{
                            icon: 5,
                            anim: 6,
                            time: 1500,
                        });
                    } else {
                        layer.msg('服务器异常！',{
                            icon: 5,
                            anim: 6,
                            time: 1500,
                        });
                    }
                });
                return false;
            }else {
                layer.msg('请同意注册协议后再操作！');
            }
        });
    });
</script>
</body>

</html>