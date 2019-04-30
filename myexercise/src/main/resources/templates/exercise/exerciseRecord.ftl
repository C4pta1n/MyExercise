<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>运动记录</title>
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    <link href="https://cdn.bootcss.com/flatpickr/4.5.7/flatpickr.min.css" rel="stylesheet">
    <link rel="stylesheet" href="ImgCropping/css/cropper.min.css">
    <link rel="stylesheet" href="ImgCropping/css/ImgCropping.css">
    <script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/flatpickr/4.5.7/flatpickr.min.js"></script>
</head>
<body>
<div class="layui-tab layui-tab-brief">
    <ul class="layui-tab-title">
        <li class="layui-this">我的运动记录</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <form class="layui-form" lay-filter="info" style="width: 90%;padding-top: 20px;">
                <div class="layui-form-item">
                    <label class="layui-form-label">运动日期：</label>
                    <div class="layui-input-block">
                        <input type="text" name="date" lay-verify="required" class="layui-input" id="date"
                               placeholder="请选择运动日期">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">运动项目：</label>
                    <div class="layui-input-block">
                        <input type="text" name="event" required lay-verify="required" placeholder="请输入运动项目"
                               autocomplete="off" class="layui-input" value="">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">消耗卡路里：</label>
                    <div class="layui-input-block">
                        <input type="text" name="cout" required lay-verify="required|double" placeholder="百卡路里"
                               autocomplete="off" class="layui-input" value="">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">摄入食物：</label>
                    <div class="layui-input-block">
                        <input type="text" name="food" required lay-verify="required" placeholder="请输入今天摄入的食物"
                               autocomplete="off" class="layui-input" value="">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">摄入卡路里：</label>
                    <div class="layui-input-block">
                        <input type="text" name="cin" required lay-verify="required|double" placeholder="百卡路里"
                               autocomplete="off" class="layui-input" value="">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">运动时长：</label>
                    <div class="layui-input-block">
                        <input type="text" name="stime" required lay-verify="required|number" placeholder="MIN"
                               autocomplete="off" class="layui-input" value="">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">今日体重：</label>
                    <div class="layui-input-block">
                        <input type="text" name="weight" required lay-verify="required|double" placeholder="KG"
                               autocomplete="off" class="layui-input" value="">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">身高：</label>
                    <div class="layui-input-block">
                        <input type="text" name="height" required lay-verify="required|double" placeholder="CM"
                               autocomplete="off" class="layui-input" value="">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="ExerciseInfo">添加记录</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script>
    $("#date").flatpickr();

    layui.use(['form', 'element'], function () {
        var form = layui.form();
        var element = layui.element();
        form.render();

        form.verify({
            double: [/^(?=([0-9]{1,10}$|[0-9]{1,7}\.))(0|[1-9][0-9]*)(\.[0-9]{1,2})?$/, '只能输入不超过10位的数字，最多带有2位小数']
        });
        form.on('submit(ExerciseInfo)', function (data) {
            // layer.msg(JSON.stringify(data.field));
            // console.log(data.field);
            $.get("/myexercise/addERecord",data.field,function (res) {
                // console.log(res);
                if (res > 0) {
                    layer.msg('添加成功',{
                        icon: 1,
                        time: 1500,
                    },function () {
                        window.location.reload();
                    });
                }
            });
            return false;
        });
    });
</script>
</body>
</html>