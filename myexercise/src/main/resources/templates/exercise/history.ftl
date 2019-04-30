<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>历史</title>
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css"/>
    <script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
<table class="table layui-table" id="table" style="width: 80%;margin: 50px">
    <colgroup>
        <col class="hidden-xs" width="50">
        <col class="hidden-xs" width="50">
        <col class="hidden-xs" width="50">
        <col class="hidden-xs" width="50">
        <col class="hidden-xs" width="50">
        <col class="hidden-xs" width="50">
        <col class="hidden-xs" width="50">
        <col class="hidden-xs" width="50">
    </colgroup>
    <thead>
    <tr>
        <th class="hidden-xs" style="text-align: center;">日期</th>
        <th class="hidden-xs" style="text-align: center;">运动项目</th>
        <th class="hidden-xs" style="text-align: center;">消耗卡路里</th>
        <th class="hidden-xs" style="text-align: center;">摄入食物</th>
        <th class="hidden-xs" style="text-align: center;">摄入卡路里</th>
        <th class="hidden-xs" style="text-align: center;">运动时长（MIN）</th>
        <th class="hidden-xs" style="text-align: center;">体重(KG)</th>
        <th class="hidden-xs" style="text-align: center;">身高(CM)</th>
    </tr>
    </thead>
    <tbody id="tbd" style="text-align: center;"></tbody>
</table>
<div id="pagination" style="text-align: center;"></div>
<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script>
    layui.use(['laypage', 'layer'], function () {
        var laypage = layui.laypage
            , layer = layui.layer;

        laypage({
            cont: 'pagination'
            , pages: ${page} //总页数
            , groups: 5 //连续显示分页数
            , jump: function (obj, first) {
                var currentPage = obj.curr;
                $.get("/myexercise/getExerciseList", {currentPage: currentPage}, function (res) {
                    var str = "";
                    for (var i = 0; i < res.length; i++) {
                        str += "<tr><td>" + res[i].date + "</td>" +
                            "<td>" + res[i].event + "</td>" +
                            "<td>" + res[i].cout + "</td>" +
                            "<td>" + res[i].food + "</td>" +
                            "<td>" + res[i].cin + "</td>" +
                            "<td>" + res[i].stime + "</td>" +
                            "<td>" + res[i].weight + "</td>" +
                            "<td>" + res[i].height + "</td><tr>"
                    }
                    $("#tbd").html(str);

                })

            }
        });
    });
</script>
</body>
</html>