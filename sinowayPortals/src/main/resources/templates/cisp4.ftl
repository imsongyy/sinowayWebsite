<!DOCTYPE html>
	<html lang="zxx" class="no-js">
    <head>
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon-->
        <link rel="shortcut icon" href="static/img/favicon.ico">
        <!-- Author Meta -->
        <meta name="author" content="colorlib">
        <!-- Meta Description -->
        <meta name="description" content="">
        <!-- Meta Keyword -->
        <meta name="keywords" content="">
        <!-- meta character set -->
        <meta charset="UTF-8">
        <!-- Site Title -->
        <title>CISP平台数据统计</title>

        <link rel="stylesheet" href="static/css/font-awesome.min.css">
        <link rel="stylesheet" href="static/css/bootstrap.css">
        <link rel="stylesheet" href="static/css/animate.css"/>
        <link rel="stylesheet" href="static/css/main.css">
        <link rel="stylesheet" href="static/css/style.css">
    </head>
    <body>
    <!-- Start banner Area -->
    <section class="generic-banner relative" style="background: url('static/img/bj-index2.jpg') no-repeat center;">
        <!-- Start Header Area -->
        <header class="default-header">
            <nav class="navbar navbar-expand-lg  navbar-light">
                <div class="container">
                    <a class="navbar-brand" href="index.html">
                        <img style="width: 80px;transform: scale(1.5);display: block" src="static/img/logo.png" alt="">
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="lnr lnr-menu"></span>
                    </button>

                    <div class="collapse navbar-collapse justify-content-end align-items-center" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li><a href="index#home">个人征信机构</a></li>
                            <li><a href="index#service">CISP平台服务</a></li>
                            <li><a href="index#feature">信息主体查询</a></li>
                            <li><a href="index#price">行业资讯</a></li>
                            <li><a href="index#faq">关于华道</a></li>
                            <li><a href="index#footer">联系我们</a></li>
                            <!-- Dropdown -->
                            <li class="dropdown">
                                <a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                                    会员服务
                                </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="login">登录会员</a>
                                    <a class="dropdown-item" href="register">注册会员</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <!-- End Header Area -->
        <div class="container">
            <div class="row height align-items-center justify-content-center">
                <div class="col-lg-10">

                </div>
            </div>
        </div>
    </section>
    <!-- End banner Area -->

    <!-- Start Generic Area -->
    <section class="about-generic-area section-gap">
        <div class="container border-top-generic">

            <div class="row" style="text-indent: 2em">
                <div class="col-md-8"></div>
                <div class="col-md-4 tab-bar">
                    <div class="col-md-12 tab-bar">
                        <a href="cisp1">平台概要<i class="fa fa-arrow-circle-right pr-10 colored"></i></a>
                        <a href="cisp2">平台特点<i class="fa fa-arrow-circle-right pr-10 colored"></i></a>
                        <a target=_blank href="static/CISPrules.pdf">平台章程<i class="fa fa-arrow-circle-right pr-10 colored"></i></a>
                        <a href="cisp4" class="tab-bar-show">数据统计<i class="fa fa-arrow-circle-right pr-10 colored"></i></a>
                        <a href="cisp5">DIGEST<i class="fa fa-arrow-circle-right pr-10 colored"></i></a>
                        <a href="cisp6">加入CISP<i class="fa fa-arrow-circle-right pr-10 colored"></i></a>
                    </div>
                </div>
                <div class="col-md-12">
                    <h3 class="about-title mb-30">CISP平台数据统计</h3>
                    <h4 style="margin-bottom: 12px;text-indent: 1em"><i class="fa fa-arrow-circle-right pr-10 colored"></i>CISP会员机构数和信息主体人数</h4>
                    <div class="echarts" id="main" style="width: 100%;margin: 0 auto"></div>
                    <h4 style="margin-bottom: 12px;text-indent: 1em"><i class="fa fa-arrow-circle-right pr-10 colored mt-30"></i>CIS平台查询情况统计</h4>
                    <div class="echarts" id="main2" style="width: 100%;margin: 0 auto"></div>
                </div>
            </div>
        </div>
    </section>
    <footer id="footer">
        <div class="footer section">
            <div class="container">
                <h2 class="text-center" id="contact">联系我们</h2>
                <div class="space"></div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="footer-content">
                            <form method="POST" role="form" id="questionForm" action="proposeQuestion">
                                <input type="hidden" name="type" value="1">
                                <div class="form-group has-feedback">
                                    <label class="sr-only" for="username">Name</label>
                                    <input type="text" name="username" id="username" class="form-control wow fadeInUp" placeholder="输入姓名"required/>
                                    <i class="fa fa-user form-control-feedback"></i>
                                </div>
                                <div class="form-group has-feedback">
                                    <label class="sr-only" for="email">Email address</label>
                                    <input type="text" name="email" id="email" class="form-control wow fadeInUp" placeholder="输入邮箱" required/>
                                    <i class="fa fa-envelope form-control-feedback"></i>
                                </div>
                                <div class="form-group has-feedback">
                                    <label class="sr-only" for="question">Message</label>
                                    <textarea name="question" rows="8" cols="20" id="question" class="form-control input-message wow fadeInUp"  placeholder="您的意见或建议" required></textarea>
                                    <i class="fa fa-pencil form-control-feedback"></i>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="footer-content">
                            <div class="widget-content">
                                <p>感谢您对北京华道征信的关注！我们期望与用户保持沟通和联系。如果您有任何想法和需求，欢迎与我们取得联系，我们会及时回复您。</p><br/>
                                <p class="contacts"><i class="fa fa-map-marker"></i> 北京市朝阳区通惠河畔产业园1131号君天大厦6002室 </p>
                                <p class="contacts"><i class="fa fa-phone"></i>  010-56081155&nbsp;&nbsp;&nbsp;&nbsp;4000034020（工作日9:00-17:30）</p>
                                <p class="contacts"><i class="fa fa-envelope"></i> service@sinowaycredit.com</p>
                            </div>
                            </aside>
                            <ul class="social-links">
                                <li style="position: relative">
                                    <input type="submit" id="questionSubmit" value="发送" class="btn btn-default" style="float: left">
                                    <div id="qq" target="_blank" href="#" style="width: 160px;float: left;position: relative;margin-left: 20px"><i class="fa fa-qq"></i><span style="font-size: 15px;padding-left: 10px">点击qq联系我们</span>
                                        <a style="position: absolute;display: block;width: 100%;height: 100%;top: 0;font-size: 14px;opacity: 0" class="qqWrap" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=3409228296&site=qq&menu=yes">
                                            <img id="chatByQQ" border="0" src="" alt="点击这里给我发消息" title="与华道征信客服部进行在线连接"/>
                                        </a>
                                    </div>

                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="subfooter">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <p class="text-center">版权所有 &copy; 2014.北京华道征信有限公司 京ICP备14051116号</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>


    </div>
    <script src="static/js/vendor/jquery-2.2.4.min.js"></script>
    <script src="static/js/vendor/bootstrap.min.js"></script>
    <script src="static/js/jquery.form.js"></script>
    <script src="static/js/comment.js"></script>
    <script  src="static/js/echarts.min.js"></script>
    <script>
        $(".qqWrap").hover(function(){
            $("#qq").addClass("animated tada");
        },function(){
            $("#qq").removeClass("animated tada");
        })

        var qrySituation = {
            checkRate : [],
            qryNum : [],
            timeframe : []
        };
        var memberAgency = {
            timeframe : [],
            members : [],
            recordNum : []
        }
        $.ajax({
            type : "POST",
            url : "qrySituation",
            async: false,
            dataType : "json",
            success : function(result){
                if(result.msg == "success"){
                    for(var i=0;i<result.data.length;i++){
                        qrySituation.checkRate.push(result.data[i].checkRate);
                        qrySituation.qryNum.push(result.data[i].qryNum);
                        qrySituation.timeframe.push(result.data[i].timeframe);
                    }
                }
            }
        })
        $.ajax({
            type : "POST",
            url : "memberAgency",
            async: false,
            dataType : "json",
            success : function(result){
                for(var i=0;i<result.data.length;i++){
                    memberAgency.members.push(result.data[i].members);
                    memberAgency.recordNum.push(result.data[i].recordNum);
                    memberAgency.timeframe.push(result.data[i].timeframe);
                }
            }
        })
        var myecharts = $(".echarts").width();
        $(".echarts").css({height:myecharts/2 + "px"});
        var myChart = echarts.init(document.getElementById('main'));
        option = {
            color: ['#0b97c8', '#842f8e'],
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            legend: {
                data: ['会员机构数(家)', '有信息记录的自然人数(万人)']
            },
            toolbox: {
                show: true,
                orient: 'vertical',
                left: 'right',
                top: 'center',
                feature: {
                    mark: {show: true},
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            xAxis: [
                {
                    type: 'category',
                    axisTick: {show: true},
                    data: memberAgency.timeframe,
                    axisLabel:{
                        interval:0,
                        rotate:45,
                        textStyle:{
                            color:"#222"
                        }
                    },
                }
            ],
            yAxis: [
                {
                    type: 'value',
                }
            ],
            series: [
                {
                    name: '会员机构数(家)',
                    type: 'bar',
                    barGap: 0,
                    data: memberAgency.members
                },
                {
                    name: '有信息记录的自然人数(万人)',
                    type: 'bar',
                    data: memberAgency.recordNum
                },
            ]
        };
        myChart.setOption(option);


        var myChart2 = echarts.init(document.getElementById('main2'));
        option2 = {
            color: ['#0b97c8','#842f8e'],
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            toolbox: {
                show: true,
                orient: 'vertical',
                left: 'right',
                top: 'center',
                feature: {
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            legend: {
                data:['累计查询件数','查得率']
            },
            xAxis: [
                {
                    type: 'category',
                    data: qrySituation.timeframe,
                    axisPointer: {
                        type: 'shadow'
                    },
                    axisLabel:{
                        interval:0,
                        rotate:45,
                        textStyle:{
                            color:"#222"
                        }
                    },
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: '查得率（%）',
                    position: 'left',
                    axisLabel: {
                        formatter: '{value} %'
                    }
                },
                {
                    type: 'value',
                    name: '累计查询件数（万件）',
                    position: 'right',
                    axisLabel: {
                        formatter: '{value} 万件'
                    }
                }
            ],
            series: [
                {
                    name:'查得率',
                    type:'line',
                    data:qrySituation.checkRate
                },
                {
                    name:'累计查询件数',
                    type:'bar',
                    yAxisIndex: 1,
                    data:qrySituation.qryNum
                },
            ]
        };
        myChart2.setOption(option2);
    </script>
    </body>
    </html>