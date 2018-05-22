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
        <title>关于征信机构</title>

        <link rel="stylesheet" href="static/css/font-awesome.min.css">
        <link rel="stylesheet" href="static/css/bootstrap.css">
        <link rel="stylesheet" href="static/css/animate.css"/>
        <link rel="stylesheet" href="static/css/main.css">
        <link rel="stylesheet" href="static/css/style.css">
        <link rel="stylesheet" href="static/css/pager.css">
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
                        <a href="cisp4">数据统计<i class="fa fa-arrow-circle-right pr-10 colored"></i></a>
                        <a href="cisp5"  class="tab-bar-show">DIGEST<i class="fa fa-arrow-circle-right pr-10 colored"></i></a>
                        <a href="cisp6">加入CISP<i class="fa fa-arrow-circle-right pr-10 colored"></i></a>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="section-top-border">
						<h3 class="mb-30">期刊列表</h3>
						<div class="progress-table-wrap" id="app">
							<div class="progress-table">
								<div class="table-head">
									<div class="serial">序号</div>
									<div class="visit">文件名</div>
									<div class="country">发行时间</div>
									<div class="percentage">操作</div>
								</div>
								<div v-for="(item,index) in data"  class="table-row">
									<div class="serial">{{(nowPage-1)*pageNum+index | formatIndex}}</div>
									<div class="visit">{{item.pName}}</div>
									<div class="country">{{item.uploadTime}}</div>
									<div class="percentage">
										<span><a target="_blank" v-bind:href="'getFile?fileName='+item.fileName">查看</a></span>
										<span><a  v-bind:href="'getFile?fileName='+item.fileName" v-bind:download="item.fileName">下载</a></span>
									</div>
								</div>
							</div>
						</div>
                        <div class="pagesection">
                            <ul class="pagination" id="page1">
                            </ul>
                            <div class="pageJump">
                                <span>跳转到</span>
                                <input type="text"/>
                                <span>页</span>
                                <button type="button" class="button">确定</button>
                            </div>
                        </div>
					</div>
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
    <script src="static/js/vue.js"></script>
    <script src="static/js/jquery.form.js"></script>
    <script src="static/js/comment.js"></script>
    <script src="static/js/pager.js"></script>
    <script>
        var isFirst = true;
        var htmlData = {
            data:[],
            nowPage:1,
            pageNum:10
        }
        var totalPage = 0 ;
        $(".qqWrap").hover(function(){
            $("#qq").addClass("animated tada");
        },function(){
            $("#qq").removeClass("animated tada");
        })

        function getData(page){
            var data = {"pageIndex" : page}
            $.ajax({
                type:"POST",
                url:"periodicals",
                data:data,
                dataType:"json",
                success:function(result){
                    console.log(result);
                    totalPage = result.result.result.totalPages;
                    htmlData.data = result.result.result.content;
                    if(isFirst) {
                        isFirst = false;
                        Page({
                            num:totalPage,					//页码数
                            startnum:1,				//指定页码
                            elem:$('#page1'),		//指定的元素
                            callback:function(n){	//回调函数
                                htmlData.nowPage = n;
                                getData(n);
                            }
                        });
                    }

                },
                error:function(err){
                    alert("数据加载失败请稍后再试");
                }
                
            })
        }
        getData(1);
        // $(function(){
        //     getData();
            
            
        // })
        
        var vm = new Vue({
            el:"#app",
            data:htmlData,
            filters:{
                formatIndex:function(value){
                    value = value+1;
                    if(value < 10){
                        value = "0"+value
                    }
                    return value;
                }
            },
            mounted:function(){
                this.$nextTick(function() {

                });
            }
        })
    </script>
    </body>
    </html>