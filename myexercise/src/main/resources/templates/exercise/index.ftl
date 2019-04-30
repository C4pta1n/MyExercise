<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="icon" href="images/favicon.ico">
    <title>MyExercise</title>
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
</head>
<body>
<div class="main-layout" id='main-layout'>
    <!--侧边栏-->
    <div class="main-layout-side">
        <div class="m-logo">
        </div>
        <ul class="layui-nav layui-nav-tree" lay-filter="leftNav">
            <li class="layui-nav-item">
                <a href="javascript:;" data-url="/myexercise/plan" data-id='1' data-text="训练计划"><i class="iconfont">&#xe63c;</i>训练计划</a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;" data-url="/myexercise/exerciserecord" data-id='2' data-text="运动记录"><i class="iconfont">&#xe60c;</i>运动记录</a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;" data-url="/myexercise/history" data-id='3' data-text="运动历史" lay-filter="hist"><i class="iconfont">&#xe60a;</i>运动历史</a>
            </li>
            <#--<li class="layui-nav-item layui-nav-item">-->
                <#--<a href="javascript:;"><i class="iconfont">&#xe607;</i>后台管理</a>-->
                <#--<dl class="layui-nav-child">-->
                    <#--<dd><a href="javascript:;" data-url="menu1.html" data-id='6' data-text="后台菜单"><span class="l-line"></span>后台菜单</a></dd>-->
                    <#--<dd><a href="javascript:;" data-url="menu2.html" data-id='7' data-text="前台菜单"><span class="l-line"></span>前台菜单</a></dd>-->
                <#--</dl>-->
            <#--</li>-->
        </ul>
    </div>
    <!--右侧内容-->
    <div class="main-layout-container">
        <!--头部-->
        <div class="main-layout-header">
            <div class="menu-btn" id="hideBtn">
                <a href="javascript:;">
                    <span class="iconfont">&#xe649;</span>
                </a>
            </div>
            <ul class="layui-nav" lay-filter="rightNav">
                <li class="layui-nav-item">
                    <a href="javascript:;"><img src="${iconPath!}" class="layui-nav-img" style="border-radius: 90px 90px;height: 90px;width: 90px;padding-top: 5px"></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-url="/myexercise/userinfo" data-id='4' data-text="个人信息">个人信息</a></dd>
                        <dd><a href="javascript:;" data-url="/myexercise/changepsw" data-id='5' data-text="修改密码">修改密码</a></dd>
                        <dd><a href="/myexercise/signout">退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
        <!--主体内容-->
        <div class="main-layout-body">
            <!--tab 切换-->
            <div class="layui-tab layui-tab-brief main-layout-tab" lay-filter="tab" lay-allowClose="true">
                <ul class="layui-tab-title">
                    <li class="layui-this welcome">MyExercise+</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show" style="background: #f5f5f5;">
                        <!--1-->
                        <iframe src="/myexercise/welcome" width="100%" height="100%" name="iframe" scrolling="auto" class="iframe" framborder="0"></iframe>
                        <!--1end-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--遮罩-->
    <div class="main-mask">

    </div>
</div>
<#--<script type="text/javascript">-->
    <#--var scope={-->
        <#--link:''-->
    <#--}-->
<#--</script>-->
<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="js/common.js" type="text/javascript" charset="utf-8"></script>
<script src="js/main.js" type="text/javascript" charset="utf-8"></script>

</body>
</html>
