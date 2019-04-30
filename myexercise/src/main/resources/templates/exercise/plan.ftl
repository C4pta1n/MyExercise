<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css"/>
    <link href="https://cdn.bootcss.com/flatpickr/4.5.7/flatpickr.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/flatpickr/4.5.7/flatpickr.min.js"></script>
</head>
<body>
<div>
    <div id="targ" style="width: 70%;margin: 50px auto">
        <div style="width: 80%;text-align: center">
            <table class="layui-table" lay-even="" lay-skin="nob">
                <colgroup>
                    <col width="40%">
                    <col width="60%">
                </colgroup>
                <tbody>
                <tr>
                    <td>锻炼计划</td>
                    <td align="left"><span id="plan0">${plan.planContent!}</span></td>
                </tr>
                <tr>
                    <td>开始时间</td>
                    <td align="left"><span id="start0">${(plan.start?string('yyyy-mm-dd'))!}</span></td>
                </tr>
                <tr>
                    <td>结束时间</td>
                    <td align="left"><span id="end0">${(plan.end?string('yyyy-mm-dd'))!}</span></td>
                </tr>
            </table>
        </div>
        <div style="text-align:left">
            <button id="setTarg" class="layui-btn layui-btn-normal">设计计划</button>
        </div>
    </div>


</div>
</body>
<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script>
    $().ready(function () {
        $("#setTarg").click(function () {
            layui.use('layer', function(){

                var layer = layui.layer;

                var div = "<div class=\"layui-form-item\">\n" +
                    "                    <label class=\"layui-form-label\">锻炼计划：</label>\n" +
                    "                    <div class=\"layui-input-block\">\n" +
                    "                        <input type=\"text\" id=\"plan\" name=\"name\" required lay-verify=\"required|name\" placeholder=\"请输入计划内容\"\n" +
                    "                               autocomplete=\"off\" class=\"layui-input\" value=\"\">\n" +
                    "                    </div>\n" +
                    "                </div>" +
                    "<div class=\"layui-form-item\">\n" +
                    "                    <label class=\"layui-form-label\">开始时间：</label>\n" +
                    "                    <div class=\"layui-input-block\">\n" +
                    "                        <input type=\"text\" name=\"birth\" lay-verify=\"required\" class=\"layui-input\" id=\"start\"\n" +
                    "                               placeholder=\"请选择开始日期\" autocomplete=\"off\">\n" +
                    "                    </div>\n" +
                    "                </div>" +
                    "<div class=\"layui-form-item\">\n" +
                    "                    <label class=\"layui-form-label\">结束时间：</label>\n" +
                    "                    <div class=\"layui-input-block\">\n" +
                    "                        <input type=\"text\" name=\"birth\" lay-verify=\"required\" class=\"layui-input\" id=\"end\"\n" +
                    "                               placeholder=\"请选择结束日期\" autocomplete=\"off\">\n" +
                    "                    </div>\n" +
                    "                </div>";
                layer.open({
                    success: function(layero, index){
                        $("#start").flatpickr();
                        $("#end").flatpickr();
                        console.log(layero, index);
                    },
                    type: 0,
                    title: "我的计划",
                    content: div,
                    area: 'auto',
                    zIndex: 0,
                    btnAlign: 'c',
                    closeBtn: 2,
                    resize: false,
                    scrollbar: false,
                    yes: function (index, layero) {
                        // console.log($("#start").val()+$("#end").val()+$("#plan").val());
                        $.get("/myexercise/addPlan",{planContent:$("#plan").val(),start:$("#start").val(),end:$("#end").val()},function (res) {
                            console.log(res);
                            if (res >0) {
                                $("#start0").text($("#start").val());
                                $("#end0").text($("#end").val());
                                $("#plan0").text($("#plan").val());
                                layer.msg("添加成功");
                            }else {
                                layer.msg("系统繁忙");
                            }
                        })
                        layer.close(index);
                    }
                });
            });
        });
    });


</script>
</body>
</html>