<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>修改密码</title>
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    <script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
<div class="layui-tab layui-tab-brief">
    <ul class="layui-tab-title">
        <li class="layui-this">修改密码</li>
    </ul>
    <div class="layui-tab-item layui-show">
        <form class="layui-form" v style="width: 90%;padding-top: 20px;">
            <div class="layui-form-item">
                <label class="layui-form-label">旧密码：</label>
                <div class="layui-input-block">
                    <input type="password" name="passwordold" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">新密码：</label>
                <div class="layui-input-block">
                    <input type="password" id="password" name="password" required lay-verify="required|password" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">重复密码：</label>
                <div class="layui-input-block">
                    <input type="password" name="" required lay-verify="required|cpassword" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn layui-btn-normal" lay-submit lay-filter="adminPassword">立即提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
<#--<script src="js/laydate/laydate.js"></script>-->
<script>
    layui.use(['form','element'], function(){
        var form = layui.form();
        var element = layui.element();
        form.render();

        form.verify({
            password: [/(.+){6,18}$/, '密码必须6到18位'],
            cpassword: function (value, item) {
                if (value != $("#password").val()) {
                    return '输入的两个密码不一致';
                }
            }
        });
        //监听密码提交
        form.on('submit(adminPassword)', function(data){
            // layer.msg(JSON.stringify(data.field));
            $.post("/myexercise/doChangePSW",data.field,function (res) {
                if (res == 200) {
                    layer.msg('修改成功',{
                        icon: 1,
                        time: 1500,
                    },function () {
                        window.location.reload();
                    });
                }else if (res == 201) {
                    layer.msg('旧密码输入错误');
                }else if (res == 202) {
                    layer.msg('新密码不能与旧密码相同');
                }else if (res == 400) {
                    layer.msg('系统繁忙');
                }else {
                    layer.msg('服务器异常');
                }
            });
            return false;
        });
    });
</script>
</body>
</html>