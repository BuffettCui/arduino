<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-L-admin1.0</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="../css/font.css">
        <link rel="stylesheet" href="../css/xadmin.css">
        <script src="../js/jquery.min.js"></script>
        <script src="../js/echarts.min.js"></script>
    </head>
    <body>
    <div class="x-body layui-anim layui-anim-up">
        <blockquote class="layui-elem-quote">欢迎管理员：
            <span class="x-red">阿崔<input type="button" onclick="fresh()"></span>！<div id="times"></div></blockquote>
        <fieldset class="layui-elem-field">
            <legend>数据统计</legend>
            <div class="layui-field-box">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body">
                            <div class="layui-carousel x-admin-carousel x-admin-backlog" lay-anim="" lay-indicator="inside" lay-arrow="none" style="width: 100%; height: 400px;">
                                <div carousel-item="">
                                    <ul class="layui-row layui-col-space10 layui-this">
                                        <li class="layui-col-xs2">
                                                <div id="main" style="height: 400px;width:900px"></div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>系统通知</legend>
            <div class="layui-field-box">
                <table class="layui-table" lay-skin="line">
                    <tbody>
                        <tr>
                            <td >
                                <a class="x-a" href="/" target="_blank">新版L-admin 2.0上线了</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </fieldset>

        <fieldset class="layui-elem-field">
            <legend>开发团队</legend>
            <div class="layui-field-box">
                <table class="layui-table">
                    <tbody>
                        <tr>
                            <th>版权所有</th>
                            <td>www.zzu.edu.cn
                        </tr>
                        <tr>
                            <th>开发者</th>
                            <td>201577丁瑞鹅</td></tr>
                    </tbody>
                </table>
            </div>
        </fieldset>
        <blockquote class="layui-elem-quote layui-quote-nm">感谢layui,百度Echarts,jquery,本系统由大崔提供技术支持。</blockquote>
    </div>
    </body>
</html>
<script type="text/javascript">
    //得到时间并写入div
    function getDate(){
        //获取当前时间
        var date = new Date();
        //格式化为本地时间格式
        var date1 = "当前时间："+date.toLocaleString();
        //获取div
        var div1 = document.getElementById("times");
        //将时间写入div
        div1.innerHTML = date1;
    }
    //使用定时器每秒向div写入当前时间
    setInterval("getDate()",1000);

    var myChart = echarts.init(document.getElementById('main'))
   var option = {
        title: {
            text: '大棚气温监控',
            subtext: '实时数据'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:['最高气温']
        },
        toolbox: {
            show: true,
            feature: {
                dataZoom: {
                    yAxisIndex: 'none'
                },
                dataView: {readOnly: false},
                magicType: {type: ['line', 'bar']},
                restore: {},
                saveAsImage: {}
            }
        },
        xAxis:  {
            type: 'category',
            boundaryGap: false,
            data: ['周一','周二','周三','周四','周五','周六','周日']
        },
        yAxis: {
            type: 'value',
            axisLabel: {
                formatter: '{value} °C'
            }
        },
        series: [
            {
                name:'气温',
                type:'line',
                data:[0, 0, 0, 0, 0, 0, 0],
                markPoint: {
                    data: [
                        {type: 'max', name: '最大值'},
                        {type: 'min', name: '最小值'}
                    ]
                },
                markLine: {
                    data: [
                        {type: 'average', name: '平均值'}
                    ]
                }
            }
        ]
    };
    myChart.setOption(option)

    function fresh() {
        $.ajax({
            url: "${pageContext.request.contextPath}/data/get",
            get: "get",
            dataType: "json",
            success: function (data) {
                console.log(data);
                var myChart = echarts.init(document.getElementById('main'))
                var option = {
                    title: {
                        text: '大棚气温监控',
                        subtext: '实时数据'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data:['最高气温']
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            dataZoom: {
                                yAxisIndex: 'none'
                            },
                            dataView: {readOnly: false},
                            magicType: {type: ['line', 'bar']},
                            restore: {},
                            saveAsImage: {}
                        }
                    },
                    xAxis:  {
                        type: 'category',
                        boundaryGap: false,
                        data: ['周一','周二','周三','周四','周五','周六',data[0].addTime]
                    },
                    yAxis: {
                        type: 'value',
                        axisLabel: {
                            formatter: '{value} °C'
                        }
                    },
                    series: [
                        {
                            name:'气温',
                            type:'line',
                            data:[data[6].temparture, data[5].temparture, data[4].temparture, data[3].temparture, data[2].temparture, data[1].temparture, data[0].temparture],
                            markPoint: {
                                data: [
                                    {type: 'max', name: '最大值'},
                                    {type: 'min', name: '最小值'}
                                ]
                            },
                            markLine: {
                                data: [
                                    {type: 'average', name: '平均值'}
                                ]
                            }
                        }
                    ]
                };
                myChart.setOption(option)
            }
        })
    }


</script>