<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>Welcome</title>
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    <script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
<div class="wrap-container welcome-container">
    <div class="row">
        <div class="welcome-left-container col-lg-9">
            <div class="data-show">
                <ul class="clearfix">
                    <li class="col-sm-12 col-md-4 col-xs-12">
                        <a href="javascript:;" class="clearfix">
                            <div class="icon-bg bg-org f-l">
                                <span class="iconfont">&#xe605;</span>
                            </div>
                            <div class="right-text-con">
                                <p class="name">打卡天数</p>
                                <p><span class="color-org">${sumd!}</span>天&nbsp;<span class="iconfont">&#xe62e;</span>
                                </p>
                            </div>
                        </a>
                    </li>
                    <li class="col-sm-12 col-md-4 col-xs-12">
                        <a href="javascript:;" class="clearfix">
                            <div class="icon-bg bg-blue f-l">
                                <span class="iconfont">&#xe609;</span>
                            </div>
                            <div class="right-text-con">
                                <p class="name">消耗</p>
                                <p><span class="color-blue">${sumo!}</span>千卡<span class="iconfont">&#xe628;</span></p>
                            </div>
                        </a>
                    </li>
                    <li class="col-sm-12 col-md-4 col-xs-12">
                        <a href="javascript:;" class="clearfix">
                            <div class="icon-bg bg-green f-l">
                                <span class="iconfont">&#xe60a;</span>
                            </div>
                            <div class="right-text-con">
                                <p class="name">运动时长</p>
                                <p><span class="color-green">${sumt!}</span>分钟<span class="iconfont">&#xe60e;</span></p>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
            <!--图表-->
            <div class="chart-panel panel panel-default">
                <div class="panel-body" id="chart" style="height: 376px;">
                </div>
            </div>
            <div class="chart-panel panel panel-default">
                <div class="panel-body" id="chart" style="">
                    <div style="margin-bottom: 20px;">
                        <p style="color: rgb(85, 85, 85);font-size: 18px;">历史</p>
                    </div>
                    <div style="margin-left: 30px;">
                        <ul class="layui-timeline">
                            <#list historys as p>
                                <li class="layui-timeline-item">
                                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                                    <div class="layui-timeline-content layui-text">
                                        <h3 class="layui-timeline-title" style="color:#9999FF;">${p.date?string('yyy-MM-dd')}</h3>
                                        <p>
                                            运动项目：${p.event!}
                                            <br>运动时长：${p.stime!}Min
                                            <br>运动消耗：${p.cout!}百卡路里
                                            <br>摄入能量：${p.cin!}百卡路里
                                        </p>
                                    </div>
                                </li>
                            </#list>

                            <li class="layui-timeline-item">
                                <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                                <div class="layui-timeline-content layui-text">
                                    <div class="layui-timeline-title">
                                        <button id="goHist"
                                                class="layui-btn layui-btn-sm layui-btn-radius layui-btn-warm">
                                            点击运动历史可查看更多
                                        </button>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="chart-panel panel panel-default">
                <div class="panel-body" style="height: 280px;">
                    <div style="margin-bottom: 20px;">
                        <p style="color: rgb(85, 85, 85);font-size: 18px;">您的BMI指数(kg/M&sup2) : <strong><span
                                        style="color: #66CCCC;">${(historys[0].weight/historys[0].height/historys[0].height*10000)!'请先完善资料'}</span></strong></p>
                    </div>
                    <div style="margin: 10px auto;width: 50%;">
                        <table width="100%">
                            <tr style="height: 35px;">
                                <td bgcolor="#CCFFFF" align="center">极度偏瘦</td>
                                <td bgcolor="#CCFFFF" align="center">15 ~ 16</td>
                            </tr>
                            <tr style="height: 35px;">
                                <td bgcolor="#9999CC" align="center">偏瘦</td>
                                <td bgcolor="#9999CC" align="center">16 ~ 18.5</td>
                            </tr>
                            <tr style="height: 35px;">
                                <td bgcolor="#33FF99" align="center">理想体重</td>
                                <td bgcolor="#33FF99" align="center">18.5 ~ 25</td>
                            </tr>
                            <tr style="height: 35px;">
                                <td bgcolor="#CCCC99" align="center">超重</td>
                                <td bgcolor="#CCCC99" align="center">25 ~ 30</td>
                            </tr>
                            <tr style="height: 35px;">
                                <td bgcolor="#CC9933" align="center">中度超重</td>
                                <td bgcolor="#CC9933" align="center">30 ~ 35</td>
                            </tr>
                            <tr style="height: 35px;">
                                <td bgcolor="#CC3300" align="center">严重超重</td>
                                <td bgcolor="#CC3300" align="center">35 ~ 40</td>
                            </tr>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="js/echarts/echarts.js"></script>
<script type="text/javascript">
    // $("#goHist").click(function () {
    //     // $(window.parent.document).find("#hist").click();
    //     // console.log($("#hist", window.parent.document));
    //     layui.use('element',function () {
    //         var element = layui.element();
    //         element.tabChange('hist', '3');
    //     })
    // });
    layui.use(['layer', 'jquery'], function () {
        var layer = layui.layer;
        var $ = layui.jquery;

        var arr = [];
        var arr1 = [];
        var arr2 = [];
        <#list historys?sort_by("date") as p>
            arr.push("${p.date?string('yy/MM/dd')}");
            arr1.push("${p.weight!}");
            arr2.push("${p.cin!}");
        </#list>


        //图表
        var myChart;
        var bmiChart
        require.config({
            paths: {
                echarts: 'js/echarts'
            }
        });
        require(
            [
                'echarts',
                'echarts/chart/bar',
                'echarts/chart/line',
                'echarts/chart/map'
            ],
            function (ec) {
                //mychart
                myChart = ec.init(document.getElementById('chart'));
                myChart.setOption(
                    {
                        title: {
                            text: "本周报告",
                            textStyle: {
                                color: "rgb(85, 85, 85)",
                                fontSize: 18,
                                fontStyle: "normal",
                                fontWeight: "normal"
                            }
                        },
                        tooltip: {
                            trigger: "axis"
                        },
                        legend: {
                            data: ["体重（Kg）", "摄入量（百卡路里）"],
                            selectedMode: false,
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                dataView: {
                                    show: false,
                                    readOnly: true
                                },
                                magicType: {
                                    show: true,
                                    type: ["line", "bar"]
                                },
                                restore: {
                                    show: true
                                },
                                saveAsImage: {
                                    show: false
                                },
                                mark: {
                                    show: false
                                }
                            }
                        },
                        calculable: false,
                        xAxis: [
                            {
                                type: "category",
                                boundaryGap: false,
                                <#--data: ["${historys[6].date?string('yy/MM/dd')}",-->
                                    <#--"${historys[5].date?string('yy/MM/dd')}",-->
                                    <#--"${historys[4].date?string('yy/MM/dd')}",-->
                                    <#--"${historys[3].date?string('yy/MM/dd')}",-->
                                    <#--"${historys[2].date?string('yy/MM/dd')}",-->
                                    <#--"${historys[1].date?string('yy/MM/dd')}",-->
                                    <#--"${historys[0].date?string('yy/MM/dd')}"]-->
                                data: arr,
                            }
                        ],
                        yAxis: [
                            {
                                type: "value"
                            }
                        ],
                        grid: {
                            x2: 30,
                            x: 50
                        },
                        series: [
                            {
                                name: "体重（Kg）",
                                type: "line",
                                smooth: true,
                                itemStyle: {
                                    normal: {
                                        areaStyle: {
                                            type: "default"
                                        }
                                    }
                                },
                                <#--data: [${historys[6].weight}, ${historys[5].weight}, ${historys[4].weight}, ${historys[3].weight}, ${historys[2].weight}, ${historys[1].weight}, ${historys[0].weight}]-->
                                data: arr1,
                            },
                            {
                                name: "摄入量（百卡路里）",
                                type: "line",
                                smooth: true,
                                itemStyle: {
                                    normal: {
                                        areaStyle: {
                                            type: "default"
                                        }
                                    }
                                },
                                <#--data: [${historys[6].cin}, ${historys[5].cin}, ${historys[4].cin},${historys[3].cin}, ${historys[2].cin}, ${historys[1].cin},${historys[0].cin}]-->
                                data: arr2,
                            },
                        ]
                    }
                );
            }
        );
        $(window).resize(function () {
            myChart.resize();
        })
    });
</script>
</body>
</html>
